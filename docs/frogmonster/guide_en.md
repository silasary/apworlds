(Note: This guide is a copy of the guide written in the FrogmonsterAPWorld repository, which is written under the presumption that Frogmonster is unsupported. If I submit this world for review and this note is still here, please yell at me.)

## Choose your Settings
Download `Frogmonster.yaml` from this repository and name it something unique. Open it up in a text editor of your choice. Give yourself a player name, and choose options according to your liking. (Settings which give you multiple options are written as weighted choices (50 or 0) by default. Set all options you do not like to 0, and all options you do like to any positive number. Writing them out in the unweighted style, like `game_difficulty: normal`, is perfectly OK too.) Consider running your YAML through a YAML linter to make sure that you didn't break YAML formatting accidentally.

## Generating a Game

Choose one of the below options:

### I'm playing alone, or I'm hosting the room:
Download the following:
1. `frogmonster.apworld` (found [on the Releases page](https://github.com/Rooby-Roo/FrogmonsterAPWorld/releases/latest))
2. [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest).

Open the folder where Archipelago was installed. Place `frogmonster.apworld` in the folder `\custom_worlds`, and place your YAML file in `\Players`. If there are other players in your multiworld, they will sent you their YAMLs as well, which you will also place in `\Players`. 

Optionally, you can open the `host.yaml` file and adjust some generation settings if you'd like. The defaults are fine if you're new to Archipelago, though.

Once you've got all the player YAMLs, open Archipelago, and click "Generate". If everything works correctly, a zip folder will appear in your `\outputs` folder. Go to [archipelago.gg](https://archipelago.gg) and click "Host Game". Upload that .zip file and create a room. Share this room link with any other players.

If you're having issues with the generation process, ask around. Consider providing the generation logs from your most recent attempts (found in `\logs`) as well as the YAML files used in generation.

### I'm not hosting the room:
Send your completed settings YAML to the room host. Make sure they also have a copy of the `frogmonster.apworld` file (they can download it at the link above, or you can send it to them). Eventually, the host will send you a room link.

## Client Setup
The Frogmonster AP Client is currently developed by the main developer of Frogmonster, and is distributed as a Steam beta of the game. To access Frogmonster game betas, open your Steam library, right click on Frogmonster, click "Properties", and then click "Betas". You can select the randomizer client from the dropdown menu on this page. Once you've selected a beta, launch Frogmonster.

In order to connect to your randomized game, start a new save file (or open a save file previously used during this run of the randomizer). Once you've opened a world, you will be presented with a dark screen as the game waits for you to connect to the world. Once you get to this screen, go the console window (that opened with Frogmonster) and run the /connect command as prompted. You will need the server name (most likely archipelago.gg), your port number (5 digits, which you can get from the room link), and your slot name (which is the name you put in your YAML settings. You can also pull this from the room page if you need to). If your server has a password set, you will need this as well.

A completed /connect command will look something like this: `/connect archipelago.gg:38281 FrogGamer`. Once you've entered that correctly, your game will start, and you can begin playing!
