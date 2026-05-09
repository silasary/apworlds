# `archipelago.json` World Manager manifest extensions

Both the index and APWorld Manger support some additional data that can be stored in a world manifest.

This is an extension of the manifest defined [here](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/apworld%20specification.md#metadata).

## Additional Fields

This extension adds the following optional fields:
* `tracker` - A URL link to an external tracker.  This could be a poptracker pack, web-based tracker, or anything else that people would consider to be a tracker.
* `igdb_id` - The integer id of the game as found on https://www.igdb.com.
* `license` - The software license a world is distributed under.  This can either be a string of a well-known name (eg `"MIT"` or `"LGPLv3"`), or a URL to a specific licence file.
* `repo_url` - A URL link to the github repo a world can be found in.  The World Manager uses this for an "Add remote" prompt if a locally installed world is not found in any enabled indexes.
* `flags` - An array of additional boolean flags. See below for some that the manager uses.

* `github` - A depreciated alias for `repo_url`

## World Flags
* `after_dark` - This game is 18+ or Unrated.  The Updater has a setting to hide these games.
* `prerelease` - This specific version is a beta, and should only be offered to users who opt in.  NOTE: This is auto-applied by the index to github prereleases.
* `tracker_included` - A boolean value stating whether the client or game mode has an integrated tracker.  This is used to change the "No tracker available" UI text shown if the `tracker` url is unpopulated.
* `unready` - This game is still in early development.  The Updater won't show this game unless you already have it installed.

While not currently used in any way, future plans include using these additional flags for icons in the world list or filtering:
* `supports_deathlink`
* `supports_energylink`
* `supports_ringlink`
