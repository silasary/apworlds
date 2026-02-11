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
* `tracker_included` This game has an integrated tracker, and doesn't need an external tracker.


## FAQ: Why do we use Version Numbers over Release Dates?
Version numbers are more intentional, more reliable, and allow for more use-cases than simply saying "The newest release is the latest".
Here are a few common examples about how the "latest" release is not always the one that was released last chronologically.

### Backports
Take a game with a Base Rom (eg Pokemon Crystal) that has its major version numbers tied to the base patch revision.  All of v4.X uses the same rom, as does v5.X, etc. As such memory offsets are interchangable within a major version, but not across different base patches.
Once a new base patch is developed, new features and developments will target the latest branch.  However, because ongoing asyncs cannot upgrade their apworld to versions build with different offsets, occasionally a bugfix for older basepatches may be released after the latest version has already been published.

In other words, chronological release order can go: `4.2.0, 4.2.1, 4.2.2, 5.0.0, 5.0.1, 5.0.2, 4.2.3`

While anyone on 4.2.2 would want to install 4.2.3, we do not want to offer a downgrade to 5.0 users simply because a backported bugfix was released.

### Prereleases
The same effect can happen when you're juggling a stable version and upcoming betas.  Prereleases are something users must opt in to, and by default are ignored by the APWorld Manager.
Let's take two users:  Player A, who has prereleases disabled, and Player B, who has them enabled.
Player A is currently on version 1.6 (stable), and player B is currently on 2.0alpha3 (prerelease).

The chronological order of the repo's releases look something like this: `1.5, 2.0a1, 1.6, 2.0a2, 2.0a3, 2.0a4, 1.7`

Player A would expect to be upgraded to 1.7, while Player B would expect to be offered 2.0alpha4, even though 1.7 is technically newer.
