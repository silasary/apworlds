import json
import os
import pprint
import re
import textwrap
import zipfile
from decimal import Decimal, InvalidOperation
from datetime import datetime
import xml.etree.ElementTree as ET

# CONFIG
SCRIPT_DIR = os.path.dirname(__file__)
WORKBOOK_PATH = os.path.join(SCRIPT_DIR, "goldeneye_ap_sheets.xlsx")
ACTIVE_WORLD_DIR = os.path.normpath(os.path.join(SCRIPT_DIR, ".."))
APWORLD_OUTPUT_PATH = os.path.join(ACTIVE_WORLD_DIR, "goldeneye.apworld")
YAML_OUTPUT_PATH = os.path.join(ACTIVE_WORLD_DIR, "goldeneye.yaml")
CLIENT_SHEET_REFERENCE_PATH = os.path.normpath(
    os.path.join(SCRIPT_DIR, "client_sheet_reference.py")
)
REQUIRED_PACKAGE_RELATIVE_PATHS = [
    "__init__.py",
    "Items.py",
    "Locations.py",
    "Options.py",
    "Regions.py",
    "Rules.py",
    "GoldeneyeClient.py",
    "client_data.py",
    "archipelago.json",
    os.path.join("docs", "setup_en.md"),
]
OBSOLETE_GENERATED_SPLIT_FILES = [
    "_client_data.py",
    "_generated_items.py",
    "_generated_locations.py",
    "_generated_options.py",
    "_generated_regions.py",
    "_generated_rules.py",
]

REQUIRED_SHEET_NAMES = ["Items", "Locations", "Regions", "Rules", "Options", "Client"]


def snake_to_pascal(name: str) -> str:
    return "".join(part.capitalize() for part in name.strip().split("_") if part)


def get_option_class_name(name: str, option_type: str) -> str:
    class_name = snake_to_pascal(name)
    if option_type == "DeathLink" and class_name == "DeathLink":
        return "DeathLinkOption"
    return class_name


def append_formatted_assignment(lines: list[str], name: str, value, width: int = 100) -> None:
    rendered = pprint.pformat(
        value,
        compact=True,
        indent=4,
        sort_dicts=False,
        width=width,
    ).splitlines()
    lines.append(f"{name} = {rendered[0]}")
    lines.extend(rendered[1:])


def append_wrapped_docstring(
    lines: list[str], text: str, indent: str = "    ", width: int = 100
) -> None:
    lines.append(f'{indent}"""')
    wrapped_lines = textwrap.wrap(" ".join(text.split()), width=max(20, width - len(indent))) or [""]
    lines.extend(f"{indent}{line}" for line in wrapped_lines)
    lines.append(f'{indent}"""')


def append_literal_list_assignment(lines: list[str], name: str, values: list[object]) -> None:
    lines.append(f"{name} = [")
    lines.extend(f"    {value!r}," for value in values)
    lines.append("]")


def column_index_from_cell_ref(cell_ref: str) -> int:
    letters = "".join(ch for ch in cell_ref if ch.isalpha())
    index = 0
    for char in letters:
        index = index * 26 + (ord(char.upper()) - ord("A") + 1)
    return index - 1


def read_shared_strings(archive: zipfile.ZipFile) -> list[str]:
    try:
        xml_bytes = archive.read("xl/sharedStrings.xml")
    except KeyError:
        return []

    namespace = {"x": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}
    root = ET.fromstring(xml_bytes)
    values = []
    for item in root.findall("x:si", namespace):
        text_parts = [node.text or "" for node in item.findall(".//x:t", namespace)]
        values.append("".join(text_parts))
    return values


def sheet_paths_by_name(archive: zipfile.ZipFile) -> dict[str, str]:
    workbook_ns = {"x": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}
    rels_ns = {"r": "http://schemas.openxmlformats.org/package/2006/relationships"}
    workbook = ET.fromstring(archive.read("xl/workbook.xml"))
    rels = ET.fromstring(archive.read("xl/_rels/workbook.xml.rels"))

    relationship_targets = {
        rel.attrib["Id"]: rel.attrib["Target"]
        for rel in rels.findall("r:Relationship", rels_ns)
    }

    paths = {}
    for sheet in workbook.findall("x:sheets/x:sheet", workbook_ns):
        sheet_name = sheet.attrib["name"]
        relationship_id = sheet.attrib["{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id"]
        target = relationship_targets[relationship_id].lstrip("/")
        if not target.startswith("xl/"):
            target = f"xl/{target}"
        paths[sheet_name] = target
    return paths


def read_cell_value(cell, shared_strings: list[str]) -> str:
    namespace = {"x": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}
    cell_type = cell.attrib.get("t")

    if cell_type == "inlineStr":
        return "".join(node.text or "" for node in cell.findall(".//x:t", namespace))

    value_node = cell.find("x:v", namespace)
    if value_node is None or value_node.text is None:
        return ""

    value = value_node.text
    if cell_type == "s":
        return shared_strings[int(value)]
    if cell_type == "b":
        return "TRUE" if value == "1" else "FALSE"
    if cell_type is None:
        try:
            number = Decimal(value)
        except InvalidOperation:
            return value
        if number == number.to_integral_value():
            return str(int(number))
    return value


def rows_to_dicts(rows: list[list[str]]) -> list[dict[str, str]]:
    """Convert rows to a list of dicts using row 1 as headers."""
    if len(rows) < 2:
        return []
    headers = rows[0]
    result = []
    for row in rows[1:]:
        d = {}
        for i, h in enumerate(headers):
            d[h] = row[i] if i < len(row) else ""
        # Skip completely empty rows
        if any(v.strip() for v in d.values()):
            result.append(d)
    return result


def load_workbook_data(path: str) -> dict[str, list[dict[str, str]]]:
    """Load required workbook tabs from a local .xlsx file."""
    if not os.path.exists(path):
        raise FileNotFoundError(f"Workbook not found: {path}")

    workbook_data = {}
    with zipfile.ZipFile(path, "r") as archive:
        shared_strings = read_shared_strings(archive)
        paths = sheet_paths_by_name(archive)
        missing_sheets = [name for name in REQUIRED_SHEET_NAMES if name not in paths]
        if missing_sheets:
            raise ValueError(f"Workbook is missing required sheets: {', '.join(missing_sheets)}")

        namespace = {"x": "http://schemas.openxmlformats.org/spreadsheetml/2006/main"}
        for sheet_name in REQUIRED_SHEET_NAMES:
            root = ET.fromstring(archive.read(paths[sheet_name]))
            rows = []
            for row in root.findall(".//x:sheetData/x:row", namespace):
                values = []
                for cell in row.findall("x:c", namespace):
                    column_index = column_index_from_cell_ref(cell.attrib["r"])
                    while len(values) < column_index:
                        values.append("")
                    values.append(read_cell_value(cell, shared_strings))
                rows.append(values)
            workbook_data[sheet_name] = rows_to_dicts(rows)

    return workbook_data


KEYPICKUP_ALIAS_SPLIT_RE = re.compile(r"[|\r\n]+")
MISSION_ITEM_LOGIC_TOKEN_RE = re.compile(r"\|([^|]+)\|")
MISSION_NAME_SPLIT_RE = re.compile(r"\s*/\s*|[|\r\n]+")


def split_keypickup_aliases(raw: str) -> list[str]:
    text = (raw or "").strip()
    if not text:
        return []
    return [part.strip() for part in KEYPICKUP_ALIAS_SPLIT_RE.split(text) if part.strip()]


def split_sheet_mission_names(raw: str) -> list[str]:
    text = (raw or "").strip()
    if not text:
        return []
    return [part.strip() for part in MISSION_NAME_SPLIT_RE.split(text) if part.strip()]


def normalize_mission_item_name(name: str) -> str:
    return re.sub(r"[^a-z0-9]+", " ", (name or "").strip().lower()).strip()


def iter_mission_item_aliases(row: dict) -> list[str]:
    aliases: list[str] = []
    for field in ("item_name", "item", "vincent_name"):
        value = (row.get(field, "") or "").strip()
        if value and value not in aliases:
            aliases.append(value)
    return aliases


def build_mission_item_alias_tables(items: list[dict]) -> tuple[dict[tuple[str, str], str], dict[str, str]]:
    region_aliases: dict[tuple[str, str], str] = {}
    global_alias_sets: dict[str, set[str]] = {}

    for row in items:
        item_name = (row.get("item_name", "") or "").strip()
        if not item_name:
            continue

        aliases = [
            normalize_mission_item_name(alias)
            for alias in iter_mission_item_aliases(row)
            if normalize_mission_item_name(alias)
        ]
        missions = split_sheet_mission_names(row.get("level_specific", ""))

        for alias in aliases:
            global_alias_sets.setdefault(alias, set()).add(item_name)

        for mission in missions:
            mission_name = mission.strip()
            if not mission_name:
                continue
            for alias in aliases:
                region_aliases[(mission_name, alias)] = item_name

    global_aliases: dict[str, str] = {}
    for alias, item_names in global_alias_sets.items():
        if len(item_names) == 1:
            global_aliases[alias] = next(iter(item_names))

    return region_aliases, global_aliases

V02_TRAP_OPTION_NAMES = {"trap_chance", "enemy_rockets_trap", "holster_gun_trap"}


def extract_keypickup_item_name(location_name: str) -> str:
    item_name = location_name.split(" - ", 1)[1] if " - " in location_name else location_name
    return re.sub(r" \((Agent|Secret Agent|Double Agent)\)$", "", item_name).strip()


def extract_mission_logic_item_names(raw_logic: str) -> list[str]:
    names: list[str] = []
    for token in MISSION_ITEM_LOGIC_TOKEN_RE.findall(raw_logic or ""):
        cleaned = token.strip()
        if cleaned and cleaned not in names:
            names.append(cleaned)
    return names


def resolve_mission_item_name(
    region: str,
    raw_name: str,
    known_item_names: set[str],
    region_aliases: dict[tuple[str, str], str],
    global_aliases: dict[str, str],
) -> Optional[str]:
    normalized_name = normalize_mission_item_name(raw_name)
    if not normalized_name:
        return None

    region_alias = region_aliases.get((region, normalized_name))
    if region_alias and region_alias in known_item_names:
        return region_alias

    global_alias = global_aliases.get(normalized_name)
    if global_alias and global_alias in known_item_names:
        return global_alias

    for item_name in known_item_names:
        if normalize_mission_item_name(item_name) == normalized_name:
            return item_name
    return None


def build_v02_item_rows(items, locations, rules=None):
    existing_rows = [dict(row) for row in items]
    known_item_names = {
        row.get("item_name", "").strip()
        for row in existing_rows
        if row.get("item_name", "").strip()
    }
    region_aliases, global_aliases = build_mission_item_alias_tables(existing_rows)
    alias_map = _build_item_alias_map(existing_rows)

    required_item_names: set[str] = set()
    for loc in locations:
        if not is_active_row(loc):
            continue
        region = loc.get("region", "").strip()
        if loc.get("category", "").strip() == "KeyPickup":
            raw_name = extract_keypickup_item_name(loc.get("location_name", ""))
            resolved = resolve_mission_item_name(
                region, raw_name, known_item_names, region_aliases, global_aliases
            )
            if resolved:
                required_item_names.add(resolved)
        for raw_name in extract_mission_logic_item_names(loc.get("vincent_logic", "")):
            resolved = resolve_mission_item_name(
                region, raw_name, known_item_names, region_aliases, global_aliases
            )
            if resolved:
                required_item_names.add(resolved)

    for rule in rules or []:
        has_gun_col_val = rule.get("has_gun", "").strip().lower()
        has_explosive_col_val = rule.get("has_explosive", "").strip().lower()
        rule_type = rule.get("rule_type", "").strip()
        if has_gun_col_val not in ("yes", "no") and has_explosive_col_val not in ("yes", "no") and not is_active_row(rule):
            continue
        if has_gun_col_val in ("yes", "no") or has_explosive_col_val in ("yes", "no") or is_active_row(rule):
            groups = _parse_required_item(
                rule.get("required_item", "").strip(),
                has_gun_col_val == "yes",
                has_explosive_col_val == "yes",
                alias_map,
            )
            for group in groups:
                for item_name in group:
                    if item_name in ("__GUN__", "__EXPLOSIVE__") or item_name.startswith("__PROG__"):
                        continue
                    if item_name in known_item_names:
                        required_item_names.add(item_name)

    active_or_required_rows = []
    for row in existing_rows:
        row_name = row.get("item_name", "").strip()
        if is_active_row(row) or row_name in required_item_names:
            promoted_row = dict(row)
            promoted_row["in_v02"] = "Yes"
            active_or_required_rows.append(promoted_row)

    return active_or_required_rows


def build_v02_option_rows(options):
    promoted_rows = []
    for row in options:
        option_name = row.get("option_name", "").strip()
        if is_active_row(row) or option_name in V02_TRAP_OPTION_NAMES:
            promoted_row = dict(row)
            promoted_row["in_v02"] = "Yes"
            promoted_rows.append(promoted_row)
    return promoted_rows


def build_mission_item_mission_table(items):
    mission_table = {}
    for row in items:
        item_name = row.get("item_name", "").strip()
        if not item_name:
            continue

        ap_code = parse_int_cell(row.get("ap_code", ""))
        if ap_code is None:
            continue

        missions = split_sheet_mission_names(row.get("level_specific", ""))
        if not missions:
            continue

        mission_table[ap_code] = missions
    return mission_table


def build_mission_item_match_table(locations, items):
    known_item_names = {
        row.get("item_name", "").strip()
        for row in items
        if row.get("item_name", "").strip()
    }
    region_aliases, global_aliases = build_mission_item_alias_tables(items)
    item_name_to_ap_code = {
        row.get("item_name", "").strip(): parse_int_cell(row.get("ap_code", ""))
        for row in items
        if row.get("item_name", "").strip()
    }
    match_table: dict[int, dict] = {}

    def ensure_match_def(item_name: str):
        ap_code = item_name_to_ap_code.get(item_name)
        if ap_code is None:
            return None
        return match_table.setdefault(
            ap_code,
            {
                "item_name": item_name,
                "match_keys": set(),
            },
        )

    for loc in locations:
        if not is_active_row(loc):
            continue

        region = loc.get("region", "").strip()
        if not region:
            continue

        if loc.get("category", "").strip() == "KeyPickup":
            raw_name = extract_keypickup_item_name(loc.get("location_name", ""))
            resolved_name = resolve_mission_item_name(
                region, raw_name, known_item_names, region_aliases, global_aliases
            )
            match_def = ensure_match_def(resolved_name) if resolved_name else None
            if match_def is not None:
                match_def["match_keys"].add(normalize_mission_item_name(raw_name))
                match_def["match_keys"].add(normalize_mission_item_name(resolved_name))
                for alias in get_keypickup_detection_aliases(loc):
                    match_def["match_keys"].add(normalize_mission_item_name(alias))

        for raw_name in extract_mission_logic_item_names(loc.get("vincent_logic", "")):
            resolved_name = resolve_mission_item_name(
                region, raw_name, known_item_names, region_aliases, global_aliases
            )
            match_def = ensure_match_def(resolved_name) if resolved_name else None
            if match_def is not None:
                match_def["match_keys"].add(normalize_mission_item_name(raw_name))
                match_def["match_keys"].add(normalize_mission_item_name(resolved_name))

    serialized_matches = {}
    for item_id in sorted(match_table):
        serialized_matches[item_id] = {
            "item_name": match_table[item_id]["item_name"],
            "match_keys": sorted(key for key in match_table[item_id]["match_keys"] if key),
        }
    return serialized_matches


def get_keypickup_detection_aliases(loc: dict) -> list[str]:
    aliases: list[str] = []
    canonical_item_name = extract_keypickup_item_name(loc.get("location_name", "").strip())
    if canonical_item_name:
        aliases.append(canonical_item_name)

    for column_name in ("ingame_title_text", "ingame_pickup_text"):
        value = (loc.get(column_name, "") or "").strip()
        if value:
            aliases.append(value)

    aliases.extend(split_keypickup_aliases(loc.get("detection_aliases", "")))

    deduped: list[str] = []
    seen: set[str] = set()
    for alias in aliases:
        lowered = alias.lower()
        if lowered in seen:
            continue
        seen.add(lowered)
        deduped.append(alias)
    return deduped


MISSION_DIFFICULTY_NAMES = {
    1: "Agent",
    2: "Secret Agent",
    3: "Double Agent",
}
MISSION_DIFFICULTY_SUFFIX_TO_CODE = {
    difficulty_name: difficulty_code
    for difficulty_code, difficulty_name in MISSION_DIFFICULTY_NAMES.items()
}
MISSION_DIFFICULTY_CODE_TO_SUFFIX = {
    difficulty_code: difficulty_name
    for difficulty_name, difficulty_code in MISSION_DIFFICULTY_SUFFIX_TO_CODE.items()
}
SUPPORTED_OPTION_TYPES = {"Choice", "Range", "Toggle", "DeathLink"}
FALSEY_OPTION_KEYS = {"false", "off", "none", "no", "disabled", "disable"}
TRUTHY_OPTION_KEYS = {"true", "on", "yes", "enabled", "enable"}
EMPTY_SHEET_VALUES = {"", "???", "tbd", "none", "null", "n/a"}
PROGRESSIVE_GUN_OPTION_NAME = "progressive_weapons"
CLIENT_DATA_BANNER_WIDTH = 120
OBJECTIVE_FLAG_BASE_ADDRESS = 0x75D58
FREESTANDING_WEAPON_IDS_BY_NAME = {
    "Dam - Sniper Rifle": 17,
    "Surface 1 - Grenade Launcher": 24,
    "Bunker 2 - Throwing Knives": 3,
    "Archives - PP7": 4,
    "Depot - Rocket Launcher": 25,
    "Train - RC-P90": 14,
}
PROGRESSIVE_GUN_AP_CODE_MIN = 17310000
PROGRESSIVE_GUN_AP_CODE_MAX = 17320000

ITEM_EFFECT_TYPE_ALIASES = {
    "weapon": "weapon",
    "weapon_ammo": "weapon",
    "ammo": "ammo",
    "ammo_grant": "ammo",
    "grant_ammo": "ammo",
    "ammo_cache": "multi_ammo",
    "multi_ammo": "multi_ammo",
    "heal_full": "health_full",
    "health_full": "health_full",
    "full_heal": "health_full",
    "full_health": "health_full",
    "armor_full": "armor_full",
    "body_armor_full": "armor_full",
    "full_armor": "armor_full",
    "enemy_rockets_trap": "enemy_rockets_trap",
    "enemy_rockets": "enemy_rockets_trap",
    "holster_gun_trap": "holster_gun_trap",
    "holster_gun": "holster_gun_trap",
    "goldeneye_trap": "goldeneye_trap",
}

HUD_AMMO_OFFSET_TO_LIVE_OFFSET = {
    0x0C84: 0x1134,  # 9mm
    0x0C90: 0x113C,  # rifle
    0x0C9C: 0x1140,  # shells
    0x0CA8: 0x1158,  # knives
    0x0CB4: 0x115C,  # grenade rounds
    0x0CC0: 0x1148,  # rockets
    0x0CD8: 0x1144,  # grenades
    0x0CE4: 0x1160,  # magnum
    0x0CF0: 0x1164,  # golden gun
    0x0CFC: 0x114C,  # remote mines
    0x0D08: 0x1154,  # timed mines
    0x0D14: 0x1150,  # proximity mines
    0x1527C: 0x1190,  # watch laser
    0x152AC: 0x11A0,  # tank
}

LOADOUT_GADGET_ITEM_IDS = {
    "Covert Modem (Dam Loadout)": ("Covert Modem", 47),
    "Key Analyzer Case (Bunker 1 Loadout)": ("Key Analyzer Case", 46),
    "Datathief (Bunker 1 Loadout)": ("Datathief", 55),
    "Camera (Bunker 1 / Silo Loadout)": ("Camera", 40),
    "Plastique (Silo Loadout)": ("Plastique", 34),
    "Tracker Bug (Frigate Loadout)": ("Tracker Bug", 47),
    "Bomb Defuser (Frigate Loadout)": ("Bomb Defuser", 39),
    "Special Timed Mine (Surface 2 Loadout)": ("Special Timed Mine", 29),
    "Watch Magnet (Bunker 2 / Archives Loadout)": ("Watch Magnet", 60),
}

LEGACY_ITEM_EFFECT_DEFS = {
    "Ammo Cache": {
        "effect_type": "multi_ammo",
        "ammo_targets": [
            {"ammo_offset": 0x1134, "ammo_grant": 60, "ammo_max": 320},
            {"ammo_offset": 0x113C, "ammo_grant": 60, "ammo_max": 190},
        ],
    },
    "Body Armor": {
        "effect_type": "armor_full",
    },
    "Health Pack": {
        "effect_type": "health_full",
    },
    "Enemy Rockets Trap": {
        "effect_type": "enemy_rockets_trap",
    },
    "Holster Gun Trap": {
        "effect_type": "holster_gun_trap",
    },
    "Goldeneye Trap": {
        "effect_type": "goldeneye_trap",
    },
    "Klobb": {
        "effect_type": "weapon",
        "weapon_id": 7,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Hunting Knife": {
        "effect_type": "weapon",
        "weapon_id": 2,
    },
    "Throwing Knife": {
        "effect_type": "weapon",
        "weapon_id": 3,
        "ammo_offset": 0x1158,
        "ammo_grant": 5,
        "ammo_max": 10,
    },
    "Taser": {
        "effect_type": "weapon",
        "weapon_id": 31,
    },
    "PP7 Special Issue": {
        "effect_type": "weapon",
        "weapon_id": 4,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "PP7 (Silenced)": {
        "effect_type": "weapon",
        "weapon_id": 5,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Silenced PP7": {
        "effect_type": "weapon",
        "weapon_id": 5,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "DD44 Dostovei": {
        "effect_type": "weapon",
        "weapon_id": 6,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "KF7 Soviet": {
        "effect_type": "weapon",
        "weapon_id": 8,
        "ammo_offset": 0x113C,
        "ammo_grant": 60,
        "ammo_max": 400,
    },
    "ZMG (9 mm)": {
        "effect_type": "weapon",
        "weapon_id": 9,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "ZMG 9mm": {
        "effect_type": "weapon",
        "weapon_id": 9,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "D5K Deutsche": {
        "effect_type": "weapon",
        "weapon_id": 10,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "D5K (Silenced)": {
        "effect_type": "weapon",
        "weapon_id": 11,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Silenced D5K": {
        "effect_type": "weapon",
        "weapon_id": 11,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Sniper Rifle": {
        "effect_type": "weapon",
        "weapon_id": 17,
        "ammo_offset": 0x113C,
        "ammo_grant": 32,
        "ammo_max": 400,
    },
    "Grenade": {
        "effect_type": "weapon",
        "weapon_id": 26,
        "ammo_offset": 0x1144,
        "ammo_grant": 3,
        "ammo_max": 12,
    },
    "Hand Grenades": {
        "effect_type": "weapon",
        "weapon_id": 26,
        "ammo_offset": 0x1144,
        "ammo_grant": 3,
        "ammo_max": 12,
    },
    "Phantom": {
        "effect_type": "weapon",
        "weapon_id": 12,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Timed Mine": {
        "effect_type": "weapon",
        "weapon_id": 27,
        "ammo_offset": 0x1154,
        "ammo_grant": 3,
        "ammo_max": 10,
    },
    "Timed Mines": {
        "effect_type": "weapon",
        "weapon_id": 27,
        "ammo_offset": 0x1154,
        "ammo_grant": 3,
        "ammo_max": 10,
    },
    "AR33 Assault Rifle": {
        "effect_type": "weapon",
        "weapon_id": 13,
        "ammo_offset": 0x113C,
        "ammo_grant": 60,
        "ammo_max": 400,
    },
    "Proximity Mine": {
        "effect_type": "weapon",
        "weapon_id": 28,
        "ammo_offset": 0x1150,
        "ammo_grant": 3,
        "ammo_max": 10,
    },
    "Proximity Mines": {
        "effect_type": "weapon",
        "weapon_id": 28,
        "ammo_offset": 0x1150,
        "ammo_grant": 3,
        "ammo_max": 10,
    },
    "RC-P90": {
        "effect_type": "weapon",
        "weapon_id": 14,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Remote Mine": {
        "effect_type": "weapon",
        "weapon_id": 29,
        "ammo_offset": 0x114C,
        "ammo_grant": 3,
        "ammo_max": 10,
        "extra_inventory_ids": [30],
    },
    "Remote Mines": {
        "effect_type": "weapon",
        "weapon_id": 29,
        "ammo_offset": 0x114C,
        "ammo_grant": 3,
        "ammo_max": 10,
        "extra_inventory_ids": [30],
    },
    "Watch Laser": {
        "effect_type": "weapon",
        "weapon_id": 23,
        "ammo_offset": 0x1190,
        "ammo_grant": 1000,
        "ammo_max": 1000,
    },
    "Shotgun": {
        "effect_type": "weapon",
        "weapon_id": 15,
        "ammo_offset": 0x1140,
        "ammo_grant": 20,
        "ammo_max": 100,
    },
    "Cougar Magnum": {
        "effect_type": "weapon",
        "weapon_id": 18,
        "ammo_offset": 0x1160,
        "ammo_grant": 30,
        "ammo_max": 200,
    },
    "Silver PP7": {
        "effect_type": "weapon",
        "weapon_id": 20,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
    "Automatic Shotgun": {
        "effect_type": "weapon",
        "weapon_id": 16,
        "ammo_offset": 0x1140,
        "ammo_grant": 20,
        "ammo_max": 100,
    },
    "Military Laser": {
        "effect_type": "weapon",
        "weapon_id": 22,
    },
    "Grenade Launcher": {
        "effect_type": "weapon",
        "weapon_id": 24,
        "ammo_offset": 0x115C,
        "ammo_grant": 6,
        "ammo_max": 12,
    },
    "Rocket Launcher": {
        "effect_type": "weapon",
        "weapon_id": 25,
        "ammo_offset": 0x1148,
        "ammo_grant": 2,
        "ammo_max": 3,
    },
    "Tank (Missiles)": {
        "effect_type": "weapon",
        "weapon_id": 32,
        "ammo_offset": 0x11A0,
        "ammo_grant": 50,
        "ammo_max": 50,
    },
    "Golden Gun": {
        "effect_type": "weapon",
        "weapon_id": 19,
        "ammo_offset": 0x1164,
        "ammo_grant": 1,
        "ammo_max": 1,
    },
    "Gold PP7": {
        "effect_type": "weapon",
        "weapon_id": 21,
        "ammo_offset": 0x1134,
        "ammo_grant": 60,
        "ammo_max": 320,
    },
}

PROGRESSIVE_GUN_BASE_ITEM_NAMES = {"progressive weapon", "progressive weapons"}


def is_active_row(row):
    return row.get("in_v02", "").strip().lower() == "yes"


def normalize_unlock_name(name: str) -> str:
    return re.sub(r"\s+Unlock$", "", name.strip())


def mission_name_to_option_key(name: str) -> str:
    return re.sub(r"[^a-z0-9]+", "_", name.strip().lower()).strip("_")


def parse_choice_value_map(raw: str) -> dict[str, int]:
    text = (raw or "").strip()
    if not text:
        return {}

    try:
        parsed = json.loads(text)
    except json.JSONDecodeError:
        parsed = None

    if isinstance(parsed, dict):
        value_map = {}
        for key, value in parsed.items():
            if isinstance(value, bool):
                value_map[str(key).strip()] = int(value)
            elif isinstance(value, int):
                value_map[str(key).strip()] = value
            elif isinstance(value, str) and value.strip().lstrip("-").isdigit():
                value_map[str(key).strip()] = int(value.strip())
        if value_map:
            return value_map

    value_map = {}
    for key, value in re.findall(r'"?([A-Za-z0-9_]+)"?\s*:\s*(-?\d+)', text):
        value_map[key.strip()] = int(value)
    return value_map


def parse_choice_tokens(raw: str) -> list[str]:
    value_map = parse_choice_value_map(raw)
    if value_map:
        return list(value_map.keys())

    tokens = []
    for token in re.findall(r"[A-Za-z_][A-Za-z0-9_]*", raw or ""):
        if token not in tokens:
            tokens.append(token)
    return tokens


def get_first_non_empty_value(row, *keys: str) -> str:
    for key in keys:
        value = row.get(key, "")
        if value is not None:
            text = str(value).strip()
            if text:
                return text
    return ""


def parse_int_cell(raw: str):
    text = (raw or "").strip()
    if not text or text.lower() in EMPTY_SHEET_VALUES:
        return None
    if re.fullmatch(r"-?0x[0-9a-f]+", text, re.IGNORECASE):
        return int(text, 16)
    if re.fullmatch(r"-?\d+", text):
        return int(text, 10)
    return None


def parse_int_list_cell(raw: str) -> list[int]:
    text = (raw or "").strip()
    if not text or text.lower() in EMPTY_SHEET_VALUES:
        return []

    try:
        parsed = json.loads(text)
    except json.JSONDecodeError:
        parsed = None

    values: list[int] = []
    if isinstance(parsed, list):
        for value in parsed:
            parsed_value = parse_int_cell(str(value))
            if parsed_value is not None:
                values.append(parsed_value)
        return values

    for token in re.split(r"[,\s|;/]+", text):
        parsed_value = parse_int_cell(token)
        if parsed_value is not None:
            values.append(parsed_value)
    return values


def normalize_item_effect_type(raw: str):
    text = (raw or "").strip()
    if not text:
        return None
    normalized = re.sub(r"[^a-z0-9]+", "_", text.lower()).strip("_")
    if not normalized or normalized in {"none", "filler", "tbd"} or normalized.startswith("write_"):
        return None
    return ITEM_EFFECT_TYPE_ALIASES.get(normalized)


def has_explicit_item_effect_metadata(row) -> bool:
    if get_first_non_empty_value(row, "effect_type", "item_effect", "effect"):
        return True
    if normalize_item_effect_type(get_first_non_empty_value(row, "ram_effect")) is not None:
        return True

    structured_keys = (
        "ammo_offset",
        "effect_offset_hex",
        "effect_offset",
        "weapon_id",
        "ammo_grant",
        "effect_grant",
        "grant_amount",
        "effect_amount",
        "ammo_max",
        "effect_max",
        "max_amount",
        "extra_inventory_ids",
        "secondary_weapon_ids",
    )
    return any(get_first_non_empty_value(row, key) for key in structured_keys)


def normalize_live_ammo_offset(ammo_offset):
    if ammo_offset is None:
        return None
    return HUD_AMMO_OFFSET_TO_LIVE_OFFSET.get(ammo_offset, ammo_offset)


def is_progressive_gun_base_row(row) -> bool:
    if not is_active_row(row):
        return False

    ap_code = parse_int_cell(row.get("ap_code", ""))
    if ap_code is None or not (PROGRESSIVE_GUN_AP_CODE_MIN <= ap_code < PROGRESSIVE_GUN_AP_CODE_MAX):
        return False

    item_name = row.get("item_name", "").strip().lower()
    if item_name in PROGRESSIVE_GUN_BASE_ITEM_NAMES:
        return True

    return ap_code == PROGRESSIVE_GUN_AP_CODE_MIN and parse_int_cell(row.get("weapon_id", "")) is None


def get_progressive_gun_base_row(items):
    candidates = [row for row in items if is_progressive_gun_base_row(row)]
    if not candidates:
        return None
    return sorted(candidates, key=lambda row: parse_int_cell(row.get("ap_code", "")) or 0)[0]


def build_item_effect_def(row):
    item_name = row.get("item_name", "").strip()
    category = row.get("category", "").strip()
    classification = row.get("classification", "").strip()
    if category in {"Unlock", "Event"} or classification == "event":
        return None
    if is_progressive_gun_base_row(row):
        return None

    legacy_effect = LEGACY_ITEM_EFFECT_DEFS.get(item_name)
    effect_type = normalize_item_effect_type(
        get_first_non_empty_value(row, "effect_type", "item_effect", "effect", "ram_effect")
    )

    if effect_type is None:
        if legacy_effect is None:
            return None
        effect_def = dict(legacy_effect)
        effect_def["item_name"] = item_name
        return effect_def

    effect_def = dict(legacy_effect) if legacy_effect is not None else {}
    effect_def["item_name"] = item_name
    effect_def["effect_type"] = effect_type

    ammo_offset = parse_int_cell(
        get_first_non_empty_value(row, "ammo_offset", "effect_offset_hex", "effect_offset", "ram_offset")
    )
    ammo_offset = normalize_live_ammo_offset(ammo_offset)
    ammo_grant = parse_int_cell(
        get_first_non_empty_value(row, "ammo_grant", "effect_grant", "grant_amount", "effect_amount", "grant")
    )
    ammo_max = parse_int_cell(
        get_first_non_empty_value(row, "ammo_max", "effect_max", "max_amount", "max")
    )
    weapon_id = parse_int_cell(get_first_non_empty_value(row, "weapon_id"))
    extra_inventory_ids = parse_int_list_cell(
        get_first_non_empty_value(row, "extra_inventory_ids", "secondary_weapon_ids")
    )

    if effect_type in {"weapon", "ammo"}:
        if ammo_offset is not None:
            effect_def["ammo_offset"] = ammo_offset
        if ammo_grant is not None:
            effect_def["ammo_grant"] = ammo_grant
        if ammo_max is not None:
            effect_def["ammo_max"] = ammo_max

    if effect_type == "weapon":
        if weapon_id is not None:
            effect_def["weapon_id"] = weapon_id
        if extra_inventory_ids:
            effect_def["extra_inventory_ids"] = extra_inventory_ids

    return effect_def


def build_item_effect_defs(items):
    item_effect_defs = {}
    for row in items:
        if not is_active_row(row):
            continue
        ap_code = parse_int_cell(row.get("ap_code", ""))
        effect_def = build_item_effect_def(row)
        if ap_code is None or effect_def is None:
            continue
        item_effect_defs[ap_code] = effect_def
    return item_effect_defs


def build_loadout_gadget_defs(items):
    loadout_gadget_defs = {}
    for row in items:
        item_name = row.get("item_name", "").strip()
        if item_name not in LOADOUT_GADGET_ITEM_IDS:
            continue

        ap_code = parse_int_cell(row.get("ap_code", ""))
        if ap_code is None:
            continue

        display_name, item_id = LOADOUT_GADGET_ITEM_IDS[item_name]
        loadout_gadget_defs[ap_code] = {
            "item_name": display_name,
            "item_id": item_id,
        }

    return loadout_gadget_defs


def is_progressive_gun_row(row):
    if not is_active_row(row):
        return False

    ap_code = parse_int_cell(row.get("ap_code", ""))
    if ap_code is None or not (PROGRESSIVE_GUN_AP_CODE_MIN <= ap_code < PROGRESSIVE_GUN_AP_CODE_MAX):
        return False

    count = parse_int_cell(row.get("count", "")) or 0
    if count <= 0:
        return False

    effect_def = build_item_effect_def(row)
    return effect_def is not None and effect_def.get("effect_type") == "weapon"


def get_progressive_gun_rows(items):
    return sorted(
        [row for row in items if is_progressive_gun_row(row) and not is_progressive_gun_base_row(row)],
        key=lambda row: parse_int_cell(row.get("ap_code", "")) or 0,
    )


def get_active_unlock_rows(items):
    active = [item for item in items if is_active_row(item)]
    return [item for item in active if item.get("category", "").strip() == "Unlock"]


def get_active_unlock_names(items):
    return [normalize_unlock_name(item.get("item_name", "")) for item in get_active_unlock_rows(items)]


def find_active_option_row(options, option_name: str):
    for option in options:
        if is_active_row(option) and option.get("option_name", "").strip() == option_name:
            return option
    return None


def option_key_to_mission_name(option_key: str, mission_names):
    lookup = {mission_name_to_option_key(name): name for name in mission_names}
    return lookup.get(option_key.strip().lower())


def get_starting_mission_names(options, items):
    unlock_names = get_active_unlock_names(items)
    row = find_active_option_row(options, "starting_mission")
    if row is None:
        return unlock_names

    value_map = parse_choice_value_map(row.get("values_or_range", ""))
    if value_map:
        names = []
        for option_key, _ in sorted(value_map.items(), key=lambda item: item[1]):
            mission_name = option_key_to_mission_name(option_key, unlock_names)
            if mission_name is not None and mission_name not in names:
                names.append(mission_name)
        if names:
            return names

    names = []
    for token in parse_choice_tokens(row.get("values_or_range", "")):
        mission_name = option_key_to_mission_name(token, unlock_names)
        if mission_name is not None and mission_name not in names:
            names.append(mission_name)
    if names:
        return names

    return unlock_names


def get_extra_mission_names(options, items):
    unlock_names = get_active_unlock_names(items)
    starting_names = set(get_starting_mission_names(options, items))
    extras = [name for name in unlock_names if name not in starting_names]
    if extras:
        return extras

    row = find_active_option_row(options, "extra_locations")
    if row is None:
        return []

    tokens = parse_choice_tokens(row.get("values_or_range", "")) + parse_choice_tokens(row.get("description", ""))
    extras = []
    ignored_tokens = {"false", "true", "none", "both", "all", "extra", "locations", "location", "enable", "or"}
    for token in tokens:
        if token.lower() in ignored_tokens:
            continue
        mission_name = option_key_to_mission_name(token, unlock_names)
        if mission_name is not None and mission_name not in extras:
            extras.append(mission_name)
    return extras


def build_extra_location_selection_value_map(extra_mission_names):
    value_map = {"false": 0}
    for index, mission_name in enumerate(extra_mission_names, start=1):
        value_map[mission_name_to_option_key(mission_name)] = index
    if len(extra_mission_names) >= 2:
        value_map["both" if len(extra_mission_names) == 2 else "all"] = len(extra_mission_names) + 1
    return value_map


def normalize_extra_location_choice_key(choice_key: str, extra_mission_names):
    lowered = choice_key.strip().lower()
    if not lowered:
        return None
    if lowered in FALSEY_OPTION_KEYS:
        return "false"
    if lowered in {"both", "all"} and len(extra_mission_names) >= 2:
        return "both" if len(extra_mission_names) == 2 else "all"
    mission_name = option_key_to_mission_name(lowered, extra_mission_names)
    if mission_name is not None:
        return mission_name_to_option_key(mission_name)
    return lowered


def get_extra_location_choice_value_map(options, items):
    extra_mission_names = get_extra_mission_names(options, items)
    row = find_active_option_row(options, "extra_locations")
    if row is None:
        return build_extra_location_selection_value_map(extra_mission_names)

    explicit_map = parse_choice_value_map(row.get("values_or_range", ""))
    if not explicit_map:
        return build_extra_location_selection_value_map(extra_mission_names)

    value_map = {}
    for choice_key, choice_value in explicit_map.items():
        normalized_key = normalize_extra_location_choice_key(choice_key, extra_mission_names)
        if normalized_key is not None:
            value_map[normalized_key] = choice_value

    return value_map or build_extra_location_selection_value_map(extra_mission_names)


def build_extra_location_selection_sets(extra_mission_names, value_map=None):
    value_map = value_map or build_extra_location_selection_value_map(extra_mission_names)
    selection_sets = {}
    for choice_key, choice_value in value_map.items():
        lowered = choice_key.strip().lower()
        if lowered in FALSEY_OPTION_KEYS:
            selection_sets[choice_value] = []
            continue
        if lowered in {"both", "all"}:
            selection_sets[choice_value] = list(extra_mission_names)
            continue
        mission_name = option_key_to_mission_name(choice_key, extra_mission_names)
        if mission_name is not None:
            selection_sets[choice_value] = [mission_name]
    if not selection_sets:
        selection_sets[0] = []
    return selection_sets


def resolve_choice_option_values(option_name: str, raw_values: str, options, items):
    if option_name == "starting_mission":
        starting_names = get_starting_mission_names(options, items)
        return {
            mission_name_to_option_key(mission_name): index
            for index, mission_name in enumerate(starting_names, start=1)
        }

    if option_name == "extra_locations":
        return get_extra_location_choice_value_map(options, items)

    value_map = parse_choice_value_map(raw_values)
    if value_map:
        return value_map

    raw_choices = [part.strip() for part in parse_choice_tokens(raw_values) if part.strip()]
    return {choice_name: idx for idx, choice_name in enumerate(raw_choices)}


def resolve_choice_default(default: str, value_map: dict[str, int]) -> int:
    default_value = (default or "").strip()
    if default_value.lstrip("-").isdigit():
        return int(default_value)
    if default_value in value_map:
        return value_map[default_value]
    lowered = default_value.lower()
    if lowered in value_map:
        return value_map[lowered]
    if lowered in FALSEY_OPTION_KEYS and "false" in value_map:
        return value_map["false"]
    if lowered in {"both", "all"}:
        if "both" in value_map:
            return value_map["both"]
        if "all" in value_map:
            return value_map["all"]
    return min(value_map.values(), default=0)


def resolve_toggle_default(default: str, raw_values: str = "") -> int:
    default_value = (default or "").strip()
    lowered = default_value.lower()
    if lowered in TRUTHY_OPTION_KEYS:
        return 1
    if lowered in FALSEY_OPTION_KEYS:
        return 0

    value_map = parse_choice_value_map(raw_values)
    if default_value.lstrip("-").isdigit():
        numeric_default = int(default_value)
        if numeric_default in {0, 1}:
            return numeric_default
        for choice_key, choice_value in value_map.items():
            if choice_value != numeric_default:
                continue
            lowered_key = choice_key.strip().lower()
            if lowered_key in TRUTHY_OPTION_KEYS:
                return 1
            if lowered_key in FALSEY_OPTION_KEYS:
                return 0
        return 1 if numeric_default else 0

    if lowered in value_map:
        if lowered in TRUTHY_OPTION_KEYS:
            return 1
        if lowered in FALSEY_OPTION_KEYS:
            return 0
    return 0


def get_option_choice_value(option_name: str, choice_key: str, options, items, fallback: int) -> int:
    row = find_active_option_row(options, option_name)
    if row is None:
        return fallback
    value_map = resolve_choice_option_values(option_name, row.get("values_or_range", ""), options, items)
    return value_map.get(choice_key, fallback)


def get_stage_map_id(row) -> int | None:
    raw_map_id = row.get("map_id", "").strip()
    if not raw_map_id.isdigit():
        return None
    map_id = int(raw_map_id)
    if 1 <= map_id <= 20:
        return map_id
    return None


def is_stage_mission_clear_row(row) -> bool:
    return row.get("category", "").strip() == "MissionClear" and get_stage_map_id(row) is not None


def parse_stage_clear_name(name: str):
    stripped = name.strip()
    match = re.match(r"^(.*) - (Agent|Secret Agent|Double Agent) \(Clear\)$", stripped)
    if match:
        mission_name = match.group(1).strip()
        difficulty_name = match.group(2)
        return mission_name, MISSION_DIFFICULTY_SUFFIX_TO_CODE[difficulty_name]
    shared_match = re.match(r"^(.*) - \(Clear\)$", stripped)
    if shared_match:
        return shared_match.group(1).strip(), 0
    return None


def get_stage_mission_clear_rows(locations, difficulty_code: int):
    rows = []
    for loc in locations:
        if not is_active_row(loc) or not is_stage_mission_clear_row(loc):
            continue
        parsed = parse_stage_clear_name(loc.get("location_name", ""))
        if parsed is None:
            continue
        mission_name, parsed_difficulty_code = parsed
        if parsed_difficulty_code != difficulty_code:
            continue
        rows.append({
            "location_name": loc.get("location_name", "").strip(),
            "ap_code": loc.get("ap_code", "").strip(),
            "hex_addr": loc.get("hex_addr", "").strip(),
            "map_id": str(get_stage_map_id(loc) or 0),
            "region": loc.get("region", "").strip(),
            "mission_name": mission_name,
            "difficulty_code": difficulty_code,
        })
    return rows


def get_mission_clear_location_map(locations):
    """Map mission names to their clear location ids by difficulty."""
    mission_map = {}
    for loc in locations:
        if not is_active_row(loc) or not is_stage_mission_clear_row(loc):
            continue

        parsed = parse_stage_clear_name(loc.get("location_name", ""))
        if parsed is None:
            continue

        mission_name, difficulty_code = parsed
        map_id = str(get_stage_map_id(loc) or 0)
        mission_entry = mission_map.setdefault(
            mission_name,
            {
                "location_ids": {},
                "shared_location_id": None,
                "map_id": map_id,
                "region": loc.get("region", "").strip(),
            },
        )

        if mission_entry["map_id"] != map_id:
            raise ValueError(
                f"Mission clear rows for '{mission_name}' disagree on map_id: "
                f"{mission_entry['map_id']} vs {map_id}"
            )

        if difficulty_code == 0:
            mission_entry["shared_location_id"] = loc.get("ap_code", "").strip()
        else:
            mission_entry["location_ids"][difficulty_code] = loc.get("ap_code", "").strip()

    return mission_map


def get_per_difficulty_mission_clear_rows(locations):
    rows = []
    for difficulty_code in (1, 2, 3):
        rows.extend(get_stage_mission_clear_rows(locations, difficulty_code))
    return rows


def get_shared_mission_clear_rows(locations):
    return get_stage_mission_clear_rows(locations, 0)


def is_objective_row(row):
    return "Objective" in row.get("category", "").strip()


def is_runtime_objective_row(row):
    if row.get("in_v02", "").strip().lower() != "yes":
        return False
    if not is_objective_row(row):
        return False
    hex_addr = row.get("hex_addr", "").strip()
    ap_code = row.get("ap_code", "").strip()
    return bool(hex_addr and hex_addr != "???" and ap_code)


def get_objective_difficulty_code(row):
    match = re.match(r"^Objective\s+([0-3])\s+[A-Z]$", row.get("category", "").strip())
    if not match:
        return None
    return int(match.group(1))


def is_shared_objective_row(row):
    return is_runtime_objective_row(row) and get_objective_difficulty_code(row) == 0


def is_per_difficulty_objective_row(row):
    difficulty_code = get_objective_difficulty_code(row)
    return is_runtime_objective_row(row) and difficulty_code in (1, 2, 3)


def make_shared_objective_name(name: str) -> str:
    return re.sub(r" \((Agent|Secret Agent|Double Agent)\)$", "", name.strip())


def build_shared_objective_rows(locations):
    explicit_rows = [
        {
            "location_name": loc.get("location_name", "").strip(),
            "ap_code": loc.get("ap_code", "").strip(),
            "hex_addr": loc.get("hex_addr", "").strip(),
            "map_id": loc.get("map_id", "").strip() or "0",
            "region": loc.get("region", "").strip(),
        }
        for loc in locations
        if is_shared_objective_row(loc)
    ]
    if explicit_rows:
        return explicit_rows

    grouped = {}
    for loc in locations:
        if not is_runtime_objective_row(loc):
            continue

        key = (loc.get("map_id", "").strip(), loc.get("hex_addr", "").strip())
        ap_code = int(loc.get("ap_code", "").strip())
        difficulty_code = (ap_code // 10000) % 10
        shared_ap_code = ap_code - (difficulty_code * 10000)
        shared_name = make_shared_objective_name(loc.get("location_name", "").strip())

        if key not in grouped:
            grouped[key] = {
                "location_name": shared_name,
                "ap_code": str(shared_ap_code),
                "hex_addr": loc.get("hex_addr", "").strip(),
                "map_id": loc.get("map_id", "").strip() or "0",
                "region": loc.get("region", "").strip(),
            }

    return list(grouped.values())


def build_per_difficulty_objective_rows(locations):
    explicit_rows = [
        {
            "location_name": loc.get("location_name", "").strip(),
            "ap_code": loc.get("ap_code", "").strip(),
            "hex_addr": loc.get("hex_addr", "").strip(),
            "map_id": loc.get("map_id", "").strip() or "0",
            "region": loc.get("region", "").strip(),
        }
        for loc in locations
        if is_per_difficulty_objective_row(loc)
    ]
    if explicit_rows:
        return explicit_rows

    difficulty_names = {
        1: "Agent",
        2: "Secret Agent",
        3: "Double Agent",
    }
    rows = []
    for loc in build_shared_objective_rows(locations):
        shared_ap_code = int(loc["ap_code"])
        shared_name = loc["location_name"]
        for difficulty_code, difficulty_name in difficulty_names.items():
            rows.append({
                "location_name": f"{shared_name} ({difficulty_name})",
                "ap_code": str(shared_ap_code + (difficulty_code * 10000)),
                "hex_addr": loc["hex_addr"],
                "map_id": loc["map_id"],
                "region": loc["region"],
            })
    return rows


def build_client_starting_option_value_map(options, items):
    mission_names = list(get_starting_mission_names(options, items))
    for mission_name in get_extra_mission_names(options, items):
        if mission_name not in mission_names:
            mission_names.append(mission_name)
    return {
        mission_name: index
        for index, mission_name in enumerate(mission_names, start=1)
    }


def get_objective_name_difficulty_code(location_name: str) -> int | None:
    stripped = location_name.strip()
    match = re.search(r"\((Agent|Secret Agent|Double Agent)\)$", stripped)
    if match is None:
        return None
    return MISSION_DIFFICULTY_SUFFIX_TO_CODE[match.group(1)]


def get_freestanding_weapon_base_name(location_name: str) -> str:
    return re.sub(r" \((Agent|Secret Agent|Double Agent)\)$", "", location_name.strip())


def get_freestanding_weapon_difficulty_code(location_name: str) -> int:
    stripped = location_name.strip()
    match = re.search(r"\((Agent|Secret Agent|Double Agent)\)$", stripped)
    if match is None:
        return 0
    return MISSION_DIFFICULTY_SUFFIX_TO_CODE[match.group(1)]


def is_freestanding_weapon_row(row) -> bool:
    if not is_active_row(row):
        return False
    base_name = get_freestanding_weapon_base_name(row.get("location_name", ""))
    return base_name in FREESTANDING_WEAPON_IDS_BY_NAME


def build_client_freestanding_weapon_entry(row):
    location_id = parse_int_cell(row.get("ap_code", ""))
    if location_id is None:
        raise ValueError(f"Freestanding weapon '{row.get('location_name', '').strip()}' is missing an AP code.")

    base_name = get_freestanding_weapon_base_name(row.get("location_name", ""))
    return {
        "location_id": location_id,
        "location_name": row.get("location_name", "").strip(),
        "weapon_id": FREESTANDING_WEAPON_IDS_BY_NAME[base_name],
    }


def build_client_objective_entry(row):
    flag_address = parse_int_cell(row.get("hex_addr", ""))
    if flag_address is None:
        raise ValueError(f"Objective '{row.get('location_name', '').strip()}' is missing a hex address.")

    location_id = parse_int_cell(row.get("ap_code", ""))
    if location_id is None:
        raise ValueError(f"Objective '{row.get('location_name', '').strip()}' is missing an AP code.")

    return {
        "location_id": location_id,
        "location_name": row.get("location_name", "").strip(),
        "flag_address": flag_address,
        "flag_offset": (flag_address - OBJECTIVE_FLAG_BASE_ADDRESS) // 4,
        "requires_success": "Minimize " in row.get("location_name", "").strip(),
    }


def build_client_missions(client_data, locations, options, items):
    mission_clear_locations = get_mission_clear_location_map(locations)
    shared_objectives_by_map_id = {}
    per_difficulty_objectives_by_map_id = {}
    shared_freestanding_weapons_by_map_id = {}
    per_difficulty_freestanding_weapons_by_map_id = {}
    starting_option_values = build_client_starting_option_value_map(options, items)

    for row in build_shared_objective_rows(locations):
        map_id = parse_int_cell(row.get("map_id", "")) or 0
        shared_objectives_by_map_id.setdefault(map_id, []).append(build_client_objective_entry(row))

    for row in build_per_difficulty_objective_rows(locations):
        map_id = parse_int_cell(row.get("map_id", "")) or 0
        difficulty_code = get_objective_name_difficulty_code(row.get("location_name", ""))
        if difficulty_code is None:
            raise ValueError(
                f"Could not determine objective difficulty for '{row.get('location_name', '').strip()}'."
            )
        objectives_by_difficulty = per_difficulty_objectives_by_map_id.setdefault(
            map_id,
            {1: [], 2: [], 3: []},
        )
        objectives_by_difficulty[difficulty_code].append(build_client_objective_entry(row))

    for objectives in shared_objectives_by_map_id.values():
        objectives.sort(key=lambda objective: objective["location_id"])

    for objectives_by_difficulty in per_difficulty_objectives_by_map_id.values():
        for difficulty_code in (1, 2, 3):
            objectives_by_difficulty[difficulty_code].sort(
                key=lambda objective: objective["location_id"]
            )

    for row in locations:
        if not is_freestanding_weapon_row(row):
            continue
        map_id = parse_int_cell(row.get("map_id", "")) or 0
        difficulty_code = get_freestanding_weapon_difficulty_code(row.get("location_name", ""))
        entry = build_client_freestanding_weapon_entry(row)
        if difficulty_code == 0:
            shared_freestanding_weapons_by_map_id.setdefault(map_id, []).append(entry)
            continue
        freestanding_by_difficulty = per_difficulty_freestanding_weapons_by_map_id.setdefault(
            map_id,
            {1: [], 2: [], 3: []},
        )
        freestanding_by_difficulty[difficulty_code].append(entry)

    for freestanding_weapons in shared_freestanding_weapons_by_map_id.values():
        freestanding_weapons.sort(key=lambda weapon: weapon["location_id"])

    for freestanding_by_difficulty in per_difficulty_freestanding_weapons_by_map_id.values():
        for difficulty_code in (1, 2, 3):
            freestanding_by_difficulty[difficulty_code].sort(
                key=lambda weapon: weapon["location_id"]
            )

    missions = []
    for row in client_data:
        mission_name = row["mission_name"].strip()
        mission_clear = mission_clear_locations.get(mission_name)
        if mission_clear is None:
            raise ValueError(f"Could not find clear locations for mission '{mission_name}'.")

        map_id = parse_int_cell(str(mission_clear["map_id"]))
        if map_id is None:
            raise ValueError(f"Mission '{mission_name}' is missing a valid map_id.")

        objectives_by_difficulty = per_difficulty_objectives_by_map_id.get(
            map_id,
            {1: [], 2: [], 3: []},
        )
        freestanding_by_difficulty = per_difficulty_freestanding_weapons_by_map_id.get(
            map_id,
            {1: [], 2: [], 3: []},
        )

        missions.append(
            {
                "name": mission_name,
                "mission_id": parse_int_cell(row["mission_id_hex"]),
                "map_id": map_id,
                "unlock_byte_offset": parse_int_cell(row["ram_offset"]),
                "unlock_item_name": normalize_unlock_name(row["item_name"]),
                "unlock_item_id": parse_int_cell(row["item_ap_id"]),
                "starting_option_value": starting_option_values.get(mission_name),
                "clear_location_ids": {
                    difficulty_code: parse_int_cell(str(mission_clear["location_ids"][difficulty_code]))
                    for difficulty_code in (1, 2, 3)
                },
                "shared_clear_location_id": parse_int_cell(str(mission_clear["shared_location_id"])),
                "shared_objective_checks": list(shared_objectives_by_map_id.get(map_id, [])),
                "objective_checks_per_difficulty": {
                    1: list(objectives_by_difficulty[1]),
                    2: list(objectives_by_difficulty[2]),
                    3: list(objectives_by_difficulty[3]),
                },
                "shared_freestanding_weapon_checks": list(
                    shared_freestanding_weapons_by_map_id.get(map_id, [])
                ),
                "per_difficulty_freestanding_weapon_checks": {
                    1: list(freestanding_by_difficulty[1]),
                    2: list(freestanding_by_difficulty[2]),
                    3: list(freestanding_by_difficulty[3]),
                },
            }
        )

    return missions


def make_client_data_banner(label: str) -> str:
    return f" {label} ".center(CLIENT_DATA_BANNER_WIDTH, "#")


def append_client_data_section_banner(lines: list[str], label: str) -> None:
    lines.append("#" * CLIENT_DATA_BANNER_WIDTH)
    lines.append(make_client_data_banner(label))
    lines.append("#" * CLIENT_DATA_BANNER_WIDTH)


def append_client_data_subsection_banner(lines: list[str], label: str) -> None:
    lines.append("#" + ("-" * (CLIENT_DATA_BANNER_WIDTH - 2)) + "#")
    lines.append(make_client_data_banner(label))
    lines.append("#" + ("-" * (CLIENT_DATA_BANNER_WIDTH - 2)) + "#")


def append_client_objective_rows(lines: list[str], objectives: list[dict], indent: str) -> None:
    for objective in objectives:
        lines.append(f"{indent}{{")
        lines.append(f'{indent}    "location_id": {objective["location_id"]},')
        lines.append(f'{indent}    "location_name": "{objective["location_name"]}",')
        lines.append(f'{indent}    "flag_address": 0x{objective["flag_address"]:X},')
        lines.append(f'{indent}    "flag_offset": {objective["flag_offset"]},')
        lines.append(f'{indent}    "requires_success": {objective["requires_success"]},')
        lines.append(f"{indent}}},")


def append_client_freestanding_weapon_rows(lines: list[str], weapons: list[dict], indent: str) -> None:
    for weapon in weapons:
        lines.append(f"{indent}{{")
        lines.append(f'{indent}    "location_id": {weapon["location_id"]},')
        lines.append(f'{indent}    "location_name": "{weapon["location_name"]}",')
        lines.append(f'{indent}    "weapon_id": {weapon["weapon_id"]},')
        lines.append(f"{indent}}},")


def append_client_mission_block(lines: list[str], mission: dict, mission_number: int) -> None:
    lines.append("")
    lines.append("    " + make_client_data_banner(f"[MISSION {mission_number:02d}] {mission['name']}"))
    lines.append("")
    lines.append("    {")
    lines.append(f'        "name": "{mission["name"]}",')
    lines.append(f'        "mission_id": {mission["mission_id"]},')
    lines.append(f'        "map_id": {mission["map_id"]},')
    lines.append(f'        "unlock_byte_offset": {mission["unlock_byte_offset"]},')
    lines.append(f'        "unlock_item_name": "{mission["unlock_item_name"]}",')
    lines.append(f'        "unlock_item_id": {mission["unlock_item_id"]},')
    if mission["starting_option_value"] is None:
        lines.append('        "starting_option_value": None,')
    else:
        lines.append(f'        "starting_option_value": {mission["starting_option_value"]},')
    lines.append('        "clear_location_ids": {')
    for difficulty_code in (1, 2, 3):
        lines.append(f'            {difficulty_code}: {mission["clear_location_ids"][difficulty_code]},')
    lines.append("        },")
    lines.append(f'        "shared_clear_location_id": {mission["shared_clear_location_id"]},')
    lines.append('        "shared_objective_checks": [')
    append_client_objective_rows(lines, mission["shared_objective_checks"], "            ")
    lines.append("        ],")
    lines.append('        "objective_checks_per_difficulty": {')
    for difficulty_code in (1, 2, 3):
        lines.append(f"            {difficulty_code}: [")
        append_client_objective_rows(
            lines,
            mission["objective_checks_per_difficulty"][difficulty_code],
            "                ",
        )
        lines.append("            ],")
    lines.append("        },")
    lines.append('        "shared_freestanding_weapon_checks": [')
    append_client_freestanding_weapon_rows(
        lines,
        mission["shared_freestanding_weapon_checks"],
        "            ",
    )
    lines.append("        ],")
    lines.append('        "per_difficulty_freestanding_weapon_checks": {')
    for difficulty_code in (1, 2, 3):
        lines.append(f"            {difficulty_code}: [")
        append_client_freestanding_weapon_rows(
            lines,
            mission["per_difficulty_freestanding_weapon_checks"][difficulty_code],
            "                ",
        )
        lines.append("            ],")
    lines.append("        },")
    lines.append("    },")


def format_client_data_value(value) -> str:
    if isinstance(value, str):
        return f'"{value}"'
    return pprint.pformat(value, compact=True, sort_dicts=False, width=100)


def append_client_effect_def_map(lines: list[str], name: str, effect_defs: dict[int, dict]) -> None:
    lines.append(f"{name} = {{")
    if not effect_defs:
        lines.append("}")
        return

    preferred_keys = [
        "item_name",
        "item_id",
        "effect_type",
        "weapon_id",
        "ammo_offset",
        "ammo_grant",
        "ammo_max",
        "extra_inventory_ids",
    ]

    for item_id in sorted(effect_defs):
        effect_def = effect_defs[item_id]
        lines.append(f"    {item_id}: {{")

        written_keys = set()
        for key in preferred_keys:
            if key not in effect_def:
                continue
            value = format_client_data_value(effect_def[key])
            lines.append(f'        "{key}": {value},')
            written_keys.add(key)

        for key, value in effect_def.items():
            if key in written_keys:
                continue
            rendered = format_client_data_value(value)
            lines.append(f'        "{key}": {rendered},')

        lines.append("    },")

    lines.append("}")


def gen_client_data_py(client_data, locations, options, items):
    missions = build_client_missions(client_data, locations, options, items)
    item_effect_defs = build_item_effect_defs(items)
    loadout_gadget_defs = build_loadout_gadget_defs(items)
    weapon_item_defs = {}
    non_weapon_item_effect_defs = {}

    for item_id in sorted(item_effect_defs):
        effect_def = item_effect_defs[item_id]
        if effect_def.get("effect_type") == "weapon":
            weapon_item_defs[item_id] = effect_def
        else:
            non_weapon_item_effect_defs[item_id] = effect_def

    progressive_gun_base_row = get_progressive_gun_base_row(items)
    progressive_gun_base_item_id = (
        parse_int_cell(progressive_gun_base_row.get("ap_code", ""))
        if progressive_gun_base_row is not None
        else None
    )

    lines = []
    lines.append("# Auto-generated by codegen.py - do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d')}")
    lines.append("")
    lines.append("# TABLE OF CONTENTS")
    lines.append("# [SECTION 1] Mission Metadata")
    lines.append("# [SECTION 2] Weapon Runtime Data")
    lines.append("# [SECTION 3] Loadout Gadgets")
    lines.append("# [SECTION 4] Item Effects")
    lines.append("")
    lines.append("")
    append_client_data_section_banner(lines, "[SECTION 1] Mission Metadata")
    lines.append("")
    lines.append("MISSIONS = [")
    for mission_number, mission in enumerate(missions, start=1):
        append_client_mission_block(lines, mission, mission_number)
    lines.append("]")
    lines.append("")
    append_client_data_subsection_banner(lines, "[MISSION LOOKUPS]")
    lines.append("")
    lines.append("MISSION_BY_NAME = {}")
    lines.append("MISSION_BY_MAP_ID = {}")
    lines.append("MISSION_BY_ID = {}")
    lines.append("MISSION_BY_UNLOCK_ITEM_ID = {}")
    lines.append("MISSION_BY_STARTING_OPTION_VALUE = {}")
    lines.append("")
    lines.append("for mission in MISSIONS:")
    lines.append('    MISSION_BY_NAME[mission["name"]] = mission')
    lines.append('    MISSION_BY_MAP_ID[mission["map_id"]] = mission')
    lines.append('    MISSION_BY_ID[mission["mission_id"]] = mission')
    lines.append('    MISSION_BY_UNLOCK_ITEM_ID[mission["unlock_item_id"]] = mission')
    lines.append('    MISSION_BY_STARTING_OPTION_VALUE[mission["starting_option_value"]] = mission')
    lines.append("")
    append_client_data_section_banner(lines, "[SECTION 2] Weapon Runtime Data")
    lines.append("")
    lines.append("# Progressive order note:")
    lines.append("# - WEAPON_ITEM_DEFS is emitted in sorted AP item id order.")
    lines.append("# - The client can derive the progressive weapon ladder from that key order.")
    lines.append("")
    append_client_effect_def_map(lines, "WEAPON_ITEM_DEFS", weapon_item_defs)
    lines.append("")
    append_formatted_assignment(lines, "PROGRESSIVE_GUN_BASE_ITEM_ID", progressive_gun_base_item_id)
    lines.append("")
    append_client_data_section_banner(lines, "[SECTION 3] Loadout Gadgets")
    lines.append("")
    append_client_effect_def_map(lines, "LOADOUT_GADGETS", loadout_gadget_defs)
    lines.append("")
    append_client_data_section_banner(lines, "[SECTION 4] Item Effects")
    lines.append("")
    append_client_effect_def_map(lines, "ITEM_EFFECT_DEFS", non_weapon_item_effect_defs)
    lines.append("")
    return "\n".join(lines)


def gen_types_py():
    """Types.py is static — no sheet needed."""
    return '''from BaseClasses import Location, Item, ItemClassification


class GoldeneyeLocation(Location):
    game = "GoldenEye 007"


class GoldeneyeItem(Item):
    game = "GoldenEye 007"


class ItemData:
    def __init__(self, ap_code, classification: ItemClassification, count: int = 1):
        self.ap_code = ap_code
        self.classification = classification
        self.count = count


class LocData:
    def __init__(self, ap_code, region):
        self.ap_code = ap_code
        self.region = region
'''


def gen_items_py(items, locations, options, rules):
    """Generate Items.py from the Items sheet."""
    active = build_v02_item_rows(items, locations, rules)
    progressive_gun_base_row = get_progressive_gun_base_row(items)
    progressive_gun_rows = get_progressive_gun_rows(items)
    progressive_gun_item_names = [row["item_name"].strip() for row in progressive_gun_rows]
    progressive_gun_item_name = (
        progressive_gun_base_row["item_name"].strip()
        if progressive_gun_base_row is not None
        else None
    )

    # Separate by category
    unlocks = [i for i in active if i["category"].strip() == "Unlock"]
    pool_items = [i for i in active if i["classification"].strip() in ("filler", "useful", "trap", "progression")
                  and i["category"].strip() not in ("Unlock", "Event")]
    events = [i for i in active if i["classification"].strip() == "event"]
    victory_location = next(
        loc["location_name"].strip()
        for loc in locations
        if "victory placed here" in loc.get("notes", "").strip().lower()
    )

    # Build MISSION_UNLOCK_NAMES from the non-extra starting mission order
    unlock_names = get_starting_mission_names(options, items)

    lines = []
    lines.append("# Auto-generated by codegen.py — do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("# Generated file exception:")
    lines.append("# This file is machine-written from sheet data, so it may use compact Python.")
    lines.append("# We keep the sheet-driven structure here because codegen.py rebuilds it.")
    lines.append("# This is safe because codegen.py rebuilds this file from the same source data.")
    lines.append("")
    lines.append("from typing import TYPE_CHECKING, Dict, List")
    lines.append("from BaseClasses import Item, ItemClassification")
    lines.append("from .Locations import EXTRA_MISSION_NAMES, get_enabled_extra_missions, get_total_locations")
    lines.append("from .Types import GoldeneyeItem, ItemData")
    lines.append("")
    lines.append("if TYPE_CHECKING:")
    lines.append('    from . import GoldeneyeWorld')
    lines.append("")
    lines.append("")
    append_literal_list_assignment(lines, "PROGRESSIVE_GUN_ITEM_NAMES", progressive_gun_item_names)
    lines.append(f"PROGRESSIVE_GUN_ITEM_NAME = {progressive_gun_item_name!r}")
    lines.append("")
    lines.append("")

    # create_itempool
    lines.append('def create_itempool(world: "GoldeneyeWorld") -> List[Item]:')
    lines.append("    itempool: List[Item] = []")
    lines.append("")
    lines.append("    enabled_extra_missions = get_enabled_extra_missions(world)")
    lines.append("    progressive_guns = world.options.progressive_weapons.value == 1")
    lines.append("    starting_unlock = MISSION_UNLOCK_NAMES[world.options.starting_mission.value - 1]")
    lines.append("    for name in goldeneye_unlocks:")
    lines.append("        if name == starting_unlock:")
    lines.append("            continue")
    lines.append("        if name in EXTRA_MISSION_NAMES and name not in enabled_extra_missions:")
    lines.append("            continue")
    lines.append("        itempool.append(create_item(world, name))")
    lines.append("")
    lines.append("    for name, data in goldeneye_pool_items.items():")
    lines.append("        if name == PROGRESSIVE_GUN_ITEM_NAME:")
    lines.append("            continue")
    lines.append("        if progressive_guns and name in PROGRESSIVE_GUN_ITEM_NAMES:")
    lines.append("            continue")
    lines.append("        if data.count > 0:")
    lines.append("            itempool.extend(create_multiple_items(world, name, data.count, data.classification))")
    lines.append("")
    lines.append("    if progressive_guns:")
    lines.append("        itempool.extend(create_multiple_items(")
    lines.append("            world,")
    lines.append("            PROGRESSIVE_GUN_ITEM_NAME,")
    lines.append("            len(PROGRESSIVE_GUN_ITEM_NAMES),")
    lines.append("            ItemClassification.progression,")
    lines.append("        ))")
    lines.append("")
    lines.append('    victory = create_item(world, "Victory")')
    lines.append(f'    world.multiworld.get_location("{victory_location}", world.player).place_locked_item(victory)')
    lines.append("")
    lines.append("    itempool.extend(create_junk_items(world, get_total_locations(world) - len(itempool) - 1))")
    lines.append("")
    lines.append("    return itempool")
    lines.append("")
    lines.append("")

    # create_item
    lines.append('def create_item(world: "GoldeneyeWorld", name: str) -> Item:')
    lines.append("    data = item_table[name]")
    lines.append("    return GoldeneyeItem(name, data.classification, data.ap_code, world.player)")
    lines.append("")
    lines.append("")

    # create_multiple_items
    lines.append("def create_multiple_items(")
    lines.append('    world: "GoldeneyeWorld",')
    lines.append("    name: str,")
    lines.append("    count: int,")
    lines.append("    item_type: ItemClassification = ItemClassification.progression,")
    lines.append(") -> List[Item]:")
    lines.append("    data = item_table[name]")
    lines.append("    return [GoldeneyeItem(name, item_type, data.ap_code, world.player) for _ in range(count)]")
    lines.append("")
    lines.append("")

    # create_junk_items
    lines.append('def create_junk_items(world: "GoldeneyeWorld", count: int) -> List[Item]:')
    lines.append("    trap_chance = world.options.trap_chance.value")
    lines.append("    junk_pool: List[Item] = []")
    lines.append("    junk_list: Dict[str, int] = {}")
    lines.append("    trap_list: Dict[str, int] = {}")
    lines.append("")
    lines.append("    for name, data in item_table.items():")
    lines.append("        if data.classification == ItemClassification.filler:")
    lines.append("            junk_list[name] = junk_weights.get(name, 1)")
    lines.append("        elif trap_chance > 0 and data.classification == ItemClassification.trap:")
    lines.append('            if name == "Goldeneye Trap":')
    lines.append('                option = getattr(world.options, "goldeneye_trap", None)')
    lines.append("                trap_weight = option.value if option is not None else 0")
    lines.append('            elif name == "Enemy Rockets Trap":')
    lines.append('                option = getattr(world.options, "enemy_rockets_trap", None)')
    lines.append("                trap_weight = option.value if option is not None else 0")
    lines.append('            elif name == "Holster Gun Trap":')
    lines.append('                option = getattr(world.options, "holster_gun_trap", None)')
    lines.append("                trap_weight = option.value if option is not None else 0")
    lines.append("            else:")
    lines.append("                trap_weight = 0")
    lines.append("            if trap_weight > 0:")
    lines.append("                trap_list[name] = trap_weight")
    lines.append("")
    lines.append("    for _ in range(count):")
    lines.append("        pool = (")
    lines.append("            trap_list")
    lines.append("            if trap_list and sum(trap_list.values()) > 0 and trap_chance > 0 and world.random.randint(1, 100) <= trap_chance")
    lines.append("            else junk_list")
    lines.append("        )")
    lines.append("        junk_pool.append(")
    lines.append("            world.create_item(")
    lines.append("                world.random.choices(list(pool), weights=list(pool.values()), k=1)[0]")
    lines.append("            )")
    lines.append("        )")
    lines.append("")
    lines.append("    return junk_pool")
    lines.append("")
    lines.append("")

    # MISSION_UNLOCK_NAMES
    lines.append("MISSION_UNLOCK_NAMES = [")
    for i in range(0, len(unlock_names), 5):
        chunk = unlock_names[i:i+5]
        line = "    " + ", ".join(f'"{n}"' for n in chunk) + ","
        lines.append(line)
    lines.append("]")
    lines.append("")

    # goldeneye_unlocks
    lines.append("goldeneye_unlocks = {")
    for i in unlocks:
        name = normalize_unlock_name(i["item_name"])
        code = i["ap_code"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}ItemData({code}, ItemClassification.progression),')
    lines.append("}")
    lines.append("")

    # goldeneye_pool_items
    lines.append("goldeneye_pool_items = {")
    for i in pool_items:
        name = i["item_name"]
        code = i["ap_code"]
        cl = i["classification"].strip()
        if cl == "filler":
            ic = "ItemClassification.filler"
        elif cl == "useful":
            ic = "ItemClassification.useful"
        elif cl == "trap":
            ic = "ItemClassification.trap"
        else:
            ic = "ItemClassification.progression"
        count = int((i.get("count") or "0").strip() or "0")
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}ItemData({code}, {ic}, {count}),')
    lines.append("}")
    lines.append("")

    # junk_weights
    lines.append("junk_weights = {")
    for i in pool_items:
        if i["classification"].strip() == "filler":
            junk_weight = parse_int_cell(
                get_first_non_empty_value(i, "junk_weight", "filler_weight", "weight")
            )
            if junk_weight is None:
                junk_weight = 60
            lines.append(f'    "{i["item_name"]}": {junk_weight},')
    lines.append("}")
    lines.append("")

    # events
    lines.append("goldeneye_events = {")
    for i in events:
        code = i.get("ap_code", "").strip()
        ap_code = code if code else "None"
        lines.append(f'    "{i["item_name"]}": ItemData({ap_code}, ItemClassification.progression),')
    lines.append("}")
    lines.append("")

    # item_table
    lines.append("item_table = {")
    lines.append("    **goldeneye_unlocks,")
    lines.append("    **goldeneye_pool_items,")
    lines.append("    **goldeneye_events,")
    lines.append("}")
    lines.append("")

    return "\n".join(lines)


def gen_locations_py(locations, options, items, rules):
    """Generate Locations.py from the Locations sheet."""
    active = [l for l in locations if is_active_row(l)]
    promoted_options = build_v02_option_rows(options)
    promoted_items = build_v02_item_rows(items, locations, rules)
    extra_mission_names = get_extra_mission_names(promoted_options, promoted_items)
    extra_selection_values = get_extra_location_choice_value_map(promoted_options, promoted_items)
    extra_mission_regions = set(extra_mission_names)
    mission_clear_mode_per_map = get_option_choice_value("mission_clear_mode", "per_map", promoted_options, promoted_items, 0)
    mission_clear_mode_per_difficulty = get_option_choice_value(
        "mission_clear_mode", "per_difficulty", promoted_options, promoted_items, 1
    )
    objective_mode_per_difficulty = get_option_choice_value(
        "objective_mode", "per_difficulty", promoted_options, promoted_items, 0
    )
    objective_mode_shared = get_option_choice_value("objective_mode", "shared", promoted_options, promoted_items, 1)
    item_shuffle_mode_shared = get_option_choice_value("item_shuffle", "shared", promoted_options, promoted_items, 0)
    item_shuffle_mode_per_difficulty = get_option_choice_value(
        "item_shuffle", "per_difficulty", promoted_options, promoted_items, 1
    )
    extra_selection_names = build_extra_location_selection_sets(extra_mission_names, extra_selection_values)
    victory_rows = [l for l in active if "victory placed here" in l.get("notes", "").strip().lower()]
    victory_names = {l.get("location_name", "").strip() for l in victory_rows}
    keypickup_rows = [
        l for l in active
        if l["category"].strip() == "KeyPickup"
    ]
    base_regular = [
        l for l in active
        if l["category"].strip() != "Event"
        and l["category"].strip() != "KeyPickup"
        and not is_runtime_objective_row(l)
        and not is_stage_mission_clear_row(l)
        and l.get("is_extra", "").strip().lower() != "yes"
        and l.get("region", "").strip() not in extra_mission_regions
    ]
    extra = [
        l for l in active
        if l["category"].strip() != "Event"
        and l["category"].strip() != "KeyPickup"
        and not is_runtime_objective_row(l)
        and not is_stage_mission_clear_row(l)
        and l.get("location_name", "").strip() not in victory_names
        and (
            l.get("is_extra", "").strip().lower() == "yes"
            or l.get("region", "").strip() in extra_mission_regions
        )
    ]
    events = [l for l in active if l["category"].strip() == "Event"]
    per_difficulty_clears = get_per_difficulty_mission_clear_rows(locations)
    shared_clears = get_shared_mission_clear_rows(locations)
    per_difficulty_objectives = build_per_difficulty_objective_rows(locations)
    shared_objectives = build_shared_objective_rows(locations)

    lines = []
    lines.append("# Auto-generated by codegen.py — do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("# Generated file exception:")
    lines.append("# This file is machine-written from sheet data, so it may use compact Python.")
    lines.append("# We keep the sheet-driven structure here because codegen.py rebuilds it.")
    lines.append("# This is safe because codegen.py rebuilds this file from the same source data.")
    lines.append("")
    lines.append("from typing import Dict, TYPE_CHECKING")
    lines.append("from .Types import LocData")
    lines.append("")
    lines.append("if TYPE_CHECKING:")
    lines.append('    from . import GoldeneyeWorld')
    lines.append("")
    lines.append(f"MISSION_CLEAR_MODE_PER_MAP = {mission_clear_mode_per_map}")
    lines.append(f"MISSION_CLEAR_MODE_PER_DIFFICULTY = {mission_clear_mode_per_difficulty}")
    lines.append(f"OBJECTIVE_MODE_PER_DIFFICULTY = {objective_mode_per_difficulty}")
    lines.append(f"OBJECTIVE_MODE_SHARED = {objective_mode_shared}")
    lines.append(f"ITEM_SHUFFLE_MODE_SHARED = {item_shuffle_mode_shared}")
    lines.append(f"ITEM_SHUFFLE_MODE_PER_DIFFICULTY = {item_shuffle_mode_per_difficulty}")
    lines.append(f"EXTRA_MISSION_NAMES = {tuple(extra_mission_names)!r}")
    lines.append("EXTRA_MISSION_REGIONS = EXTRA_MISSION_NAMES")
    lines.append("EXTRA_MISSION_SELECTIONS = {")
    for value in sorted(extra_selection_names):
        mission_names = extra_selection_names[value]
        rendered_names = ", ".join(f'"{mission_name}"' for mission_name in mission_names)
        lines.append(f"    {value}: {{{rendered_names}}},")
    lines.append("}")
    lines.append("")
    lines.append("")
    lines.append('def get_enabled_extra_missions(world: "GoldeneyeWorld") -> set[str]:')
    lines.append("    return EXTRA_MISSION_SELECTIONS[world.options.extra_locations.value]")
    lines.append("")
    lines.append("")
    lines.append('def is_enabled_extra_region(world: "GoldeneyeWorld", region_name: str) -> bool:')
    lines.append("    return (")
    lines.append("        region_name not in EXTRA_MISSION_REGIONS")
    lines.append("        or region_name in get_enabled_extra_missions(world)")
    lines.append("    )")
    lines.append("")
    lines.append("")
    lines.append('def get_item_shuffle_mode(world: "GoldeneyeWorld") -> int:')
    lines.append('    item_shuffle = getattr(world.options, "item_shuffle", None)')
    lines.append("    if item_shuffle is None:")
    lines.append("        return ITEM_SHUFFLE_MODE_SHARED")
    lines.append("    return item_shuffle.value")
    lines.append("")
    lines.append("")
    lines.append('def get_total_locations(world: "GoldeneyeWorld") -> int:')
    lines.append("    return sum(")
    lines.append("        1")
    lines.append("        for name, data in location_table.items()")
    lines.append("        if name not in event_locations")
    lines.append("        and is_enabled_extra_region(world, data.region)")
    lines.append("        and is_valid_location(world, name)")
    lines.append("    )")
    lines.append("")
    lines.append("")
    lines.append("def get_location_names() -> Dict[str, int]:")
    lines.append("    return {name: data.ap_code for name, data in location_table.items() if data.ap_code is not None}")
    lines.append("")
    lines.append("")
    lines.append('def is_valid_location(world: "GoldeneyeWorld", name: str) -> bool:')
    lines.append("    if not is_enabled_extra_region(world, location_table[name].region):")
    lines.append("        return False")
    lines.append("    if name in per_difficulty_item_locations:")
    lines.append("        return get_item_shuffle_mode(world) == ITEM_SHUFFLE_MODE_PER_DIFFICULTY")
    lines.append("    if name in shared_item_locations:")
    lines.append("        return get_item_shuffle_mode(world) == ITEM_SHUFFLE_MODE_SHARED")
    lines.append("    if name in per_difficulty_keypickup_locations:")
    lines.append("        return get_item_shuffle_mode(world) == ITEM_SHUFFLE_MODE_PER_DIFFICULTY")
    lines.append("    if name in shared_keypickup_locations:")
    lines.append("        return get_item_shuffle_mode(world) == ITEM_SHUFFLE_MODE_SHARED")
    lines.append("    if name in per_difficulty_clear_locations:")
    lines.append("        return world.options.mission_clear_mode.value == MISSION_CLEAR_MODE_PER_DIFFICULTY")
    lines.append("    if name in shared_clear_locations:")
    lines.append("        return world.options.mission_clear_mode.value == MISSION_CLEAR_MODE_PER_MAP")
    lines.append("    if name in per_difficulty_objective_locations:")
    lines.append("        return world.options.objective_mode.value == OBJECTIVE_MODE_PER_DIFFICULTY")
    lines.append("    if name in shared_objective_locations:")
    lines.append("        return world.options.objective_mode.value == OBJECTIVE_MODE_SHARED")
    lines.append("    return True")
    lines.append("")
    lines.append("")

    # goldeneye_locations
    lines.append("goldeneye_locations = {")
    for l in base_regular:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        if "victory placed here" in l.get("notes", "").strip().lower():
            code = code if code and code != "17390000" else "72110002"
            region = region or "Cradle"
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    lines.append("keypickup_locations = {")
    for l in keypickup_rows:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    lines.append("per_difficulty_clear_locations = {")
    for l in per_difficulty_clears:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    lines.append("keypickup_detection_aliases = {")
    for l in keypickup_rows:
        aliases = get_keypickup_detection_aliases(l)
        if not aliases:
            continue
        alias_literals = ", ".join(repr(alias) for alias in aliases)
        lines.append(f'    "{l["location_name"]}": ({alias_literals},),')
    lines.append("}")
    lines.append("")

    lines.append("shared_clear_locations = {")
    for l in shared_clears:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    lines.append("per_difficulty_objective_locations = {")
    for l in per_difficulty_objectives:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    lines.append("shared_objective_locations = {")
    for l in shared_objectives:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    # extra_locations
    lines.append("extra_locations = {")
    for l in extra:
        name = l["location_name"]
        code = l["ap_code"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData({code}, "{region}"),')
    lines.append("}")
    lines.append("")

    # event_locations
    lines.append("event_locations = {")
    for l in events:
        name = l["location_name"]
        region = l["region"]
        pad = " " * max(1, 24 - len(name))
        lines.append(f'    "{name}":{pad}LocData(None, "{region}"),')
    lines.append("}")
    lines.append("")
    lines.append("")
    lines.append("def _split_difficulty_suffix(name: str) -> tuple[str, int] | None:")
    lines.append('    for difficulty_name, difficulty_code in (("Agent", 1), ("Secret Agent", 2), ("Double Agent", 3)):')
    lines.append('        suffix = f" ({difficulty_name})"')
    lines.append("        if name.endswith(suffix):")
    lines.append("            return name[:-len(suffix)], difficulty_code")
    lines.append("    return None")
    lines.append("")
    lines.append("")
    lines.append("def _build_location_mode_tables(raw_locations: Dict[str, LocData]):")
    lines.append("    grouped = {}")
    lines.append("    for name, data in raw_locations.items():")
    lines.append("        parsed = _split_difficulty_suffix(name)")
    lines.append("        if parsed is None:")
    lines.append('            entry = grouped.setdefault(name, {"shared": None, "per_difficulty": {}})')
    lines.append('            entry["shared"] = (name, data)')
    lines.append("            continue")
    lines.append("        base_name, difficulty_code = parsed")
    lines.append('        entry = grouped.setdefault(base_name, {"shared": None, "per_difficulty": {}})')
    lines.append('        entry["per_difficulty"][difficulty_code] = (name, data)')
    lines.append("")
    lines.append("    always_on = {}")
    lines.append("    shared = {}")
    lines.append("    per_difficulty = {}")
    lines.append("    shared_groups = {}")
    lines.append("    for base_name, entry in grouped.items():")
    lines.append('        if not entry["per_difficulty"]:')
    lines.append('            if entry["shared"] is not None:')
    lines.append('                shared_name, shared_data = entry["shared"]')
    lines.append("                always_on[shared_name] = shared_data")
    lines.append("            continue")
    lines.append("")
    lines.append('        for difficulty_code in sorted(entry["per_difficulty"]):')
    lines.append('            per_name, per_data = entry["per_difficulty"][difficulty_code]')
    lines.append("            per_difficulty[per_name] = per_data")
    lines.append("")
    lines.append('        if entry["shared"] is not None:')
    lines.append('            shared_name, shared_data = entry["shared"]')
    lines.append("        else:")
    lines.append('            first_difficulty = min(entry["per_difficulty"])')
    lines.append('            _, first_data = entry["per_difficulty"][first_difficulty]')
    lines.append("            shared_name = base_name")
    lines.append("            shared_data = LocData(first_data.ap_code - (first_difficulty * 10000), first_data.region)")
    lines.append("")
    lines.append("        shared[shared_name] = shared_data")
    lines.append("        shared_groups[shared_name] = [")
    lines.append('            entry["per_difficulty"][difficulty_code][0]')
    lines.append('            for difficulty_code in sorted(entry["per_difficulty"])')
    lines.append("        ]")
    lines.append("")
    lines.append("    return always_on, shared, per_difficulty, shared_groups")
    lines.append("")
    lines.append("")
    lines.append("def _build_keypickup_alias_tables(raw_aliases, shared_groups):")
    lines.append("    shared_aliases = {}")
    lines.append("    per_difficulty_aliases = dict(raw_aliases)")
    lines.append("    for shared_name, per_names in shared_groups.items():")
    lines.append("        aliases = []")
    lines.append("        seen = set()")
    lines.append('        base_alias = shared_name.split(" - ", 1)[1] if " - " in shared_name else shared_name')
    lines.append("        for alias in (base_alias,):")
    lines.append("            lowered = alias.lower()")
    lines.append("            if lowered not in seen:")
    lines.append("                seen.add(lowered)")
    lines.append("                aliases.append(alias)")
    lines.append("        for source_name in [shared_name, *per_names]:")
    lines.append("            for alias in raw_aliases.get(source_name, ()):") 
    lines.append("                lowered = alias.lower()")
    lines.append("                if lowered in seen:")
    lines.append("                    continue")
    lines.append("                seen.add(lowered)")
    lines.append("                aliases.append(alias)")
    lines.append("        if aliases:")
    lines.append("            shared_aliases[shared_name] = tuple(aliases)")
    lines.append("    return shared_aliases, per_difficulty_aliases")
    lines.append("")
    lines.append("")
    lines.append("raw_goldeneye_locations = goldeneye_locations")
    lines.append("raw_keypickup_locations = keypickup_locations")
    lines.append("raw_keypickup_detection_aliases = keypickup_detection_aliases")
    lines.append("")
    lines.append("(")
    lines.append("    always_on_item_locations,")
    lines.append("    shared_item_locations,")
    lines.append("    per_difficulty_item_locations,")
    lines.append("    ITEM_SHARED_LOCATION_GROUPS,")
    lines.append(") = _build_location_mode_tables(raw_goldeneye_locations)")
    lines.append("(")
    lines.append("    always_on_keypickup_locations,")
    lines.append("    shared_keypickup_locations,")
    lines.append("    per_difficulty_keypickup_locations,")
    lines.append("    KEYPICKUP_SHARED_LOCATION_GROUPS,")
    lines.append(") = _build_location_mode_tables(raw_keypickup_locations)")
    lines.append("(")
    lines.append("    shared_keypickup_detection_aliases,")
    lines.append("    per_difficulty_keypickup_detection_aliases,")
    lines.append(") = _build_keypickup_alias_tables(raw_keypickup_detection_aliases, KEYPICKUP_SHARED_LOCATION_GROUPS)")
    lines.append("")
    lines.append("goldeneye_locations = {")
    lines.append("    **always_on_item_locations,")
    lines.append("    **shared_item_locations,")
    lines.append("    **per_difficulty_item_locations,")
    lines.append("}")
    lines.append("keypickup_locations = {")
    lines.append("    **always_on_keypickup_locations,")
    lines.append("    **shared_keypickup_locations,")
    lines.append("    **per_difficulty_keypickup_locations,")
    lines.append("}")
    lines.append("keypickup_detection_aliases = {")
    lines.append("    **shared_keypickup_detection_aliases,")
    lines.append("    **per_difficulty_keypickup_detection_aliases,")
    lines.append("}")
    lines.append("")

    # location_table
    lines.append("location_table = {")
    lines.append("    **goldeneye_locations,")
    lines.append("    **keypickup_locations,")
    lines.append("    **per_difficulty_clear_locations,")
    lines.append("    **shared_clear_locations,")
    lines.append("    **per_difficulty_objective_locations,")
    lines.append("    **shared_objective_locations,")
    lines.append("    **extra_locations,")
    lines.append("    **event_locations,")
    lines.append("}")
    lines.append("")

    return "\n".join(lines)


def gen_regions_py(regions):
    """Generate Regions.py from the Regions sheet."""
    active = [r for r in regions if is_active_row(r)]
    region_connections = []
    for row in active:
        region_name = row["region_name"].strip()
        if region_name == "Menu":
            continue
        region_connections.append(
            (
                region_name,
                row.get("entrance_name", "").strip() or f"Menu -> {region_name}",
            )
        )

    lines = []
    lines.append("# Auto-generated by codegen.py — do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("# Generated file exception:")
    lines.append("# This file is machine-written from sheet data, so it may use compact Python.")
    lines.append("# We keep the sheet-driven structure here because codegen.py rebuilds it.")
    lines.append("# This is safe because codegen.py rebuilds this file from the same source data.")
    lines.append("")
    lines.append("from typing import TYPE_CHECKING")
    lines.append("from BaseClasses import Region")
    lines.append("from .Locations import is_valid_location, location_table")
    lines.append("from .Types import GoldeneyeLocation")
    lines.append("")
    lines.append("if TYPE_CHECKING:")
    lines.append('    from . import GoldeneyeWorld')
    lines.append("")
    lines.append("")
    lines.append("REGION_CONNECTIONS = [")
    for region_name, entrance_name in region_connections:
        lines.append(f'    ("{region_name}", "{entrance_name}"),')
    lines.append("]")
    lines.append("")
    lines.append("")
    lines.append('def create_regions(world: "GoldeneyeWorld") -> None:')
    lines.append('    menu = create_region(world, "Menu")')
    lines.append("    for name, entrance_name in REGION_CONNECTIONS:")
    lines.append("        menu.connect(create_region(world, name), entrance_name)")
    lines.append("")
    lines.append("")
    lines.append('def create_region(world: "GoldeneyeWorld", name: str) -> Region:')
    lines.append("    reg = Region(name, world.player, world.multiworld)")
    lines.append("")
    lines.append("    reg.locations.extend(")
    lines.append("        GoldeneyeLocation(world.player, key, data.ap_code, reg)")
    lines.append("        for key, data in location_table.items()")
    lines.append("        if data.region == name and is_valid_location(world, key)")
    lines.append("    )")
    lines.append("")
    lines.append("    world.multiworld.regions.append(reg)")
    lines.append("    return reg")
    lines.append("")

    return "\n".join(lines)


# ── Rules sheet parsing helpers ──────────────────────────────────────────────

# Weapons that do NOT fire bullets (excluded from has_gun check)
_NON_BULLET_WEAPON_NAMES: frozenset = frozenset({
    "Hunting Knife", "Throwing Knife", "Taser",
    "Hand Grenades", "Timed Mines", "Proximity Mines", "Remote Mines", "Remote Mine",
    "Watch Laser", "Military Laser",
    "Grenade Launcher", "Rocket Launcher",
    "Tank", "Tank (Missiles)",
    "Special Timed Mine",
})

# Old item name (lowercase) → new canonical item_name for renamed items
# These allow required_item entries using old names to resolve to the current AP name.
_RULES_COMPAT_ALIASES: dict = {
    "airplane key":         "Ignition Key (Runway Item)",
    "plane key":            "Ignition Key (Runway Item)",
    "facility keycard a":   "Keycard A (Facility Item)",
    "facility keycard b":   "Keycard B (Facility Item)",
    "bunker cell key 1":    "Cell Key 1 (Bunker 2 Item)",
    "bunker cell key 2":    "Cell Key 2 (Bunker 2 Item)",
    "bunker 2 keycard a":   "Keycard A (Bunker 2 Item)",
    "bunker 2 keycard b":   "Keycard B (Bunker 2 Item)",
    "bunker safe key 1":    "Safe Key 1 (Bunker 2 Item)",
    "bunker safe key 2":    "Safe Key 2 (Bunker 2 Item)",
    "remote mines":         "Remote Mine",
    "covert modem":         "Covert Modem (Dam Loadout)",
    "key analyzer case":    "Key Analyzer Case (Bunker 1 Loadout)",
    "camera":               "Camera (Bunker 1 / Silo Loadout)",
    "watch magnet":         "Watch Magnet (Bunker 2 / Archives Loadout)",
    "surface safe key":     "Safe Key (Surface 1 Item)",
    "safe key":             "Safe Key (Surface 1 Item)",
    "building plans":       "Building Plans (Surface 1 Item)",
}


def _build_item_alias_map(items: list) -> dict:
    """
    Build a lowercase-name → canonical item_name lookup.
    Uses item_name (full) and item (short alias) columns from Items sheet.
    Backward-compat aliases (_RULES_COMPAT_ALIASES) take final precedence.
    """
    alias_map: dict = {}
    for row in items:
        full = row.get("item_name", "").strip()
        if not full:
            continue
        for alias in iter_mission_item_aliases(row):
            alias_map.setdefault(alias.lower(), full)
    for alias, full in _RULES_COMPAT_ALIASES.items():
        alias_map.setdefault(alias, full)
    return alias_map


def _split_at_top_level(expr: str, sep: str) -> list:
    """Split expr by sep (case-insensitive) ignoring occurrences inside parentheses."""
    sep_l = sep.lower()
    sep_len = len(sep_l)
    parts: list = []
    depth = 0
    buf: list = []
    i = 0
    while i < len(expr):
        if expr[i] == "(":
            depth += 1
            buf.append(expr[i])
            i += 1
        elif expr[i] == ")":
            depth -= 1
            buf.append(expr[i])
            i += 1
        elif depth == 0 and expr[i : i + sep_len].lower() == sep_l:
            parts.append("".join(buf).strip())
            buf = []
            i += sep_len
        else:
            buf.append(expr[i])
            i += 1
    if buf:
        parts.append("".join(buf).strip())
    return [p for p in parts if p]


def _extract_token_name(token: str, alias_map: dict) -> str:
    """
    Extract item name from |Pipe|, "Quoted", or bare text, then resolve via alias_map.
    Returns "__PROG__N" for Progressive Weapon N, "" for empty tokens.
    """
    token = token.strip()
    # |Pipe Name|
    m = re.match(r"^\|(.+)\|$", token)
    if m:
        name = m.group(1).strip()
        return alias_map.get(name.lower(), name)
    # "Quoted Name" (handle curly/straight quotes and mismatched closing)
    m = re.match(r'^[\u201c"](.*?)[\u201d"]', token)
    if m:
        name = m.group(1).strip()
        return alias_map.get(name.lower(), name)
    # Progressive Weapon N — allow trailing garbage like stray quotes
    m = re.match(r"^Progressive\s+Weapon\s+(\d+)", token, re.IGNORECASE)
    if m:
        return f"__PROG__{m.group(1)}"
    # Bare name (may contain parentheses as part of the item name)
    if token:
        return alias_map.get(token.lower(), token)
    return ""


def _parse_required_item(raw: str, has_gun_col: bool, has_explosive_col: bool, alias_map: dict) -> list:
    """
    Parse required_item string + helper columns into AND-of-OR groups.

    Returns list[list[str]] where outer list = AND groups, inner list = OR alternatives.
    Sentinels: "__GUN__" = has_gun(), "__EXPLOSIVE__" = has_explosive(),
    "__PROG__N" = Progressive Weapon count N.

    Supported formats in required_item:
      |Item Name|               single pipe-delimited name
      "Item Name"               single quoted name
      Item Name                 bare name (no pipe/quote)
      |A| AND |B|               two AND groups
      (|A| OR |B|) AND |C|      OR inside parens, then AND
      ("A" OR "B") AND ("C" or Progressive Weapon 16)
    """
    groups: list = []
    raw = (raw or "").strip()
    if raw:
        and_parts = _split_at_top_level(raw, " AND ")
        for part in and_parts:
            # Strip matching outer parentheses if present
            if part.startswith("(") and part.endswith(")"):
                part = part[1:-1].strip()
            or_alts = _split_at_top_level(part, " OR ")
            resolved = [_extract_token_name(alt, alias_map) for alt in or_alts]
            resolved = [r for r in resolved if r]
            if resolved:
                groups.append(resolved)
    if has_gun_col:
        groups.append(["__GUN__"])
    if has_explosive_col:
        groups.append(["__EXPLOSIVE__"])
    return groups


def _item_to_expr(item: str, weapon_names=()) -> str:
    """Convert a single item name/sentinel to a Python state-check expression string."""
    if item in weapon_names:
        return f'has_weapon(state, player, {item!r})'
    if item == "__GUN__":
        return "has_gun(state, player)"
    elif item == "__EXPLOSIVE__":
        return "has_explosive(state, player)"
    elif item.startswith("__PROG__"):
        return f'state.has("Progressive Weapon", player, {item[8:]})'
    else:
        return f'state.has({item!r}, player)'


def _groups_to_exprs(groups: list, weapon_names=()) -> list:
    """Convert AND-of-OR groups to a list of expression strings (one per AND condition)."""
    result = []
    for or_group in groups:
        if len(or_group) == 1:
            result.append(_item_to_expr(or_group[0], weapon_names))
        else:
            result.append("(" + " or ".join(_item_to_expr(i, weapon_names) for i in or_group) + ")")
    return result


def _emit_entrance_rule(lines, ent, groups, weapon_names=()):
    """Append add_rule lines for a mission entrance."""
    exprs = _groups_to_exprs(groups, weapon_names)
    if len(exprs) == 1:
        lines.append(f'    add_rule(world.multiworld.get_entrance("{ent}", player),')
        lines.append(f'             lambda state: {exprs[0]})')
    else:
        lines.append(f'    add_rule(world.multiworld.get_entrance("{ent}", player),')
        lines.append(f'             lambda state: (')
        for i, expr in enumerate(exprs):
            suffix = " and" if i < len(exprs) - 1 else ""
            lines.append(f'                 {expr}{suffix}')
        lines.append(f'             ))')


def _emit_location_rule(lines, loc_name, groups, weapon_names=()):
    """Append a validity-guarded add_rule call for a location."""
    exprs = _groups_to_exprs(groups, weapon_names)
    lines.append(f'    if "{loc_name}" in world.location_name_to_id and is_valid_location(world, "{loc_name}"):')
    if len(exprs) == 1:
        lines.append(f'        add_rule(world.multiworld.get_location("{loc_name}", player),')
        lines.append(f'                 lambda state: {exprs[0]})')
    else:
        lines.append(f'        add_rule(world.multiworld.get_location("{loc_name}", player),')
        lines.append(f'                 lambda state: (')
        for i, expr in enumerate(exprs):
            suffix = " and" if i < len(exprs) - 1 else ""
            lines.append(f'                     {expr}{suffix}')
        lines.append(f'                 ))')


def _get_bullet_gun_names(items: list, fallback: list) -> list:
    """
    Return gun item names from active Items rows flagged with is_gun=Yes.
    Falls back to fallback list if the sheet has not been updated yet.
    """
    guns = [
        row.get("item_name", "").strip()
        for row in items
        if is_active_row(row)
        and row.get("is_gun", "").strip().lower() == "yes"
        and row.get("item_name", "").strip()
        and row.get("item_name", "").strip() != "Progressive Weapon"
    ]
    return guns if guns else fallback


def _get_explosive_item_names(items: list, fallback: list) -> list:
    """
    Return explosive item names from active Items rows flagged with is_explosive=Yes.
    Falls back to fallback list if the sheet has not been updated yet.
    """
    explosives = [
        row.get("item_name", "").strip()
        for row in items
        if is_active_row(row)
        and row.get("is_explosive", "").strip().lower() == "yes"
        and row.get("item_name", "").strip()
        and row.get("item_name", "").strip() != "Progressive Weapon"
    ]
    return explosives if explosives else fallback


def _get_helper_item_names(raw: str, alias_map: dict, skip_progressive: bool = False) -> list:
    names: list = []
    for token in [part.strip() for part in (raw or "").split("|") if part.strip()]:
        if skip_progressive and token == "Progressive Weapon":
            continue
        resolved = _extract_token_name(token, alias_map)
        if resolved:
            names.append(resolved)
    return names


# ─────────────────────────────────────────────────────────────────────────────


def gen_rules_py(rules, locations, items):
    """Generate Rules.py from the Rules sheet and Items data."""

    # 1. Identify specific weapons using the same item rows as the client.
    weapon_names = {row["item_name"].strip() for row in get_progressive_gun_rows(items)}

    active_location_names = {
        loc.get("location_name", "").strip()
        for loc in locations
        if is_active_row(loc) and loc.get("location_name", "").strip()
    }
    victory_location_names = {
        loc.get("location_name", "").strip()
        for loc in locations
        if is_active_row(loc) and "victory placed here" in loc.get("notes", "").strip().lower()
    }
    alias_map = _build_item_alias_map(items)

    # ── 1. Categorize rule rows ──────────────────────────────────────────────
    entrance_rules: list = []
    completion: list = []
    location_rule_rows: list = []
    helper_fallback_guns: list = []
    helper_fallback_explosives: list = []

    for r in rules:
        if not is_active_row(r):
            continue

        ent = r.get("entrance_name", "").strip()
        has_gun_col_val = r.get("has_gun", "").strip().lower()
        has_explosive_col_val = r.get("has_explosive", "").strip().lower()
        rule_type = r.get("rule_type", "").strip()

        if ent in active_location_names:
            location_rule_rows.append(r)
        elif ent == "COMPLETION":
            completion.append(r)
        elif rule_type == "helper_has_any":
            if ent == "has_gun":
                helper_fallback_guns = _get_helper_item_names(
                    r.get("vincent_requires", ""),
                    alias_map,
                    skip_progressive=True,
                )
            elif ent == "has_explosive":
                helper_fallback_explosives = _get_helper_item_names(
                    r.get("vincent_requires", ""),
                    alias_map,
                )
        elif ent.startswith("Menu -> "):
            entrance_rules.append(r)

    # ── 2. Build item alias map ──────────────────────────────────────────────
    alias_map = _build_item_alias_map(items)

    # ── 3. Determine bullet gun names ────────────────────────────────────────
    bullet_guns = _get_bullet_gun_names(items, fallback=helper_fallback_guns)
    explosive_items = _get_explosive_item_names(items, fallback=helper_fallback_explosives)

    # ── 4. Parse location rules from Rules sheet rows ───────────────────────
    location_rules: dict = {}
    for r in location_rule_rows:
        loc_name = r.get("entrance_name", "").strip()
        if not loc_name:
            continue
        if loc_name in victory_location_names:
            continue
        raw_item = r.get("required_item", "").strip()
        has_gun_col = r.get("has_gun", "").strip().lower() == "yes"
        has_explosive_col = r.get("has_explosive", "").strip().lower() == "yes"
        groups = _parse_required_item(raw_item, has_gun_col, has_explosive_col, alias_map)
        if groups:
            location_rules[loc_name] = groups

    victory_rule_defs = []
    for loc in locations:
        loc_name = loc.get("location_name", "").strip()
        if loc_name not in victory_location_names:
            continue
        region_name = loc.get("region", "").strip()
        shared_groups = location_rules.get(f"{region_name} - (Clear)")
        per_difficulty_groups = [
            location_rules[clear_name]
            for clear_name in (
                f"{region_name} - Agent (Clear)",
                f"{region_name} - Secret Agent (Clear)",
                f"{region_name} - Double Agent (Clear)",
            )
            if clear_name in location_rules
        ]
        if shared_groups or per_difficulty_groups:
            victory_rule_defs.append((loc_name, shared_groups, per_difficulty_groups))

    # ── 5. Generate file ─────────────────────────────────────────────────────
    lines: list = []
    lines.append("# Auto-generated by codegen.py — do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("# Generated file exception:")
    lines.append("# This file is machine-written from sheet data, so it may use compact Python.")
    lines.append("# We keep the sheet-driven structure here because codegen.py rebuilds it.")
    lines.append("# This is safe because codegen.py rebuilds this file from the same source data.")
    lines.append("")
    lines.append("from typing import TYPE_CHECKING")
    lines.append("from worlds.generic.Rules import add_rule")
    lines.append("from .client_data import WEAPON_ITEM_DEFS")
    lines.append("from .Items import PROGRESSIVE_GUN_ITEM_NAME")
    lines.append("from .Locations import (")
    lines.append("    ITEM_SHARED_LOCATION_GROUPS,")
    lines.append("    MISSION_CLEAR_MODE_PER_MAP,")
    lines.append("    is_valid_location,")
    lines.append(")")
    lines.append("")
    lines.append("if TYPE_CHECKING:")
    lines.append('    from . import GoldeneyeWorld')
    lines.append("")
    lines.append("")

    # 2. Derive thresholds from the actual runtime order, without another ladder.
    lines.extend([
        "# The client unlocks WEAPON_ITEM_DEFS in insertion order.",
        "WEAPON_PROGRESSIVE_COUNTS = {",
        "    weapon['item_name']: count",
        "    for count, weapon in enumerate(WEAPON_ITEM_DEFS.values(), start=1)",
        "}",
        "",
        "",
        "def has_weapon(state, player: int, weapon_name: str) -> bool:",
        "    # 1. Preserve direct weapon ownership in either mode.",
        "    if state.has(weapon_name, player):",
        "        return True",
        "    # 2. Progressive ownership must reach this weapon's runtime position.",
        "    return (",
        "        state.multiworld.worlds[player].options.progressive_weapons.value == 1",
        "        and state.has(PROGRESSIVE_GUN_ITEM_NAME, player,",
        "                      WEAPON_PROGRESSIVE_COUNTS[weapon_name])",
        "    )",
        "",
        "",
    ])

    # has_gun helper
    lines.append("BULLET_GUN_NAMES = [")
    for gun in bullet_guns:
        lines.append(f'    "{gun}",')
    lines.append("]")
    lines.append("")
    lines.append("")
    lines.append("GUN_PROGRESSIVE_COUNT = 1")
    lines.append("EXPLOSIVE_PROGRESSIVE_COUNT = 15")
    lines.append("")
    lines.append("")
    lines.append("EXPLOSIVE_ITEM_NAMES = [")
    for item_name in explosive_items:
        lines.append(f'    "{item_name}",')
    lines.append("]")
    lines.append("")
    lines.append("")
    lines.append("def has_gun(state, player: int) -> bool:")
    lines.append('    """True if player has any gun item or enough Progressive Weapons for guns."""')
    lines.append("    return (")
    lines.append("        any(state.has(gun, player) for gun in BULLET_GUN_NAMES)")
    lines.append('        or state.has("Progressive Weapon", player, GUN_PROGRESSIVE_COUNT)')
    lines.append("    )")
    lines.append("")
    lines.append("")
    lines.append("def has_explosive(state, player: int) -> bool:")
    lines.append('    """True if player has any explosive item or enough Progressive Weapons for explosives."""')
    lines.append("    return (")
    lines.append("        any(state.has(item_name, player) for item_name in EXPLOSIVE_ITEM_NAMES)")
    lines.append('        or state.has("Progressive Weapon", player, EXPLOSIVE_PROGRESSIVE_COUNT)')
    lines.append("    )")
    lines.append("")
    lines.append("")

    # ── Build entrance rule groups ───────────────────────────────────────────
    entrance_rule_defs = []
    for r in entrance_rules:
        ent = r["entrance_name"].strip()
        raw_item = r.get("required_item", "").strip()
        level = normalize_unlock_name(r.get("required_level", "").strip())
        has_gun_col = r.get("has_gun", "").strip().lower() == "yes"
        has_explosive_col = r.get("has_explosive", "").strip().lower() == "yes"
        groups = _parse_required_item(raw_item, has_gun_col, has_explosive_col, alias_map)
        if level:
            groups = [[level]] + groups
        entrance_rule_defs.append((ent, groups))

    # ── set_rules — explicit add_rule calls ──────────────────────────────────
    lines.append('def set_rules(world: "GoldeneyeWorld") -> None:')
    lines.append("    player = world.player")
    lines.append("")

    # Mission entrance rules
    lines.append("    # Mission entrance rules")
    for ent, groups in entrance_rule_defs:
        if groups:
            _emit_entrance_rule(lines, ent, groups, weapon_names)
    lines.append("")

    # Location rules
    if location_rules:
        lines.append("    # Location rules")
        for loc_name in sorted(location_rules):
            _emit_location_rule(lines, loc_name, location_rules[loc_name], weapon_names)
        lines.append("")

    lines.append("    for shared_name, per_difficulty_names in ITEM_SHARED_LOCATION_GROUPS.items():")
    lines.append("        if shared_name not in world.location_name_to_id or not is_valid_location(world, shared_name):")
    lines.append("            continue")
    lines.append("        reachable_names = tuple(")
    lines.append("            location_name")
    lines.append("            for location_name in per_difficulty_names")
    lines.append("            if location_name in world.location_name_to_id and is_valid_location(world, location_name)")
    lines.append("        )")
    lines.append("        if not reachable_names:")
    lines.append("            continue")
    lines.append('        add_rule(world.multiworld.get_location(shared_name, player),')
    lines.append("                 lambda state, location_names=reachable_names: any(")
    lines.append("                     state.can_reach_location(location_name, player)")
    lines.append("                     for location_name in location_names")
    lines.append("                 ))")
    lines.append("")

    # Victory rules
    if victory_rule_defs:
        difficulty_labels = ["Agent", "Secret Agent", "Double Agent"]
        lines.append("    # Victory rules")
        for loc_name, shared_groups, per_difficulty_groups in victory_rule_defs:
            lines.append(f'    if world.options.mission_clear_mode.value == MISSION_CLEAR_MODE_PER_MAP:')
            if shared_groups:
                shared_exprs = _groups_to_exprs(shared_groups, weapon_names)
                if len(shared_exprs) == 1:
                    lines.append(f'        add_rule(world.multiworld.get_location("{loc_name}", player),')
                    lines.append(f'                 lambda state: {shared_exprs[0]})')
                else:
                    lines.append(f'        add_rule(world.multiworld.get_location("{loc_name}", player),')
                    lines.append(f'                 lambda state: (')
                    for i, expr in enumerate(shared_exprs):
                        suffix = " and" if i < len(shared_exprs) - 1 else ""
                        lines.append(f'                     {expr}{suffix}')
                    lines.append(f'                 ))')
            if per_difficulty_groups:
                lines.append(f'    else:')
                diff_exprs = []
                for i, diff_groups in enumerate(per_difficulty_groups):
                    parts = _groups_to_exprs(diff_groups, weapon_names)
                    expr = parts[0] if len(parts) == 1 else "(" + " and ".join(parts) + ")"
                    label = difficulty_labels[i] if i < len(difficulty_labels) else f"Difficulty {i + 1}"
                    diff_exprs.append((expr, label))
                lines.append(f'        add_rule(world.multiworld.get_location("{loc_name}", player),')
                lines.append(f'                 lambda state: (')
                for i, (expr, label) in enumerate(diff_exprs):
                    suffix = " or" if i < len(diff_exprs) - 1 else ""
                    lines.append(f'                     {expr}{suffix}  # {label}')
                lines.append(f'                 ))')
        lines.append("")

    # Completion condition
    comp_item = completion[0]["required_item"].strip() if completion else "Victory"
    lines.append(f'    world.multiworld.completion_condition[player] = lambda state: state.has("{comp_item}", player)')
    lines.append("")

    return "\n".join(lines)


def gen_options_py(options, items):
    """Generate Options.py from the Options sheet."""
    active = build_v02_option_rows(options)
    extra_mission_names = get_extra_mission_names(options, items)
    prepared_options = []
    for opt in active:
        name = opt["option_name"].strip()
        option_type = opt["option_type"].strip()
        if name == "extra_locations" and extra_mission_names:
            option_type = "Choice"
        prepared_options.append(
            {
                "name": name,
                "type": option_type,
                "class_name": get_option_class_name(name, option_type),
                "display": opt["display_name"].strip(),
                "description": opt["description"].strip(),
                "default": opt["default_value"].strip(),
                "values": opt["values_or_range"].strip(),
                "group": opt.get("option_group", "General").strip() or "General",
            }
        )

    lines = []
    lines.append("# Auto-generated by codegen.py — do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("# Generated file exception:")
    lines.append("# This file is machine-written from sheet data, so it may use compact Python.")
    lines.append("# We keep the sheet-driven structure here because codegen.py rebuilds it.")
    lines.append("# This is safe because codegen.py rebuilds this file from the same source data.")
    lines.append("")
    lines.append("from dataclasses import dataclass")
    lines.append("from typing import Dict, List")
    lines.append("from Options import Choice, DeathLink, OptionGroup, Range, Toggle")
    lines.append("from worlds.AutoWorld import PerGameCommonOptions")
    lines.append("")
    lines.append("")

    lines.append("def create_option_groups() -> List[OptionGroup]:")
    lines.append("    return [")
    lines.append("        OptionGroup(name=name, options=options)")
    lines.append("        for name, options in GOLDENEYE_OPTION_GROUPS.items()")
    lines.append("    ]")
    lines.append("")
    lines.append("")

    for option in prepared_options:
        lines.append(f'class {option["class_name"]}({option["type"]}):')
        append_wrapped_docstring(lines, option["description"])
        lines.append(f'    display_name = "{option["display"]}"')

        if option["type"] == "Choice":
            value_map = resolve_choice_option_values(option["name"], option["values"], options, items)
            for choice_name, choice_value in value_map.items():
                lines.append(f"    option_{choice_name} = {choice_value}")
            lines.append(f'    default = {resolve_choice_default(option["default"], value_map)}')
        elif option["type"] == "Range":
            if "-" in option["values"]:
                parts = option["values"].split("-")
                lines.append(f"    range_start = {parts[0].strip()}")
                lines.append(f"    range_end = {parts[1].strip()}")
            lines.append(f'    default = {option["default"]}')
        elif option["type"] in {"Toggle", "DeathLink"}:
            lines.append(f'    default = {resolve_toggle_default(option["default"], option["values"])}')

        lines.append("")
        lines.append("")

    lines.append("@dataclass")
    lines.append("class GoldeneyeOptions(PerGameCommonOptions):")
    for option in prepared_options:
        pad = " " * max(1, 28 - len(option["name"]))
        lines.append(f'    {option["name"]}:{pad}{option["class_name"]}')
    lines.append("")
    lines.append("")

    groups = {}
    for option in prepared_options:
        groups.setdefault(option["group"], []).append(option["class_name"])

    lines.append("GOLDENEYE_OPTION_GROUPS: Dict[str, List[type]] = {")
    for group, names in groups.items():
        lines.append(f'    "{group}": [')
        for name in names:
            lines.append(f"        {name},")
        lines.append("    ],")
    lines.append("}")
    lines.append("")

    return "\n".join(lines)


def gen_client_sheet_reference_py(client_data, locations, items, rules):
    """Generate a planning-only client sheet reference file."""
    promoted_items = build_v02_item_rows(items, locations, rules)
    mission_clear_locations = get_mission_clear_location_map(locations)
    per_difficulty_objectives = build_per_difficulty_objective_rows(locations)
    shared_objectives = build_shared_objective_rows(locations)
    item_effect_defs = build_item_effect_defs(promoted_items)
    progressive_gun_base_row = get_progressive_gun_base_row(promoted_items)
    progressive_gun_rows = get_progressive_gun_rows(promoted_items)
    progressive_gun_item_ids = [parse_int_cell(row.get("ap_code", "")) for row in progressive_gun_rows]
    progressive_gun_item_names = [row["item_name"].strip() for row in progressive_gun_rows]
    progressive_gun_base_item_id = (
        parse_int_cell(progressive_gun_base_row.get("ap_code", ""))
        if progressive_gun_base_row is not None
        else None
    )
    mission_item_missions = build_mission_item_mission_table(promoted_items)
    mission_item_matches = build_mission_item_match_table(locations, promoted_items)
    lines = []
    lines.append("# Auto-generated by codegen.py — do not edit manually")
    lines.append(f"# Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("# Planning reference only:")
    lines.append("# This file is not imported by the live apworld.")
    lines.append("# codegen.py keeps the Client sheet data here so we can plan and rebuild")
    lines.append("# GoldeneyeClient.py later without carrying extra runtime data in")
    lines.append("# goldeneye_apworld.")
    lines.append("")
    lines.append("# Data flow note:")
    lines.append("# - OBJECTIVE_FLAGS_PER_DIFFICULTY comes from explicit Objective 1/2/3 rows in the")
    lines.append("#   Locations sheet whenever those rows exist.")
    lines.append("# - OBJECTIVE_FLAGS_SHARED comes from explicit Objective 0 rows whenever they exist.")
    lines.append("# - MISSIONS includes both per-difficulty clear ids and shared clear ids.")
    lines.append("")

    missions = []
    for row in client_data:
        name = row["mission_name"].strip()
        mid = parse_int_cell(row["mission_id_hex"])
        mission_loc = mission_clear_locations.get(name)
        if mission_loc is None:
            raise ValueError(f"Could not find clear locations for mission '{name}'")
        missions.append(
            {
                "name": name,
                "mission_id": mid,
                "map_id": parse_int_cell(str(mission_loc["map_id"])),
                "clear_location_ids": {
                    difficulty_code: parse_int_cell(str(mission_loc["location_ids"][difficulty_code]))
                    for difficulty_code in (1, 2, 3)
                },
                "shared_clear_location_id": parse_int_cell(str(mission_loc["shared_location_id"])),
                "item_name": normalize_unlock_name(row["item_name"]),
                "ram_offset": parse_int_cell(row["ram_offset"]),
            }
        )
    append_formatted_assignment(lines, "MISSIONS", missions)
    lines.append("")

    lines.append("ITEM_ID_TO_OFFSET = {")
    for row in client_data:
        item_id = row["item_ap_id"].strip()
        offset = row["ram_offset"].strip()
        item_name = row["item_name"].strip()
        lines.append(f"    {item_id}: {offset},   # {item_name}")
    lines.append("}")
    lines.append("")

    append_formatted_assignment(
        lines,
        "ITEM_EFFECT_DEFS",
        {item_id: item_effect_defs[item_id] for item_id in sorted(item_effect_defs)},
    )
    lines.append("")
    append_formatted_assignment(lines, "PROGRESSIVE_GUN_ITEM_IDS", progressive_gun_item_ids)
    append_literal_list_assignment(lines, "PROGRESSIVE_GUN_ITEM_NAMES", progressive_gun_item_names)
    append_formatted_assignment(lines, "PROGRESSIVE_GUN_BASE_ITEM_ID", progressive_gun_base_item_id)
    lines.append("")
    append_formatted_assignment(lines, "MISSION_ITEM_MISSIONS", mission_item_missions)
    lines.append("")
    append_formatted_assignment(lines, "MISSION_ITEM_MATCHES", mission_item_matches)
    lines.append("")
    lines.append("# Objective detection: each entry maps a location AP code to a RAM address")
    lines.append("# The address holds 0 (incomplete) or 1 (complete)")
    lines.append("OBJECTIVE_FLAGS_PER_DIFFICULTY = {")
    for loc in per_difficulty_objectives:
        lines.append(
            f'    {loc["ap_code"].strip()}: ("{loc["location_name"].strip()}", {loc["hex_addr"].strip()}, '
            f'{loc["map_id"].strip() or "0"}),'
        )
    lines.append("}")
    lines.append("")

    lines.append("OBJECTIVE_FLAGS_SHARED = {")
    for loc in shared_objectives:
        lines.append(
            f'    {loc["ap_code"]}: ("{loc["location_name"]}", {loc["hex_addr"]}, {loc["map_id"]}),'
        )
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def yaml_choice_key(choice_name: str) -> str:
    if choice_name in {"false", "true"}:
        return f"'{choice_name}'"
    return choice_name


def append_yaml_comment(lines, text: str, indent: str = "  "):
    for raw_line in (text or "").splitlines():
        line = raw_line.strip()
        if line:
            lines.append(f"{indent}# {line}")


def gen_yaml_template(options, items):
    active = build_v02_option_rows(options)
    lines = []
    lines.append("name: 007{NUMBER}")
    lines.append("description: Default GoldenEye 007 Template")
    lines.append('game: "GoldenEye 007"')
    lines.append("requires:")
    lines.append("  version: 0.6.6")
    lines.append("")
    lines.append("GoldenEye 007:")

    for opt in active:
        option_name = opt["option_name"].strip()
        option_type = opt["option_type"].strip()
        if option_name == "extra_locations" and get_extra_mission_names(options, items):
            option_type = "Choice"

        display_name = opt.get("display_name", "").strip()
        description = opt.get("description", "").strip()
        if display_name:
            append_yaml_comment(lines, display_name)
        if description:
            append_yaml_comment(lines, description)

        if option_type == "Choice":
            value_map = resolve_choice_option_values(option_name, opt.get("values_or_range", ""), options, items)
            default_value = resolve_choice_default(opt.get("default_value", ""), value_map)
            lines.append(f"  {option_name}:")
            for choice_name, choice_value in sorted(value_map.items(), key=lambda item: item[1]):
                rendered_key = yaml_choice_key(choice_name)
                weight = 50 if choice_value == default_value else 0
                lines.append(f"    {rendered_key}: {weight}")
        elif option_type in {"Toggle", "DeathLink"}:
            default_value = resolve_toggle_default(opt.get("default_value", ""), opt.get("values_or_range", ""))
            false_weight = 0 if default_value else 50
            true_weight = 50 if default_value else 0
            lines.append(f"  {option_name}:")
            lines.append(f"    'false': {false_weight}")
            lines.append(f"    'true': {true_weight}")
        elif option_type == "Range":
            default_value = parse_int_cell(opt.get("default_value", ""))
            rendered_default = default_value if default_value is not None else 0
            lines.append(f"  {option_name}: {rendered_default}")
        else:
            lines.append(f"  {option_name}: {opt.get('default_value', '').strip() or 0}")

        lines.append("")

    lines.append("  progression_balancing:")
    lines.append("    normal: 50")
    lines.append("")
    lines.append("  accessibility:")
    lines.append("    full: 50")
    lines.append("")
    lines.append("  local_items:")
    lines.append("    []")
    lines.append("")
    lines.append("  non_local_items:")
    lines.append("    []")
    lines.append("")
    lines.append("  start_inventory:")
    lines.append("    {}")
    lines.append("")
    lines.append("  start_hints:")
    lines.append("    []")
    lines.append("")
    lines.append("  start_location_hints:")
    lines.append("    []")
    lines.append("")
    lines.append("  exclude_locations:")
    lines.append("    []")
    lines.append("")
    lines.append("  priority_locations:")
    lines.append("    []")
    lines.append("")
    lines.append("  item_links:")
    lines.append("    []")
    lines.append("")

    return "\n".join(lines)


def validate_option_rows(options):
    errors = []
    seen_option_names = set()

    for opt in [row for row in options if is_active_row(row)]:
        option_name = opt.get("option_name", "").strip()
        option_type = opt.get("option_type", "").strip()
        display_name = opt.get("display_name", "").strip()
        default_value = opt.get("default_value", "").strip()
        values_or_range = opt.get("values_or_range", "").strip()

        if not option_name:
            errors.append("Found an active option row with no option_name.")
            continue
        if option_name in seen_option_names:
            errors.append(f"Option '{option_name}' is defined more than once.")
        seen_option_names.add(option_name)

        if option_type not in SUPPORTED_OPTION_TYPES:
            errors.append(
                f"Option '{option_name}' uses unsupported option_type '{option_type}'. "
                f"Supported types: {', '.join(sorted(SUPPORTED_OPTION_TYPES))}."
            )
            continue

        if not display_name:
            errors.append(f"Option '{option_name}' is missing a display_name.")

        if option_type == "Choice":
            if not values_or_range:
                errors.append(f"Choice option '{option_name}' is missing values_or_range.")
                continue

            try:
                value_map = json.loads(values_or_range)
            except json.JSONDecodeError:
                raw_choices = [part.strip() for part in values_or_range.split(",") if part.strip()]
                if not raw_choices:
                    errors.append(f"Choice option '{option_name}' has an empty values_or_range list.")
                elif default_value and not default_value.isdigit() and default_value not in raw_choices:
                    errors.append(
                        f"Choice option '{option_name}' has default '{default_value}' "
                        f"which is not one of: {', '.join(raw_choices)}."
                    )
            else:
                if not isinstance(value_map, dict) or not value_map:
                    errors.append(f"Choice option '{option_name}' JSON values_or_range must be a non-empty object.")
                elif default_value and not default_value.isdigit() and default_value not in value_map:
                    errors.append(
                        f"Choice option '{option_name}' has default '{default_value}' "
                        f"which is not a valid choice key."
                    )

        elif option_type == "Range":
            if not re.match(r"^\d+\s*-\s*\d+$", values_or_range):
                errors.append(
                    f"Range option '{option_name}' must use 'min-max' values_or_range, got '{values_or_range}'."
                )
                continue
            if default_value and not default_value.isdigit():
                errors.append(f"Range option '{option_name}' has non-numeric default '{default_value}'.")

    return errors


def validate_item_rows(items):
    errors = []
    seen_ap_codes = set()

    for row in [item for item in items if is_active_row(item)]:
        item_name = row.get("item_name", "").strip()
        ap_code_text = row.get("ap_code", "").strip()
        category = row.get("category", "").strip()
        classification = row.get("classification", "").strip()
        effect_type_raw = get_first_non_empty_value(row, "effect_type", "item_effect", "effect", "ram_effect")
        effect_type = normalize_item_effect_type(effect_type_raw)
        explicit_effect = has_explicit_item_effect_metadata(row)

        if not item_name:
            errors.append("Found an active item row with no item_name.")
            continue

        ap_code = parse_int_cell(ap_code_text)
        if ap_code is None:
            errors.append(f"Item '{item_name}' has invalid ap_code '{ap_code_text}'.")
        elif ap_code in seen_ap_codes:
            errors.append(f"Item '{item_name}' reuses ap_code '{ap_code_text}'.")
        else:
            seen_ap_codes.add(ap_code)

        if category in {"Unlock", "Event"} or classification == "event":
            continue
        if is_progressive_gun_base_row(row):
            continue

        generic_sheet_trap = effect_type_raw.strip().lower() == "trap"
        if (
            explicit_effect
            and effect_type is None
            and not (generic_sheet_trap and item_name in LEGACY_ITEM_EFFECT_DEFS)
        ):
            errors.append(
                f"Item '{item_name}' has effect metadata but unsupported effect_type '{effect_type_raw}'."
            )
            continue

        if not explicit_effect and item_name not in LEGACY_ITEM_EFFECT_DEFS:
            continue

        effect_def = build_item_effect_def(row)
        if effect_def is None:
            errors.append(f"Item '{item_name}' could not build an effect definition.")
            continue

        if effect_def["effect_type"] == "weapon":
            if "weapon_id" not in effect_def:
                errors.append(f"Weapon item '{item_name}' is missing weapon_id.")
            ammo_keys = ("ammo_offset", "ammo_grant", "ammo_max")
            present_ammo_keys = [key for key in ammo_keys if key in effect_def]
            if present_ammo_keys and len(present_ammo_keys) != len(ammo_keys):
                missing_ammo_keys = [key for key in ammo_keys if key not in effect_def]
                errors.append(
                    f"Weapon item '{item_name}' has partial ammo metadata; missing {', '.join(missing_ammo_keys)}."
                )
        elif effect_def["effect_type"] == "ammo":
            if "ammo_offset" not in effect_def:
                errors.append(f"Ammo item '{item_name}' is missing ammo_offset.")
            if "ammo_grant" not in effect_def:
                errors.append(f"Ammo item '{item_name}' is missing ammo_grant.")
            if "ammo_max" not in effect_def:
                errors.append(f"Ammo item '{item_name}' is missing ammo_max.")
        elif effect_def["effect_type"] == "multi_ammo":
            if not effect_def.get("ammo_targets"):
                errors.append(f"Item '{item_name}' has multi_ammo effect with no ammo_targets.")

    return errors


def validate_region_references(locations, regions):
    errors = []
    active_regions = [r for r in regions if is_active_row(r)]
    active_locations = [l for l in locations if is_active_row(l)]
    region_names = {r["region_name"].strip() for r in active_regions}
    region_names.add("Menu")

    for loc in active_locations:
        region_name = loc.get("region", "").strip()
        if region_name and region_name not in region_names:
            errors.append(
                f"Location '{loc.get('location_name', '').strip()}' references unknown region '{region_name}'."
            )

    return errors


def validate_client_and_clear_data(client_data, locations):
    errors = []

    for loc in locations:
        if not is_active_row(loc) or not is_stage_mission_clear_row(loc):
            continue
        if parse_stage_clear_name(loc.get("location_name", "")) is None:
            errors.append(
                f"MissionClear row '{loc.get('location_name', '').strip()}' has an invalid stage-clear name. "
                f"Expected either '<Mission> - <Difficulty> (Clear)' or '<Mission> - (Clear)'."
            )

    mission_clear_locations = get_mission_clear_location_map(locations)
    for row in client_data:
        mission_name = row.get("mission_name", "").strip()
        mission_entry = mission_clear_locations.get(mission_name)
        if mission_entry is None:
            errors.append(f"Client mission '{mission_name}' has no matching mission clear rows.")
            continue

        missing_difficulties = [
            MISSION_DIFFICULTY_NAMES[difficulty_code]
            for difficulty_code in (1, 2, 3)
            if difficulty_code not in mission_entry["location_ids"]
        ]
        if missing_difficulties:
            errors.append(
                f"Client mission '{mission_name}' is missing per-difficulty clear rows for: "
                f"{', '.join(missing_difficulties)}."
            )

        if not mission_entry["shared_location_id"]:
            errors.append(f"Client mission '{mission_name}' is missing its any-difficulty clear row.")

        expected_agent_clear_id = mission_entry["location_ids"].get(1)
        configured_location_id = row.get("location_ap_id", "").strip()
        if expected_agent_clear_id and configured_location_id and expected_agent_clear_id != configured_location_id:
            errors.append(
                f"Client mission '{mission_name}' has location_ap_id '{configured_location_id}', "
                f"but the Agent clear row uses '{expected_agent_clear_id}'."
            )

        expected_item_name = normalize_unlock_name(row.get("item_name", ""))
        if expected_item_name and expected_item_name != mission_name:
            errors.append(
                f"Client mission '{mission_name}' points at item '{row.get('item_name', '').strip()}', "
                f"which normalizes to '{expected_item_name}'."
            )

    return errors


def validate_option_dependencies(options, locations):
    errors = []
    active_option_names = {
        row.get("option_name", "").strip()
        for row in options
        if is_active_row(row)
    }

    if get_shared_mission_clear_rows(locations) and "mission_clear_mode" not in active_option_names:
        errors.append(
            "Shared MissionClear rows are present, but the Options sheet is missing an active "
            "'mission_clear_mode' row."
        )

    if build_shared_objective_rows(locations) and "objective_mode" not in active_option_names:
        errors.append(
            "Shared objective rows are present, but the Options sheet is missing an active "
            "'objective_mode' row."
        )

    return errors


def write_file(path, content):
    """Write content to file, creating directories as needed."""
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"  OK {os.path.basename(path)}")


def validate_active_package_shell(source_dir):
    missing = []
    for relative_path in REQUIRED_PACKAGE_RELATIVE_PATHS:
        full_path = os.path.join(source_dir, relative_path)
        if not os.path.exists(full_path):
            missing.append(relative_path.replace("\\", "/"))

    if missing:
        missing_text = ", ".join(missing)
        raise FileNotFoundError(
            "Active package is missing required package files: "
            f"{missing_text}"
        )


def remove_obsolete_generated_split_files(source_dir):
    for file_name in OBSOLETE_GENERATED_SPLIT_FILES:
        file_path = os.path.join(source_dir, file_name)
        if os.path.exists(file_path):
            os.chmod(file_path, 0o666)
            os.remove(file_path)


def package_apworld(source_dir, output_path):
    """Package the active world as test_build/goldeneye.apworld."""
    validate_active_package_shell(source_dir)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with zipfile.ZipFile(output_path, "w", zipfile.ZIP_DEFLATED) as archive:
        for root, dirs, files in os.walk(source_dir):
            dirs[:] = [d for d in dirs if d not in {"__pycache__", "goldeneye_apworld"}]
            for file in files:
                if file.endswith(".pyc") or file.endswith(".backup_pre_cleanup"):
                    continue
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, source_dir)
                archive_path = os.path.join("goldeneye", rel_path).replace("\\", "/")
                archive.write(full_path, archive_path)
    print(f"  OK {os.path.basename(output_path)}")


def print_debug_summary(items, locations, rules, options):
    print("Debug summary:")
    print("  Active column: in_v02")
    print(f"  Active Items: {sum(1 for row in items if is_active_row(row))}")
    print(f"  Active Locations: {sum(1 for row in locations if is_active_row(row))}")
    print(f"  Active Rules: {sum(1 for row in rules if is_active_row(row))}")
    print(f"  Active Options: {sum(1 for row in options if is_active_row(row))}")

    promoted_options = build_v02_option_rows(options)
    promoted_items = build_v02_item_rows(items, locations, rules)
    print("  Option rows:")
    for row in promoted_options:
        option_name = row.get("option_name", "").strip()
        option_type = row.get("option_type", "").strip()
        default_value = row.get("default_value", "").strip()
        values = row.get("values_or_range", "").strip()
        resolved_values = resolve_choice_option_values(option_name, values, promoted_options, promoted_items)
        print(
            f"    {option_name}: type={option_type} default={default_value!r} "
            f"values={values!r} resolved={resolved_values}"
        )
    print()


def main():
    print("GoldenEye AP - Code Generator")
    print("=" * 40)
    print(f"Workbook: {os.path.normpath(WORKBOOK_PATH)}")
    print()

    print("Reading workbook...")
    workbook_data = load_workbook_data(WORKBOOK_PATH)
    print()

    # Read all sheets
    print("Reading sheets...")
    items = workbook_data["Items"]
    locations = workbook_data["Locations"]
    regions = workbook_data["Regions"]
    rules = workbook_data["Rules"]
    options = workbook_data["Options"]
    client = workbook_data["Client"]
    print(f"  Items: {len(items)} rows")
    print(f"  Locations: {len(locations)} rows")
    print(f"  Regions: {len(regions)} rows")
    print(f"  Rules: {len(rules)} rows")
    print(f"  Options: {len(options)} rows")
    print(f"  Client: {len(client)} rows")
    print()

    print_debug_summary(items, locations, rules, options)

    # Validate
    print("Validating...")
    active_items = [i for i in items if is_active_row(i)]
    active_locs = [l for l in locations if is_active_row(l)]
    item_count = len([i for i in active_items if i["classification"].strip() != "event"])
    loc_count = len([l for l in active_locs if l["category"].strip() != "Event"])

    if item_count < loc_count:
        print(f"  WARNING: {item_count} items < {loc_count} locations - generation may fail")
    else:
        print(f"  OK {item_count} items, {loc_count} locations - balanced")

    validation_errors = []
    validation_errors.extend(validate_item_rows(items))
    validation_errors.extend(validate_option_rows(options))
    validation_errors.extend(validate_option_dependencies(options, locations))
    validation_errors.extend(validate_region_references(locations, regions))
    validation_errors.extend(validate_client_and_clear_data(client, locations))

    print()

    if validation_errors:
        for error in validation_errors:
            print(f"  ERROR: {error}")
        raise ValueError(f"Validation failed with {len(validation_errors)} error(s).")

    # Generate
    print("Generating .py files...")
    write_file(os.path.join(ACTIVE_WORLD_DIR, "Types.py"), gen_types_py())
    write_file(os.path.join(ACTIVE_WORLD_DIR, "Items.py"), gen_items_py(items, locations, options, rules))
    write_file(
        os.path.join(ACTIVE_WORLD_DIR, "Locations.py"),
        gen_locations_py(locations, options, items, rules),
    )
    write_file(os.path.join(ACTIVE_WORLD_DIR, "Regions.py"), gen_regions_py(regions))
    write_file(os.path.join(ACTIVE_WORLD_DIR, "Rules.py"), gen_rules_py(rules, locations, items))
    write_file(os.path.join(ACTIVE_WORLD_DIR, "Options.py"), gen_options_py(options, items))
    write_file(os.path.join(ACTIVE_WORLD_DIR, "client_data.py"), gen_client_data_py(client, locations, options, items))
    write_file(CLIENT_SHEET_REFERENCE_PATH, gen_client_sheet_reference_py(client, locations, items, rules))
    remove_obsolete_generated_split_files(ACTIVE_WORLD_DIR)
    write_file(YAML_OUTPUT_PATH, gen_yaml_template(options, items))
    package_apworld(ACTIVE_WORLD_DIR, APWORLD_OUTPUT_PATH)
    print()
    print(f"Done! Wrote generated files to: {ACTIVE_WORLD_DIR}")
    print(f"Client planning reference: {CLIENT_SHEET_REFERENCE_PATH}")
    print(f"Packaged apworld: {APWORLD_OUTPUT_PATH}")
    print("Now run test_build.py to install/generate, or copy the apworld manually.")
    print()


if __name__ == "__main__":
    main()
