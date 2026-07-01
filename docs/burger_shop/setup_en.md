# Burger Shop Multiworld Setup Guide

## Required Software

- [Burger Shop](https://store.steampowered.com/app/730840/) (Steam)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or later

## Installation

### 1. Install the Archipelago world

Place `burger_shop.apworld` in the `custom_worlds/` folder inside your Archipelago installation directory and restart
the Archipelago launcher if it is already open.

### 2. Install the game data package

Extract the provided zip file and copy the `archipelago` folder and the `properties` folder directly into your
Burger Shop installation directory (the folder containing `BurgerShop.exe`). To find this folder, right-click
**Burger Shop** in your Steam library, select **Properties**, go to the **Installed Files** tab, then click **Browse**.
The result should look like:

```
Burger Shop/
├── archipelago/
│   └── levels/
│       ├── Game.xml
│       ├── Layout.xml
│       ├── Order_BizChick.xml
│       └── ... (remaining order files)
├── properties/
│   └── params_user.xml
└── BurgerShop.exe
```

## Joining a Multiworld Game

1. If you have not already launched Burger Shop on your computer, launch it then close it. This
will create the directory that contains your save file information.
2. Open the **Archipelago Launcher** and click **Burger Shop Client**, or run `BurgerShopClient.exe` directly.
3. Connect to your server by typing in the client console:
   ```
   /connect <host>:<port>
   ```
4. Enter your slot name and password when prompted.
5. Launch the game using `/launch` in the client console, or start it manually.
6. **Create a new save file.** The client associates saves with your session at creation time — do not use a
   save that was created before connecting.

## Options

| Option | Default | Description |
|---|---|---|
| Five Star Mode | On | Level checks require all 5 stars; off means any completion counts |
| Starter Recipes | Off | Adds a random large side, drink, and ice cream to your starting inventory |
| Bonus Recipes | On | Replaces filler items with bonus recipes not in the base game |
| Start with Cookies | On | Cookies added to starting inventory |
| Start with BurgerBot | Off | BurgerBot added to starting inventory |

## Troubleshooting

**The client cannot find my Burger Shop installation.**
Add the following to `host.yaml` in your Archipelago directory:
```yaml
burger_shop_settings:
  game_install_path: "C:/Program Files (x86)/Steam/steamapps/common/Burger Shop"
```

**My save file is not being detected.**
Only saves created *after* connecting the client to the server are tracked. Create a fresh save once the
client shows you are connected.

**Recipe changes are not showing up mid-level.**
The game reads updated order files when a level starts. Finish the current level or return to the map screen
to see newly unlocked recipes take effect.
