# Packing/Using Custom Content

## Using Custom Content

### For Players

Custom Content for apAdventure can be loaded like any other addon folder, just install it like you would any other non-workshop addon.

If you're on version 0.4.0 or newer and have set your GMod path in `gmodpath.txt`, the generator will automatically load logic data from your addons folder (assuming that whoever packed the content folder packed their stuff up properly).

If you're on an earlier version or haven't set your GMod path yet (although you'll probably save yourself some time in the future by just setting your gmod path), you'll have to move the logic data to your AP install folder instead. Read the following section for an explanation for that.

Also, note that if your addon folder and the logic folder in your AP install folder both contain logic data for the same config group or item set, the logic files inside your AP install folder are given priority. (apworld < addon folder < ap install folder < gmod data folder)

### For Hosts without a GMod Installation

After opening the launcher with the apAdventure apworld installed at least once, a folder called `gmod_apadv` should have been created inside your AP install folder, which should contain another folder called `logic`. This is where logic files go. Whoever gave you the config files should have given you either an archive containing just the logic files or a full gmod addon folder. If you got a full addon folder, you should be able to find the logic files in a folder called `apadv_logic`.

Put the logic files in the `logic` folder. The file system structure should look something like this:

(This example features multiple config groups and item sets for the sake of demonstration, but most archives you'll get will probably just contain a single config group or item set.)
```
gmod_apadv/
    logic/
        cfg/
            [config group 1 name]/
                [map 1 name]/
                    cl.json
                    sv.json
                [map 2 name]/
                    cl.json
                    sv.json
                group.json
            [config group 2 name]/
                [map 1 name]/
                    cl.json
                    sv.json
                [map 2 name]/
                    cl.json
                    sv.json
                group.json
        item/
            [item set 1 name].json
            [item set 2 name].json
```

## Packing Custom Content

Custom content for apAdventure should be packed into its own addon folder. In case you don't know, all addon folders are combined into a single file system by GMod, so having i.e. a config script at `lua\apadventure\cfglua\[my config group]\[target map].lua` in your addon is effectively treated the same as if it were in apAdventures addon folder, so you should **never put your custom content inside apAdventures addon folder**.

Here's an example for how your addon folder may be structured:

```
my_addon_folder/
    apadv_logic/
        cfg/
            my_epic_group/
                gm_coolmap/
                    cl.json
                    sv.json
                gm_epicmap/
                    cl.json
                    sv.json
                group.json
        item/
            myitemset.json
    data_static/
        apadventure/
            cfg/
                my_epic_group/
                    gm_coolmap/
                        cl.json
                        sv.json
                    gm_epicmap/
                        cl.json
                        sv.json
                    group.json
    lua/
        apadventure/
            cfglua/
                my_epic_group/
                    gm_coolmap.lua
            itemsets/
                myitemset/
                    lampoil.lua
                    rope.lua
                    bombs.lua
                myitemset.lua
```

### Config Files and Logic Files

Note: Config and logic files will be loaded from your data folder if you've set up your GMod Path properly, and while you should make your own addon folder for other types of files like config scripts or the lua files for your custom itemsets, there's no need to move your config/logic files to an addon folder until you actually decide to publish your stuff.

Configs you make in the editor mode are saved in two forms: The actual configs themselves and logic files.

The configs contain everything the gamemode needs to know about your map, while the logic files only contain information relevant to the Archipelago generator so it doesn't need to process a bunch of irrelevant data.

Config files you make are stored in your GMod folder under `GarrysMod\garrysmod\data\apadventure\cfg\`, while logic files are stored under `GarrysMod\garrysmod\data\apadventure\logic\cfg\`. Custom item sets also have their own subfolder in the logic folder.

Since addon folders can not add files to the data folder, packed configs need to be put into the `data_static` directory instead, so simply move the configs you want to pack from `GarrysMod\garrysmod\data\apadventure\cfg\` to `GarrysMod\garrysmod\addons\[your addon folder]\data\apadventure\cfg\`.

For the logic files, make a new folder in your addon folder called `apadv_logic`, and put them in there. This is mainly intended to make it easier for hosts (who only need the logic files) to find the logic data, and is where the generator will check for logic files.

The generator loads logic files in this order, with files that have been loaded later overriding earlier files (so files in `data` are given priority over everything else):
1. Logic files packed into the `.apworld`
2. GMod `addons` folder
3. Archipelago `logic` folder
4. GMod `data` folder