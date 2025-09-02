# APWorld Index

Primarily designed for my [APWorld Manager](https://github.com/silasary/Archipelago/releases?q=Manager), this repo tries to be a comprehensive list of every apworld that exists.

I make no promises about compatibility, quality, or trustworthiness.  I just index everything that can be indexed.

Where possible, I'll try to tag worlds as AD and remove those that can't be played in the the Official Server, but I do not know most of the games listed, and oversights have almost certainly occurred.

## Adding a world

You have three options:
* Use `scripts/add_worlds.py https://github.com/ORG/REPO` to automatically scrape every release in that repo.
* Manually create a yaml file in the index folder with the Game name and repo, and let the nightly script do the rest.
* Open a Github Issue

## I want to add a game, but the creator only posts APWorlds on Discord

Ask them to post releases on a github.  I can't do anything if it's not queryable by an API.

## World Flags
Currently the following flags are supported:
* `after_dark` This game is 18+ or Unrated.  The Updater has a setting to hide these games.
* `unready` This game is still in early development.  The Updater won't show this game unless you already have it installed.
