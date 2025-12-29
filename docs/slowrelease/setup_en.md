# Setup Guide for Slow Release Client

## Required steps

- Download both [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/tree/tracker) (download link under "Releases" at the right of the page) and [Slow Release Client](https://github.com/gjgfuj/AP-SlowRelease/releases) apworlds.
- Double click the apworlds to install them, or move them manually in your `Archipelago/custom_worlds` folder.
- To slow release a particular slot, you need that slot's yaml file in your `Archipelago/Players` folder.

## Using the Slow Release Client

Open Archipelago Launcher, and open `Slow Release Client`. Two commands are relevant here, `/time` and `/region_mode`.

- The `/time` command takes a value, in seconds. This value will be the delay between released checks.
- The `/region_mode` command makes the slow release client act more like a player by handling one region of the world at a time. It's a toggle, so the value changes everytime you run the command.

Those commands and what they do are also listed at the bottom of the command list displayed every time you launch the Slow Release Client.

From there you just need to connect to the slot, and it will start slow releasing.
