# Project Base Archipelago setup (1.0.1)

Supply clean **Super Metroid (Japan, USA)** and **A Link to the Past Japan 1.0** ROMs (`.sfc` or `.smc`).  
AP automatically reconstructs Project Base 0.8.4.2 using its bundled graphics-stripped PB patch, then applies your seed.

1. Install `projectbase.apworld` using the Archipelago Launcher, then restart it.
2. Run `Generate Template Options` in the Launcher to create the .yaml
3. Put the .yaml into your `Players` folder and generate a multiworld.
4. Open the generated `.appb` with the SNI Client.
    1. AP builds PB from your two ROMs and produces the player ROM.  
Missing ROM paths open the standard AP file picker.
5. Load the created ROM in BizHawk and run the Lua script C:\ProgramData\Archipelago\SNI\lua\connector.lua

```yaml
name: Player
game: Project Base
Project Base:
  difficulty: normal
  accessibility: full
  progression_balancing: 50
```

Known logic limitation:  
The source randomizer has no final-goal logic, so `GOAL_RULE` and  
`GOAL_COUNTS` in `rules.py` are conservative added requirements.  
They require Varia, Ice, Charge, the boss routes, at least three Energy Tanks, ten Missile
packs and five Super Missile packs.

The item pool marks 10 Missile packs, 5 Super Missile packs and 2 Power Bomb
packs as progression to cover the goal and route requirements. The remaining
42 Missile packs, 6 Super Missile packs and 9 Power Bomb packs are filler.

DeathLink is not supported yet.

## Randomizer options

Edit the `Project Base:` section in your YAML.

| Feature | YAML options |
| --- | --- |
| Logic preset and individual techniques | `difficulty`, `enabled_techniques`, `disabled_techniques` |
| Energy thresholds and Gravity heat protection settings for logic | `energy_low`, `energy_medium`, `energy_high`, `gravity_heat` |
| Equipment/tanks at source major checks | `major_minor` |
| Native gameplay settings | `gameplay_features` |
| Initial menus and HUD | `hud`, `bomb_timer`, `pause_screen` |
| Ship start, elevator speed, ship warp | `skip_ceres`, `fast_elevators`, `ship_warp` (default on) |
| Room colors | `shuffle_tileset_palettes`, `palette_greyscale`, `palette_silhouette`, `palette_continuity` |
| Beam and suit colors | `shuffle_beam_palettes`, `shuffle_suit_palettes`, `suit_palette_pool` |
| HUD colors | `hud_color`, `hud_color_secondary` (`original` or quoted RGB hex) |
| Text/numeric fonts | `text_font`, `number_font` (`original`, `shuffle`, or a named font) |
| Mystery pickup graphics | `mystery_items` (AP messages still identify rewards) |
| Experimental modes (no logic support) | `shuffle_room_fx`, `flood_mode`, `party_rando` (default off) |

Text font choices are `original`, `shuffle`, `braille`, `upside_down`,
`bad_kerning`, `chozo`, `greek`, and `leet_speak`.

Technique names are `wall_jump`, `infinite_bomb_jump`, `heat_run`, `mochball`,
`super_missile_jump`, `underwater_wall_jump`, and `backflip_crumble`.  
Tank requirements accept `preset` or 0–14 pickups.  
Heat-run thresholds stay 5/8 tanks.  
Backflip routes also require the gameplay `backflip` setting.  
Gravity heat protection changes both ROM damage behavior and logic.

```yaml
Project Base:
  difficulty: normal
  enabled_techniques: [underwater_wall_jump]
  disabled_techniques: [infinite_bomb_jump]
  energy_low: preset
  energy_medium: 3
  energy_high: 5
  gravity_heat: disabled
  major_minor: true
  hud: rando
  bomb_timer: fast
  shuffle_tileset_palettes: true
  shuffle_suit_palettes: true
  suit_palette_pool: [vanilla, pb_expanded, hacks]
  hud_color: '#33CC99'
  text_font: original
  number_font: original
  mystery_items: false
  shuffle_room_fx: false
  flood_mode: false
  party_rando: false
```

`gameplay_features` is the complete set of enabled settings, not a list of
changes: omitted names are disabled. Valid names are `auto_morph`, `beam_flicker`,
`beam_trails`, `morph_flash`, `spark_exit`, `low_health_alert`, `screen_shake`,
`keep_speed`, `quick_booster`, `auto_run`, `sound_fx`, `backflip`, `respin`,
`quick_morph`, `music`, `cannon_tint`, `time_attack`, `moon_walk`, `up_spin`,
`disable_map`, `speed_echoes`, `flip_echoes`, `auto_save`, `clear_message_box`,
`screw_attack_glow`, and `spin_complex`. The in-game menu can change these later.

Major/minor keeps PB equipment and tanks in major checks.  
Ammo may also occupy major checks to start progression, items from other games can occupy either.  

Flood Mode and room FX shuffle alter liquids/traversal without matching route rules in the original source.  
Logical beatability does not guarantee physical beatability with these options.

The source's Controls button, enemy-palette shuffle, and beam/morph graphic
shuffle are unfinished placeholders. Its missile-threshold controls are unused.
“Vanilla Map” selects logic for another base ROM, it does not convert the
supported 0.8.4.2 map. AP supplies seed selection, fill, output and spoilers.
