# Mega Man X6 Setup Guide

## Required software

- **Archipelago** 0.6.7 or later
  ([releases](https://github.com/ArchipelagoMW/Archipelago/releases)), and the
  `mmx6.apworld` file.
- **BizHawk 2.7 or newer**
  ([releases](https://github.com/TASEmulators/BizHawk/releases)) — 2.7.0 is the
  minimum Archipelago's connector script accepts. This world was tested on
  **2.10**; newer versions print an untested-version warning from the connector
  but are expected to work. On first install, run BizHawk's prerequisites
  installer if EmuHawk will not start. The PS1 core is **NymaShock**
  (BizHawk's default).
- A **US-region PS1 BIOS** (e.g. SCPH-5501), dumped from your own console. In
  EmuHawk: **Config → Firmware**, find the PSX (U) entry and point it at your
  BIOS file — or drop the file into BizHawk's `Firmware` folder and let it
  auto-detect.
- A **Mega Man X6 NTSC-U (SLUS-01395) disc image**, dumped from your own copy:
  a raw **2352-byte/sector `.bin`**, single data track. None is distributed
  here.

### Accepted disc images

The patcher checks the MD5 of your `.bin`:

| MD5 | Notes |
|---|---|
| `237b6feddd1a88e86ab1cddc8822f03f` | Redump `Mega Man X6 (USA) (Rev 1)` — the standard dump |
| `ae1f630f686edb48f84f8d69346bc8a8` | The development copy this world was built on |

Both are accepted because both have actually been patched and verified. They
are not quite the same file — the second has eight extra trailing blank sectors
and a differently mastered filesystem header — but the game's own code
(`SLUS_013.95` and `ROCK_X6.BIN`) is **byte-identical** between them, so both
produce an identical patched game.

To check yours on Windows:

```
certutil -hashfile "Mega Man X6 (USA) (Rev 1).bin" MD5
```

If it matches neither hash, your dump is a different format (2048-byte sectors,
a `.iso`, or multi-track) — re-dump as raw 2352-byte mode. Patching verifies
the image before touching it and refuses anything else, so an unexpected disc
fails loudly instead of producing a subtly broken game.

## Installing the apworld

Put `mmx6.apworld` in your Archipelago install's `custom_worlds` folder, then
restart the Archipelago Launcher. "Mega Man X6" should appear in the games
list.

**Everyone in a multiworld must use the same `mmx6.apworld` version** — the
game edits live in the apworld, not in the seed, so a version mismatch between
the generator and a player produces a disc that does not match the seed's
expectations.

## Generating and patching

1. Generate a game with a Mega Man X6 YAML (produce a template from the
   Launcher's **Generate Template Options**).
2. From the finished seed you will receive a **`.apmmx6`** file.
3. Open it via the Launcher's **Open Patch** (double-clicking the file also
   works if your system associates `.apmmx6` with Archipelago). The first time,
   Archipelago will ask you to locate your Mega Man X6 `.bin` — point it at the
   file you verified above.
4. This produces a patched `.cue` + `.bin` beside the patch file. **This** is
   the disc you play; keep your original untouched.

## Player colours (optional)

X, Zero and the Shadow, Blade and Ultimate armours can each be recoloured.
Purely cosmetic: no items, locations or logic change, and two players in the
same multiworld can pick differently.

They are ordinary options, so they go in your YAML with everything else:

```yaml
  x_palette: emerald
  zero_palette: violet
  shadow_palette: vanilla
  blade_palette: vanilla
  ultimate_palette: vanilla
```

Each accepts `vanilla` (leave it alone), `random`, or one of:

> crimson · scarlet · amber · gold · olive · forest · emerald · teal · cyan ·
> azure · blue · indigo · violet · magenta · rose · silver · black · white

`random` is rolled when the seed is generated, so your colour is decided once
and does not change under you. It picks from the whole list, so it can land on
vanilla.

### Changing your mind without a new seed

The colour is part of the seed, so changing your YAML normally means
generating again. If you would rather not, override it on your own machine
instead. Put the colour under `mmx6_options` in Archipelago's `host.yaml` —
the same file that remembers where your disc image is:

```yaml
mmx6_options:
  rom_file: "Megaman X6.bin"
  x_palette: crimson
```

Anything you name there beats your YAML when the patch is opened. Then:

1. **Delete the `.bin` and `.cue` you made last time.** The patcher skips its
   work if a disc of that name is already there, so if you miss this step
   nothing happens and you get no warning.
2. Open the same `.apmmx6` again. No new seed, and no need to restart the
   Launcher.

Deleting the old disc and patching to the **same filename** is deliberate:
BizHawk keys memory cards *and* savestates to the disc's filename, so keeping
the name keeps your progress. Patch to a new name and the game will look like
it has an empty card.

Two things about the override specifically:

- **`vanilla` in `host.yaml` does nothing.** It means "nothing set here", not
  "force vanilla". Archipelago writes those entries into your `host.yaml` by
  itself with `vanilla` already in them, so treating that as a real choice
  would quietly override everybody's YAML. To play in vanilla colours, choose
  `vanilla` in your YAML.
- `random` there is rolled from your player name rather than the seed, so it
  gives you the same colour every time you re-patch.

### Notes

- **Falcon Armor is not covered.** It keeps its usual colours whatever you
  set, and it has no setting of its own. Worth knowing before you pick: X6
  starts you in Falcon, so `x_palette` does not show up until you are playing
  as plain X or you switch armours. (Falcon's colours are not stored in the
  disc in a form this feature can reach.)
- Faces and skin are never repainted, and Zero keeps his blond hair and his
  helmet crystal — only armour and trim change, so shading and outlines stay
  intact.
- **Black Zero is not covered either.** He keeps his usual colours whatever
  you set.
- A seed generated before colours were YAML options can still be recoloured,
  through the `host.yaml` override above.

## Playing

1. Open **BizHawk** and load the patched **`.cue`** (not the original, and not
   the `.bin` directly).
2. Open **Tools → Lua Console**, then **Script → Open Script**, and load
   `data/lua/connector_bizhawk_generic.lua` from your Archipelago install.
3. From the Archipelago Launcher, start the **BizHawk Client** and connect
   it to the room's address with your slot name.

The client will report whether it sees a patched disc and confirm it can see
the game. Once connected, play normally — checks send themselves and items
arrive as you go.

## Things worth knowing

**A newly granted weapon appears after the next stage load.** The game latches
your weapon list when a stage starts, so a weapon that arrives mid-stage will
not be selectable straight away. **Dying is enough** to pick it up — you do not
have to leave the stage.

**Save in-game normally.** Archipelago re-applies everything you have received
whenever you connect, so a reload never loses granted items. BizHawk does not
flush its memory card automatically, though: press **Ctrl+S** (Flush SaveRAM)
after saving in-game, or close the ROM cleanly, or the save exists only in
emulated RAM.

**Savestates belong to the disc they were made on.** A state taken on your
unpatched disc restores that disc's code, which undoes the patch until you
reload the ROM. Keep states made on the patched disc, and when in doubt reload
the ROM and load your in-game save instead.

**Connecting a save that has progress but no checks** is held back on purpose,
with an explanation in the client. Archipelago works out whether a save belongs
to this seed by asking whether the slot has ever checked anything; a save that
has progressed on a slot with no history is ambiguous, so it waits rather than
guessing and sending checks you did not earn. **Collect any one check that is
not one of the held ones and the rest are sent** — you no longer need to
reconnect for it, and restarting the client will not release them by itself.

**Some items wait until you visit the place they belong.** An armor part or a
tank you receive from someone else is not applied to your save until you have
checked that part's own location, because setting the bit early stops the
capsule or tank from spawning and would make the location impossible to
collect. The client tells you when it is doing this and which check releases
it.

The consequence is worth knowing before it happens: **if you skip a stage
entirely, an item held against something in it stays held.** You can earn a
W Tank in the Secret Lab and never see it because Shield Sheldon's stage was
one you decided not to play. Nothing is lost permanently — everything releases
once you complete the goal — but during the run, skipping content can cost you
items you won somewhere else.

**Reploids that a Nightmare gets to first still count.** The check is collected
the moment a Reploid's slot leaves the untouched state, and "destroyed" counts
exactly as much as "rescued", so losing one never costs you the item. With
`protect_reploids` on (the default) it is not even destroyed — it reappears
next time you enter the stage.

**Under the `all_mavericks_sigma` goal the client holds Gate's Lab shut** until all
eight Mavericks are down, and opens it itself on the eighth. This is
deliberate: vanilla can open the Gate early, there is no play after the
credits, and reaching the ending short would leave you needing a save from
before the endgame. One honest limit: the game itself opens the Gate on 3000
Nightmare Souls or on beating High Max in an Another Route, and if it keeps
re-opening it the client stops fighting (fighting replays the unlock cutscene
every stage) and instead warns you plainly **not to fight Sigma yet**. Heed
that warning — under this goal the ending does not count below 8/8.

## Getting your clean dump back

If you patched over your only copy, download the standalone
**MMX6-Unpatcher** from the apworld's release page
([the MMX6 releases](https://github.com/Shinnuu/Archipelago/releases?q=mmx6) —
the unfiltered list interleaves the MMX5 releases) and drag any AP-patched
X6 `.bin` onto it. It writes the original bytes back over every site the
patcher can touch, regenerates each modified sector's error-correction data,
and verifies the result against the two accepted MD5s **before** writing
anything. Your patched file is not modified — the restored image is written
next to it as `<name> (unpatched).bin`. A disc with player colours applied
needs the unpatcher from release 0.2.0 or later; the earlier one refuses it.

If the result does not hash to a known clean dump, it writes nothing and tells
you so, rather than handing you a subtly broken image.

## Troubleshooting

**I changed a colour and nothing happened.** Two causes. Either the patcher
did no work because a `.bin`/`.cue` of that name already exists — it says so in
the log and stops, so delete the old pair and open the patch again — or an
entry under `mmx6_options` in your `host.yaml` is overriding your YAML. The
patch log names any colour it took from `host.yaml`.

**The client connects to the room but never sees the game.** The connector Lua
is not running in BizHawk, or your BizHawk is older than 2.7.

**The patcher rejects my disc image.** Check its MD5 against the table above.
The usual cause is a 2048-byte-per-sector dump rather than raw 2352.

**The patcher says my disc is already AP-patched.** Patching always starts from
your CLEAN dump — never from a disc a previous seed produced. Point the Mega
Man X6 base-image setting (the file prompt, or `rom_file` under `mmx6_options`
in `host.yaml`) back at your original dump. If you no longer have it, see
"Getting your clean dump back" above.

**Do I have to re-patch for every seed?** Only if a disc-changing option
differs. `text_skip`, `skip_intro_videos`, `exit_stage_anytime`,
`protect_reploids`, `boss_hp_randomization`, `weapon_damage`, `starting_hp`,
`starting_rank`, `disabled_nightmare_effects`, `nightmare_wall_always_open`,
`stage_music` and your goal are applied to the image; everything else is
handled by the client. Two seeds
with the same values for those produce byte-identical discs, so you can keep
one patched disc per option combination and reuse it. That is also kinder to
your saves: BizHawk keys memory cards **and savestates** to the disc's
filename, so a reused disc keeps them and a renamed one silently starts with an
empty card.

**Note `randomize_options` can change those for you**, so a seed generated with
it on should always be patched from its own file rather than an older image.

**I loaded a save from another seed.** The client holds back everything that
save already shows as collected and explains why, rather than sending checks
you did not earn. Start a new game for a new seed.
