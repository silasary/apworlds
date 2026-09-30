# Turok 2 Hue Shifter

## What is it?

hue_shifter.py is an optional script available since the v0.5.0 release.

It grabs image files in specified directories and shifts their hues (so the colors look different). This is a purely visual change, and will make the game look very different.

## What versions does it work with?

Because it is separate from the Archipelago randomizer, it works with any version. It can also be ran as its own thing with no other randomization.

## What are the prerequisites?

You must have python installed with the ability to run python scripts.

## How do I use it?

1. Download the hue_shifter.py script from one of the releases
2. Place this script into your Turok 2 install (the same folder as the game's executable)
3. Locate game.kpf and extract the files into a separate folder
4. Modify the values below to your preferences (open hue_shifter.py in a text editor)
   - IMPORTANT: Make sure GAME_DIRECTORY is the same name as the folder you extracted the game files to
5. Run the script

### Values you can modify

In the script, you can and should modify the values under the USER CONSTANTS section toward the top of the file. Here's a summary of what each does:
- GAME_DIRECTORY: The game's directory to grab textures from. Modify this to point at the directory you extracted game.kpf to!
- HUE_RANGE: A value between 0 and 359. This affects how much the image will be changed by. It will roll a random inclusive number from 0 to this value. Lower values will produce images that look similar to the original ones.
- SATURATION_RANGE: A value between 0 and 100. This will roll a random value in this range and adjust the current saturation by +/- that value. So, 25 can adjust from up to -25% to 25%. A value of 100 can produce completely grayscale images.
- BRIGHTNESS_RANGE: A value between 0 and 100. This will roll a random value in this range and adjust the current brightness by +/- that value. So, 25 can adjust from up to -25% to 25%. A value of 100 can produce completely black images.
- REPLACE_IN_MODS_FOLDER: Set to True or False to do the following -
  - True: packages the new images in the appropriate kpf in MODS_DIRECTORY, ready to play after the script runs
  - False: outputs the images to HUE_SHIFTER_OUTPUT_DIRECTORY if you just want the hue shifted images
- MODS_DIRECTORY: The directory to package up the images if REPLACE_IN_MODS_FOLDER is True
- HUE_SHIFTER_OUTPUT_DIRECTORY: The dir to save the shifted images if REPLACE_IN_MODS_FOLDER is False
- DIRECTORIES_TO_HUE_SHIFT: An array of folders in the GAME_DIRECTORY to hue shift. Exclude any youy do not wish to include. See this value in the script for further information.

## How do I undo the changes?

Replace the mod files with the original ones.