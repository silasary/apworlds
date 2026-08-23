# DonutCountyAP Setup Guide

Requirements:

- [Donut County](https://donutcounty.com/) on Windows or Linux (untested)
- [BepInEx 5.4.* (Unity Mono x64)](https://github.com/BepInEx/BepInEx/releases)
- [DonutCountyAP](https://github.com/1e1001/DonutCountyAP/)

## Installation

Install BepInEx:

1. Extract the BepInEx `.zip` archive into your Donut County install folder
	- On Steam, you can right-click the game, "Manage" &rarr; "Browse local files"
2. Start the game to allow BepInEx to create its folders.

Install the mod:

1. Extract the mod download in the `BepInEx/plugins/` folder of the game install folder
2. Start the game.
3. If the game is successfully modified, you will see a "Connect" button on the titlescreen, among other modified UI elements.

## Usage

To connect, simply enter your connection info on the titlescreen and press "Connect".
Once connected, you can use the level select to play the game.

The mod stores an additional `randomizer.xml` save file in the game save folder, but this data is relatively small.
