# Mega Man X4

## Required Software

* A legally acquired US ROM of Mega Man X4 for the Playstation
* A legally acquired Playstation BIOS
* [Bizhawk](https://github.com/TASEmulators/BizHawk/releases)
* The patch file which can be found on the releases page - "MMX4_Archipelago.xdelta"
* The xdelta3 command line tool which you can find [here](https://github.com/jmacd/xdelta-gpl/releases/tag/v3.0.11)

* The built-in Archipelago client, which can be installed [here](https://github.com/ArchipelagoMW/Archipelago/releases)

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

Check the releases page for the latest version of the YAML. Alternatively you can generate your own using the Archipelago Launcher.

## Connect to the MultiServer

There are 2 ways to connect

### 1. Using the .apmmx4 patch (Recommended)

1. Install the APWorld
2. Run the .apmmx4 file acquired from the lobby using the Archipelago Launcher
	* If you don't have one, ask the host of your multiworld
	* If you are the host, it is inside the .zip file in the Archipelago output folder
3. If this is your first time running this, you may be asked to provide paths to your ROM file, the Patch file and xdelta3
4. After a little bit three new windows should open:
	* The Archipelago Bizhawk Client
	* The Bizhawk Emulator
	* The Bizhawk Lua Console
5. Connect to your created room through the Archipelago Bizhawk Client

### 2. Manual

1. Install the APWorld
2. Through the launcher run the Mega Man X4 Client
3. Apply the XDelta patch to the ROM
   * You can use this tool - https://kotcrab.github.io/xdelta-wasm/
4. Run your Patched ROM in Bizhawk
5. In Bizhawk open Tools/Lua Console
6. In the Lua Console open connector_bizhawk_generic.lua which should be in:
   * (Your Archipelago Installation Folder)/Data/Lua
7. Connect to your created room through the Bizhawk Client Tool in the Archipelago Launcher

## FAQ

### Help! My controller isn't working!
* Mega Man X4 is from a time before analog sticks. You very likely have an analog controller defined in Bizhawk
* To change this:
	* PSX -> Settings -> Sync Settings -> Virtual Port 1 -> Digital Gamepad

### My character keeps dying when I pick up health and there are these splotches in the top left corner
* Something in the chain of connections is not connected to the next
* Check that:
	* The Lua script is running
	* The Correct client is running (The Bizhawk Client, not the normal text client)
	* The Client is connected to the Multiworld and you're authenticated

### I don't have a .apmmx4 file
* You are running an old version of the apworld
* Either:
	* Update to the newest apworld
	* Use the manual setup instructions
		* You might want to update your apworld anyway though after you're done