# Manic Miners

## What is LEGO Rock Raiders? 

LEGO Rock Raiders is a 1999 cult classic video game. Guide the crew of the LMS Explorer, stranded in orbit around the mysterious Planet U, as they try to gather the materials needed to return safely home. 

Featuring surprisingly robust base-building and RTS mechanics, combined with mineable landscapes, hostile lifeforms, and powerful vehicles, Rock Raiders lives on in our hearts well past its age. 

## What is Manic Miners?

Manic Miners is a fan remake of Rock Raiders in the Unreal Engine, created by Baraklava. Now with restored cut content, corrected jank, and remastered campaigns! They have our eternal gratitude for this labour of love. 

## What is Archipelago? 

Archipelago is a multi-game randomizer - imagine the key to a door in your world is behind a boss in your friend's world, who in turn will need their sword from your world, and so on. It allows players to combine their own games in exciting and unpredictable new ways.

## Okay, so how do they all fit together? What is this? 

This APWorld allows Manic Miners to be played in the Archipelago environment, either as a standalone randomizer for one player, or as part of an Archipelago multiworld. For setup instructions, see [here](setup_en.md).

### What is the goal of a randomized run of Manic Miners? 

The current options are:
- Clear Levels: Complete X of the available levels. 
- Beat Par Times: Complete X available levels under the par time. Different difficulties of par time are available. 
- Beat Crystal Targets: Complete X available levels with at least a certain number of crystals. Different percentages of crystal completions are configurable. 
- Coordinate Hunt: Unlock and clear the final level. To unlock it, find X copies of the "Transporter Coordinates", either by clearing other levels or loose in the multiworld.

### What campaigns are supported?

Three campaigns from Manic Miners are supported: Standard, Remastered, Classic. Support for Baz's Mod is planned. 

The first three campaigns each have 25 levels, while Baz's Mod has 33. 

### What items from Manic Miners are randomized? 

Each level is initially locked, with Level Access items available to find. Therefore levels will also become available in a random order. 

You can configure Buildings, Items, and/or Vehicles to be locked until discoverable. This is the recommended way to play.

You can optionally add one bonus starting Small Transport Truck to the pool. 

#### Filler items

Depending on your chosen settings, you may have many more locations than items. In these cases, filler items are added to the pool, which take the form of motivational messages like "Good work, Cadet!" or "An Energy Crystal Has Been Found!". Any items ending in "!" do absolutely nothing. You may also get marginal bonuses to your starting ore. 

### Where can I find items in Manic Miners? 

Clearing a level is always worth an item. 

Optionally, based on your chosen settings:
 - Clearing a level is worth more than one item. The harder the level, the more items. 
 - Clearing a level's par time earns an item.  
 - Getting a sufficient percentage of the total possible crystals in a level earns an item. 

Notes:
 - A level's clear time is fixed upon objective completion, while crystal counts are fixed on level exit. This means you can use the 'Keep Playing' button to continue in your crystal hunts, and use the 'Exit mission' button in the objectives bar to finish when ready. Save file data is not written, and thus locations not sent to the server, until the mission is closed. 
 - Crystals inside vehicles or buildings are already counted - no need to teleport up things at the end to 'regain' their crystals. You can view the total crystal count in-game by toggling the view in the resource box by clicking on the total-crystals icon. 
 - The '100%' value for crystals isn't necessarily the actual 100% value in the level. There are certain cases where some crystals have been 'written off', like the central cache in LRRR - Lava Laughter. 
 - If your victory condition is Coordinate Hunt, each level clear is worth an extra location, independently of the bonus locations being enabled or not. 

### Any recommended settings? 

The default settings are to clear all 25 levels in the Standard campaign, with all possible items locked, par time targets, and target times set to Medium. 

Players familiar with Manic Miners may prefer to enable all campaigns and the No Duplicate Levels setting, which will still do a full run of 25 levels, but will randomly select each one.

Note: running with every campaign fully selected and a matching high target level goal, can take a long time. 

#### What are the target times?

The target times for all levels can be viewed [here](./level_properties_en.md).

## Additional commands

The Manic Miners client comes with some extra commands on top of the regular Archipelago Text Client:

#### `/reset_installation`

A necessary first step to a fresh Archipelago run, this wipes and refreshes all the Archipelago-specific modifications to the Manic Miners installation. 

#### `/clear_installation`

This command will wipe all Archipelago data from the Manic Miners installation, should you wish for a simple uninstall. 

#### `/chiefs_report`

Shows overall game information about your current progress, such as how many things you've unlocked or how many levels you've cleared. 

#### `/mining_map`

Shows specific game information about which levels are accessible, but not yet cleared. It _only_ considers the level unlock items, and does not factor if you have all other prerequisites. 

#### `/check_watch`

Shows specific game information about which target times are accessible, but not yet cleared. It _only_ considers the level unlock items, and does not factor if you have all other prerequisites.

#### `/power_levels`

Shows specific game information about which crystal targets are accessible, but not yet cleared. It _only_ considers the level unlock items, and does not factor if you have all other prerequisites. Crystal targets may have additional prerequisites beyond those needed to clear a level.

## Under the hood

The Archipelago integration works in two main ways. 

Firstly, as you unlock levels, it copies the master level files into a dedicated directory to make them available, and then modifies the level data to disable anything you haven't unlocked yet. 

Secondly, it scans the Archipelago-specific save file for level data, to determine which levels you've cleared and what times you've set for them. 

## Problems? 

I'm sure there's issues hiding just out of sight, like Slimy Slugs waiting to strike. Please reach out on our channel in the [Archipelago Discord](https://discord.com/channels/731205301247803413/1170769670350045284) if you have any issues or feedback! 

## Contributors

Manic Miners created by:

- Baraklava

AP Mod created and maintained by:

- fogmike

The following users have been of particular help with this mod, via various playtesting/suggestions/research/feedback:

- imlegos
- jurjen909
- Nixill
- Ruinae Retroque Rursus