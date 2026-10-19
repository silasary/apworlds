# Pokemon XD: Gale of Darkness -- Setup Guide

## Installing

1. **Double-click `pokemon_xd.apworld`**, right click -> Open With -> find your archipelago launcher exe, or use the Launcher's "Install APWorld" button and pick it.
   Then **restart the Launcher**.

   Do not drag the file into a folder yourself unless you have read the next section, because two things
   about a dropped-in file have to be exactly right and neither one reports what went wrong. If the world does
   not load you get no "Pokemon XD Client" button in the Launcher and no Pokemon XD entry from "Generate
   Template Options".

   <details open>
   <summary><b>If you install it by hand anyway -- the two things that have to be right</b></summary>

   **The filename must be exactly `pokemon_xd.apworld`.**

   | Your install | Where to put it |
   |---|---|
   | Portable, or running from source | `<Archipelago folder>/custom_worlds/` |
   | Installed (Windows `Program Files`, frozen macOS) | `%USERPROFILE%\Archipelago\worlds\` (Windows) or `~/Archipelago/worlds/` |

   If you are not sure which you have, install by double-clicking and let Archipelago decide.
   </details>
   
2. You'll need Dolphin and your own legally-owned Pokemon XD: Gale of Darkness (USA,
   game code `GXXE`) ISO.

## Generating a YAML

1. Use the Launcher's "Generate Template Options" to produce a default YAML for Pokemon XD Gale of Darkness, or
   use `docs/Pokemon XD Gale of Darkness.yaml` in this package as a starting point.
2. Set your `name` in the YAML to anything you like, up to Archipelago's 16 characters. It does **not** have to match your in-game trainer name -- the client finds your save without it.
3. If hosting, put the YAML in your `Players` folder. Use "Generate" in the Archipelago launcher to create the zip file. Host the same as any other multiworld.

## Patching

1. On your Archipelago world page, your slot should have a patch to download (the .appxd file). Download it.
2. Right click it -> open with -> find your Archipelago Launcher exe. This should allow you to just double click them in the future.
3. Select your **UNPATCHED** ISO/CISO file.
4. Write a name for your new ISO/CISO. Make sure not to delete the file extension (.iso or .ciso)
5. Allow the patch to finish - it usually takes a minute or two, depending on settings. A console shows progress.

## Playing

1. Boot Dolphin and load your own Pokemon XD ISO - DO NOT OPEN THE POKEMON XD ARCHIPELAGO CLIENT YET.
2. Start a new save file or continue one.
3. In-game, name your trainer whatever you like.
4. **Finish the intro fight and save the game before connecting the client.** This gives you a clean fallback to reload from if anything
   goes wrong during your first connection/sync, and it is worth saving again periodically as you play.
5. Open your party menu at least once.
6. Launch the client and connect to your room - enter your slot name.
7. Play. **Please save after acquiring the Snag Machine. Save often for your own sake.**
---

## Things worth knowing before you play

- **Location Shuffle is experimental.** It is my preferred way to play this game and the most likely
  to break. Only run it with a group that is happy to hit bugs and report them until I can test further.
- **Cumulative trainer defeats + Location Shuffle can softlock.** If you use both, keep the defeat count low.
- **Catch checks holding progression** is off by default, and should stay off unless you intend to catch
  every Shadow Pokemon as it comes up.
- **Save often.** The client writes to live memory; saves are handy.
- **Some areas require other story segments.** Namely, ONBS raid will be triggered upon finishing Pyrite's
  initial storyline (up to being sent away to the pokespots) and fighting Miror B at the Cave Poke spot.
- **Save states work, but may cause issues if used immediately after a reboot. Feel free to report bugs.**

---

## Client commands

Most are diagnostics prefixed `DEBUG:` in their help text. The ones you are most likely to want:

| | |
|---|---|
| `/mirorforce <place>` | Put Miror B. at pyrite, realgam, rock, oasis or cave on your next step |
| `/keyitems` | Which gating key items you currently hold |
| `/parts` | Robo Kyogre Part progress |
| `/remaining` | Overworld Item locations you have not checked yet |
| `/goal` | Force the goal, if you beat it and the check did not send |

`/help` lists the rest.

---

## Reporting a bug

Say what you were doing, which options you had on, and paste the client log around the moment it went wrong.
If the story looks wrong, `/story` and `/storylog` together are usually enough to help me.
