# Star Ocean: The Second Story Setup Guide

This guide covers playing Star Ocean: The Second Story in an Archipelago multiworld on
Shattered Stars, a native port of the game.

## Required Software

- **The Shattered Stars release**, for Windows or Linux. It's a self-contained package; no
  separate emulator or runtime is needed.
- **Your own Star Ocean: The Second Story disc images** (PlayStation: the North American,
  European, French or German release, both discs from the same one) — for example
  `.cue`/`.bin` pairs. Shattered Stars reads your discs at run time;
  it does not ship with any game data, and there is nowhere to download it. You need to supply
  disc images you made from your own copy of the game.
- **This world's `.apworld` file** and a YAML (below), like any other Archipelago game.

## Running the Setup Program

The Shattered Stars release bundles a graphical setup program alongside the game itself. Run
it to configure things before you play:

- Its **Discs** page is where you point the program at your disc images.
- Its **Archipelago** page (below) is where you give it your seed file, server, slot name
  and password.

Save your settings, then launch the game from setup (or close setup and launch the game
directly — it reads the same configuration).

## Making Your YAML

Like any Archipelago game, your options are set in a YAML file. There are two ways to make it:

- **With a form:** once `so2.apworld` is installed, open the Archipelago Launcher and choose
  **Options Creator**. Pick *Star Ocean: The Second Story*, set the options with buttons and
  sliders, and export the YAML.
- **By hand:** the template for this world ships alongside its `.apworld` file as
  `Star Ocean The Second Story.yaml`. If you downloaded it from this project's GitHub release
  page, the download is named `Star.Ocean.The.Second.Story.yaml` instead — GitHub turns the
  spaces in a release asset's name into dots, but it's the same template file either way. Fill
  in the options you want (`world_mode`, `character_items`, `traps`, and so on; see the game
  page for what each one does).

Put the finished YAML wherever you'd normally place a player YAML for generation: your
Archipelago install's `players` folder, or wherever your group's generation process expects
player files. This step is the same as for any other Archipelago game; nothing
about it is specific to this world.

## Generating

Generation is standard Archipelago generation: run it the same way you would for any
multiworld (Archipelago's own `Generate` process, or however your group normally generates a
room). Archipelago writes one archive for the whole multiworld, `AP_<number>.zip`, into its
`output` folder (on Linux `~/.local/share/Archipelago/output`, on Windows
`C:\ProgramData\Archipelago\output`). Inside it is one file per player; a Star Ocean player's
ends in `.apso2`. Shattered Stars reads the archive as it is, so there's no need to unpack it,
though a loose `.apso2` (one the host sent you on its own, say) works just as well.

## Connecting

Shattered Stars has a native Archipelago client built into the game itself — you don't run a
separate program to connect. Open the setup program's **Archipelago** page:

1. **Seed.** Click **Browse** and pick the `AP_<number>.zip` archive (Browse opens Archipelago's
   `output` folder) or your `.apso2` file. If the archive holds seeds for more than one Star
   Ocean player, a **Your slot** list appears: choose yours. A **hell seed** (`encounter_rate: 0`
   with killer-move checks or learn levels) gets a warning under the seed's line ("Hell Seed: no
   random battles. ...", Shattered Stars 0.02.51 and later): all the training is in Fun City's
   arena, free on that seed.
2. **Server address.** Enter the room's server address. The client works with either an
   insecure (`ws://`) or secure (`wss://`) server address — use whichever the room host gives
   you.
3. **Slot name.** Enter your slot name. The field hints at the name your seed file was
   generated for, so you'll usually just confirm it.
4. **Password**, if the room has one. There's a **Show** button if you want to check what
   you typed.

Save and start the game (or Save & Play). It connects using the native client, the same way
the game plays normally — there's no separate client window to manage.

**Turning it off.** The switch beside **Archipelago** in setup's sidebar turns Archipelago off
and on. Off, the game plays exactly as the original, on your ordinary memory cards; your seed,
server and slot stay filled in for when you switch it back on. An Archipelago game itself has
no debugging: the game's developer switches (`--debug` and the like) are ignored while a seed is
being played.

**Your saves.** Each seed (and slot) saves on its own memory card, which the game makes the
first time you play it. Your ordinary memory cards aren't inserted while a seed is chosen, so a
finished or unrandomized game can't be loaded into the seed by mistake, and the seed can never
save over your ordinary saves. The Archipelago page shows the seed's card under **Saves** (with
**Open folder**, for backups). Clear the seed to play on your ordinary cards again. Saves an
earlier Shattered Stars made for the same seed on your ordinary card are copied onto the seed's
card the first time (your card itself isn't changed).

## Tracking with Universal Tracker

[Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) (UT, version 0.3.6 or
later) lists the locations you can reach now, by this world's own logic, from what the server says
you have received and checked. It needs no YAML for this game (version 0.2.2 of this world and
later):

1. Put `tracker.apworld` (from UT's releases) and **`so2.apworld` 0.2.2 or later** (or the room's
   own version, if that is newer) into Archipelago's `custom_worlds` folder, then restart the
   Launcher. Rooms generated with 0.2.0 to 0.2.2 track with 0.2.2 (see the end of this section).
2. Open **Universal Tracker** from the Launcher and connect to the room with your slot name (and
   the password), like a text client. The game can be connected at the same time.

**The map tab.** UT also shows this world's maps, with a square per location in UT's colours. The
pictures come from a zip, one of two:
- **your own maps**, `so2_shattered_stars_ut.zip`: Shattered Stars writes it when it renders the
  tracker maps from your disc (the setup program's "Render tracker maps for PopTracker" button, or
  `shattered-stars --render-tracker-maps`; see "Tracking with PopTracker"), next to the maps in
  PopTracker's `user-override` folder (setup shows the path, with a **Copy path** button);
- or the Shattered Stars PopTracker pack, `so2_shattered_stars_1.0.0.zip` (from the pack's release
  or PopTracker's `packs` folder), with placeholder maps.

The first time UT connects it asks for the zip: choose either (the choice is kept in Archipelago's
`host.yaml` as `ut_pack_path` under `so2_options`; cancel and it leaves the map tab out; to switch
later, change or empty `ut_pack_path` there and UT uses or asks for the new one). While the game is
connected the tab follows the party: the room you are in, or the world map with a marker where you
stand. UT's map tab has no door markers (PopTracker's has).

To see what a location needs, type `/explain` and its name in UT (for example
`/explain Town of Salva: Heavy Ring chest`): it prints the location's rule, with what you have in
green and what is missing in red.

**Story mode follows the story.** Story mode's chapters need no items, so by the logic alone almost
every location is reachable from the start. While the game (Shattered Stars 0.03.00 or later) is
connected to the room it tells the server which chapter you are in, and UT then lists only what the
story has reached: a chest in a town you haven't reached yet comes into the list when the story takes
you there, Energy Nede's after the disc switch, the Cave of Trials after the Final Save Point. It
follows the chapter as you play (and goes back if you load an earlier save). Before the game has
connected UT lists everything the logic allows, as in open world and hub mode, which have no story
awareness. To turn it off, set `enforce_deferred_entrances: "off"` under `universal_tracker` in
Archipelago's `host.yaml`. The PopTracker pack does the same, and shows the checks later in the
story in blue.

The tracker updates when the server hears of a check, so checks you make while the game is
offline appear once Shattered Stars reconnects and sends them. If UT says "The world has informed
UT that your options are incompatible", type `/faris_asked` in it: the message names the
`so2.apworld` this room needs (a room made with a newer version of this world than the one
installed, for example).

A room generated with version 0.2.0 of this world tracks with 0.2.2 too. With Skillsanity on, UT
warns in its log that 0.2.1 changed the logic of Skillsanity's guild checks and learn levels: some
of them may show up later than they really became reachable (never earlier). Regenerate the room
with 0.2.2 or later for exact tracking. A 0.2.0 room with `encounter_rate: 0` and killer-move checks
(what 0.2.1 made a hell seed) can't be tracked with 0.2.2: use 0.2.0 and your YAML.

## Tracking with PopTracker

The Shattered Stars PopTracker pack (PopTracker 0.36.0 or later; put `so2_shattered_stars_1.0.0.zip`
in PopTracker's `packs` folder, load "Map Tracker", connect with the AP button) shows the same logic
on maps. Each area's tab has its overview and a tab per room, numbered by the game's map number; in
a room each doorway has a lettered diamond (yellow: no check is ever yellow), and the **Doors** panel beside the map says where each
one leads ("A → 18 north: fountain square"; `*` = only at some points of the story). Click a door's
panel line, or hover its diamond and click "Door A", to open the room behind it; with the game
connected the tabs follow the party room by room. The maps are placeholders: run
`shattered-stars --render-tracker-maps` once (or the setup program's "Render tracker maps for
PopTracker" button) and PopTracker shows the maps drawn from your own disc. The same run writes
`so2_shattered_stars_ut.zip` beside them for Universal Tracker's map tab (above). The rendered maps
and the zip come from your disc: keep them for your own use.

## Playing Offline

Shattered Stars can also play a generated seed by itself, with no server and no multiworld
connection. On setup's **Archipelago** page, choose the archive or the `.apso2` file and leave
**Server** empty (or start the game with `--ap-seed FILE`, adding `--ap-seed-entry NAME` for an
archive with several Star Ocean seeds). Your own locations are shuffled and
checked as usual, but nothing is sent to or received from other players, since there's no one
else's game to connect to. It's a good way to try the randomizer without hosting or joining a
room.

## Troubleshooting

- **"Did not load ... as its game ... is already loaded."** Archipelago refuses to load the
  same game twice. Make sure this world's `.apworld` (or an unpacked copy of it) exists in
  only one of your Archipelago worlds locations — don't have it in both the main `worlds`
  folder and `custom_worlds` at the same time.
- **Wrong disc image.** Shattered Stars plays the North American, European, French and German
  releases of Star Ocean: The Second Story. A Japanese disc, a disc that isn't this game at all,
  or two discs from different releases will be identified as such on the Discs page rather than
  accepted — double check you've pointed setup at the right disc 1 (and that disc 2 is nearby,
  since the game looks for it automatically). A seed works with any supported release.
- **"... is not a valid option name for Star Ocean: The Second Story"** when generating from
  an older YAML. Version 0.2.0 of this world renamed two options: `protagonist` is now
  `story_route` and `drops_as_checks` is now `enemy_dropsanity`. Archipelago ignores the old
  names and uses the defaults, so rename them in your YAML.
- **"unsupported version 2 (this build reads 1)"** (or version 3) when choosing a seed. The seed
  was made with version 0.2.0 or later of this world, which needs Shattered Stars 0.02.50 or newer:
  update the port. Seeds from older versions of this world keep working on the newer port.
- **"unsupported version 4 (this build reads 1 to 3)"**: the seed has the bench (version 0.2.1 of
  this world, the `bench` option, on by default in open world with `character_items` and in hub
  mode), which needs Shattered Stars 0.02.51 or newer. Update the port, or generate again with
  `bench: false`.
- **Connection refused.** If the server turns down the connection — for example because the
  slot name or password doesn't match the room — the client reports the refusal rather than
  silently failing to connect; double-check the slot name and password on the Archipelago page
  against what the room host gave you.
- **"The data could not be loaded. Your data may be faulty."** when loading a seed's save.
  With a seed, Shattered Stars loads only that seed's own saves, exactly as the game saved them:
  a save from another seed or from an ordinary game, a save copied without the `.ap.json` file
  next to it, or a save changed with a save editor is refused (the game's log says which). Each
  seed plays on its own memory card, `archipelago/<seed>_<slot>/memcard1.mcd` next to the
  game's `config.ini`; keep the `.ap.json` files beside it when you back it up or move it. This
  is a guard against accidents and casual editing, not anti-cheat. Saves an earlier version
  made for the seed on your own memory card are copied to the seed's card once, and keep
  loading.
- **A seed that won't load.** The seed is checked when you pick it; if the archive holds no
  Star Ocean seed (Star Ocean wasn't one of the games generated), or the seed isn't valid (or is
  damaged), setup will tell you rather than letting you start the game with it.
