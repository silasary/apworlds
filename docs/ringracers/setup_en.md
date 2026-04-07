# Dr. Robotnik's Ring Racers Randomizer Setup Guide

## Expected software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [ringracers.apworld](https://github.com/TehRealSalt/RingRacersAP/releases/latest)
- [Ring Racers AP client](https://github.com/TehRealSalt/RingRacersAP/releases/latest)

## Getting started

You might want to install [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest), if you haven't already.
It is technically not necessary if you are only connecting to a game, but I highly recommend doing it anyways because it adds some useful utilities.

### Install the APWorld

1. Open the Archipelago Launcher, search for "Install APWorld", click "Open".
2. Navigate to where you downlaoded the `ringracers.apworld` file, select it and hit OK.
3. Close the Archipelago Launcher. (Leaving it open may not refresh the world list properly!)

### Creating an options file

An options file is needed before playing.
It determines your name and how your game is randomized.
There's two ways to do this:

1. Any text editor:
    1. Open the Archipelago Launcher, search for "Generate Template Options", click "Open".
    2. Make a copy of `Dr. Robotnik's Ring Racers.yaml` from the folder that was opened.
    3. Edit it with a text editor to set your preferred options.
2. Options Creator:
    1. Open the Archipelago Launcher, search for "Options Creator", click "Open".
    2. Select "Dr. Robotnik's Ring Racers" from the list.
    3. Use the UI to pick your preferred options. Hover over option names if you are not sure what an option does.
    4. Click "Export Options" to save.

### Create a room

Either you or someone that you know needs to generate the multiworld and host a room.

There's several different ways & combinations to do this, so it is out of scope of this guide.
If you've never done this before, try the [Archipelago Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-game).

### Run the client

Once the room is up, all you need to do left is to connect and start playing.

#### Windows

1. Download `ringracers-ap.zip`.
2. Extract into its own folder. If you are updating an existing install, overwrite any existing files with the new ones.
    - **WARNING**: It is **highly recommended** to make a completely separate folder for Ring Racers AP.
    Do not extract into the same folder as another Ring Racers install.
    I am not responsible for save file destruction or any other issues if you do not follow this advice!
3. Run `ringracers-ap.exe`.

#### Linux

1. Set up [Flatpak](https://flatpak.org/setup/) for your system, if you haven't already.
2. Download `ringracers.flatpak`.
3. In your terminal, enter `flatpak install --user [path to ringracers.flatpak]`.
4. Run it as you would any other application installed to your system, or by entering `flatpak run io.github.TehRealSalt.RingRacersAP` into your terminal.

### Connect to a room

1. Run the client.
2. Set up any options as necessary. Everything is unlocked during start-up to make profile setup painless.
3. Go to "Room Setup", enter in the . "Room Password"
4. Review that everything looks correct.
5. Have fun!
