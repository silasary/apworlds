# Super Mario 64 OMM MultiWorld Setup Guide

## Required Software
- A build of the Archipelago version of sm64ex that includes Odyssey Mario's Moveset and the OMM item support
  (the `omm_ap.patch` file applies both to the Archipelago branch of sm64ex)
- Super Mario 64 US Rom (needed to build the game)

## Connecting
Start the game and open **Archipelago** in the main menu. Enter the server (for example `archipelago.gg:12345`),
your slot name (it is case sensitive) and the password if the room has one, then choose **Connect**.
What you enter is saved. You need to be connected to start playing.

You can also connect at startup with launch arguments, which take priority over the menu:

```
--sm64ap_ip <server:port> --sm64ap_name <slot name> [--sm64ap_passwd <password>]
```

The game name sent to the server is `Super Mario 64 OMM`. To play the stock `Super Mario 64` world with this build,
add `--sm64ap_game "Super Mario 64"`.

## Notes
- OMM moves and captures are not in logic, with one exception: **every Bowser fight needs Cappy Throw and Capture Bob-omb** (OMM's
  Bowser is beaten by capturing a flaming Bob-omb). If you do not randomize them, you have them from the start.
- The spin pound is unlocked by the Ground Pound item, and the wall slide by the Wall Kick item.
