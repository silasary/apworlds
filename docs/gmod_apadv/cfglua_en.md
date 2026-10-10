# Config Scripts

Config Scripts can be used to add additional functionality to your configs using Lua.
Whenever a config is loaded, the gamemode checks for a lua file at `lua/apadventure/cfglua/[config group containing your config]/[name of the map your config is for].lua` and tries to run it if it can find it.

In case you don't know, all addon folders, workshop addons and mounted games are combined into a single file system when the game loads, so you should **NOT** put your config scripts in the base `lua` folder (`GarrysMod\garrysmod\lua\...`) or apAdventures `lua` folder (`addons\ap_adventure\lua\...`), as this is likely to cause problems when GMod or apAdventure updates. You should create a new addon folder for your config scripts instead. (e.g. `addons\my_cfglua\lua\apadventure\cfglua\my_epic_group\gm_construct.lua`)

While you could theoretically just run any code you want to run whenever your config is loaded straight into the config file, you may not want all code to execute immediately, because if your config is loaded after a map transition, GMAP may not have reestablished the connection to the Archipelago Server yet. Instead, your config can return a table containing a bunch of functions which will be ran at different times during or after the process of loading your config.

For the sake of these tutorials, we're going to assume that your config is structed like this:
```
local CFGLUA = {}

function CFGLUA:OnFullConnect()
    print("some code to run")
end

return CFGLUA
```

You can theoretically achieve the same thing by structuring your config like this:
```
return {
    OnFullConnect = function(self)
        print("some code to run")
    end
}
```

...which saves some space, but I chose the former method for these examples as it functions more closely to how entity definitions work.

### Testing your Scripts

The gamemode (re)loads your Config Script every time the Config is (re)loaded, so you don't have to reload the entire map whenever you want to test changes you've made to your config script. The `apadv_loadcfg` console command can be used to reload your config instantly. You can also pass the name of a specific config group to load that groups config for the current map, but keep in mind that configs that are not part of your current run won't have locations on them and may not behave correctly in other ways.

Note: If you're reading this before the release of version 0.4.0, the `apadv_loadcfg` command is still called `apadventure_loadcfg` and uses the wrong path to check if a config exists for the current map, so it will only work if you use it without passing arguments.

## Available Events

### CFGLUA:PreDupe( dupedata )

The first function to run after your script has been been loaded in, after the rules (convars, player movement speed, etc.) have been applied and all entities that were marked with the Deletion Marker Tool when making the config have been deleted. The `dupedata` value passes a table containing a `Entities` and `Constraints` field, which are later passed to [`duplicator.Paste`](https://wiki.facepunch.com/gmod/duplicator.Paste) to load in the entities that were saved using the Save Marker Tool. Unless you want to prevent these entities from being created, make sure to return this table (or another table containing different duplication data) in this function, otherwise the config loader will skip the duplication step.

Note that you are not guaranteed to be connected to the AP Server at this point, so functions that require a connection should not be used here.

### CFGLUA:PostCfgLoad()

This function is the second to last function to run when the config is loaded. Unlike OnFullConnect, it is guaranteed to run on the same tick as when the map has been reset and the entities saved into your config have been created and doesn't wait for a connection to be established, so this is mainly intended to be used for code that needs to be run as soon as possible.

### CFGLUA:OnFullConnect()

This function runs after the config has been loaded and the gamemode has connected to Archipelago. If the gamemode is already connected to Archipelago it will run on the same tick as PostCfgLoad, but otherwise it will be delayed until a connection is established.

### CFGLUA:CfgUnload()

This function runs whenever your config is being unloaded, to either change maps, change to another config or reload your config. It's a good place to clean up any hooks you registered for your config. Note that this function is also run when the player connects to a different slot, so you shouldn't try to interact with the AP Slot in here as you may interact with the new slot.

### The ItemFuncs and MapItemFuncs tables

You can also add 

## Functions

apAdventure offers some functions to make interacting with Locations easier:

### APADV.SendMapLocation( lctn )

The most straightforward way to send locations. The `lctn` parameter should be the name of the Location without prefixing the Map or Group Name, as this function will automatically build the full name for you, meaning that your code will still work if the way Location Names are structured is changed in the future.

### ADADV.GetMapLocationStatus( lctn )

Gets the current collection status of a location. This will return true if the location has already been collected, false if it hasn't, or nil if the location doesn't exist in this run. Similarly to SendMapLocation, this automatically builds the full name for you, so using this should prevent your code from breaking in the future. If you register any hooks for your scripted locations, you should run this to check if registering the hook is actually needed.