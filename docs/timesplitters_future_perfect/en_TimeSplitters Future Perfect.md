# TimeSplitters: Future Perfect

## What does randomization do to this game?

All 48 Arcade League missions and Challenges, all 13 story levels, all 150 characters, the 13
cheats and 34 arcade weapons are locked until you receive them from the multiworld. All three
Arcade Leagues are open from the beginning, so any mission can be unlocked at any time. You start
with one or more missions (chosen by the Starting Mission options), one random character and one
random weapon.

Nothing unlocks the normal way any more. Beating a story level does not open the next one: if
you do not have it, the game returns to the level select. Characters, cheats and weapons are
never needed to reach a check; they unlock for the Gallery, the Cheats menu and Arcade Custom.

Only the North American GameCube version (game ID `G3FE69`) is supported.

## What are the checks?

* Trophies: a Bronze, Silver, Gold or Platinum trophy on a mission sends a check for that trophy
  and every lower one.
* Story levels: completing a level on Easy, Normal and Hard are three checks (finishing on Hard
  also counts Normal and Easy, as in the normal game).
* Story objectives: each listed objective is one check, on any difficulty, at the moment the game
  marks it complete. Some are hidden objectives the game never shows on screen.
* Milestones (each can be switched off in the options): "AL - One Gun Fun - Group Completed" and
  the like for a Bronze or better on all three missions of a group, "Amateur / Honorary / Elite
  League Completed" for all nine missions of a league, and "All Challenges Completed".

Your first trophy on Rockets 101 being a Platinum sends four checks. 1924 Future Perfect has no
objective checks.

## What is the goal?

Chosen in your options:

* 1924 Future Perfect (default): complete 1924 Future Perfect on any difficulty. It opens once you
  have it AND have completed the chosen number of other story levels (0 to 12; Future Perfect
  itself never counts) AND have the chosen number of Arcade League missions or Challenges at the
  chosen trophy grade or better (0 to 48). Completing it is the goal, not a check.
* Trophy Hunt: earn the chosen grade of trophy or better on every Arcade League mission, every
  Challenge, or all 48. With this goal, completing 1924 Future Perfect on each difficulty is three
  ordinary checks.

## Items

* Story levels are named by year, for example "2401 Time To Split". With the Progressive Story
  Level option they are replaced by 13 "Progressive Story Level" items that open the levels in order.
* Cheats are named "<cheat> Unlock", for example "Fat Characters Unlock", and are Useful items.
  The unused cheats
  (Infinite Ammo, Skating and one hidden entry) are left alone.
* Arcade weapons are named "<weapon> Unlock", for example "Pistol 9mm Unlock". A weapon can only
  be picked for a custom weapon set once you have it, and its (x2) version comes with it. You
  start with one random weapon. Unarmed is always available, and the hidden weapons are not in
  the pool. Weapons and characters are filler.
* "Progressive Behead The Undead Score Multiplier" (up to three, if switched on): each one
  multiplies the points for every kill in Brain Drain, Rare Or Well Done? and Boxing Clever, up to
  x4. It needs Dolphin's cheat codes (Config > General > Enable Cheats) to be off.
* "Progressive Miscellaneous Challenges Score Multiplier" (up to three, if switched on): the
  same for the points you score in Cortez Can't Jump!, TSUG: TimeSplitters Underground and Plainly
  Off His Rocker, up to x4. It also needs Dolphin's cheat codes to be off.
* "Progressive Starting Armour" (up to four, if switched on): each one raises the armour you get
  when you start a mission, restart from a checkpoint or respawn: 25%, 50%, 75%, then a full bar.
  It applies in Story, Arcade League, Behead The Undead and TimeSplitters 'Story' Classic.
* Weapon buffs, named like "Weapon Buff - Pistol 9mm - +25% Clip Size". Each copy adds that much
  of the normal value, up to three copies (two for Dispersion Gun Bullets Per Shot). The stats
  are Clip Size, Reserve Ammo, Reserve Grenades and, for the Dispersion Gun, Bullets Per Shot. They fill
  the locations left over after everything else, so a seed holds a random selection; the
  Dispersion Gun Bullets Per Shot and Injector Clip Size and Reserve Ammo buffs are always
  included. With every option on there are about 70 in a seed; with Include Weapon Buffs off the
  leftover locations hold "Nothing" items instead. A buff also applies to the weapon's (x2) version. The client's "Weapon Buffs" tab
  lists the ones you have.
* Characters are named after the character. Characters and cheats only unlock from their items,
  never from the trophy or story level that normally unlocks them.

## Options

**Game Options**
* Starting Mission: a random Arcade League mission or Challenge (default), a random Arcade League
  mission, a random Challenge, a random story level, any of them, or Time To Split.
* How Many Starting Arcade/Challenge Missions (1 to 5) for the random Arcade/Challenge choices.
* Story Mode Status (individual levels or Progressive Story Level), Goal, Death Link, Streamer Mode.

**Goal Options - 1924 Future Perfect** (only with that goal)
* Story Levels Required To Access Goal, How Many Trophies Required To Access Goal, Minimum Grade
  Of Trophy To Count.

**Goal Options - Trophy Hunt** (only with that goal)
* Trophy Hunt Goal Setting (all Arcade League missions, all Challenges, or all 48), Trophy Grade
  Required For Goal, and Exclude Story Mode (story checks then only hold useful and filler items).

**Difficulty Settings**
* Exclude Hard Difficulty On Story Levels (on by default), Exclude All Platinum Trophies,
  Exclude Specific Platinum Trophies. Excluded locations only ever hold filler items.
* Easier Astro Jocks (Platinum 2:15, Gold 2:30, Silver 3:00), Easier Rumble In The Jungle
  (Platinum 3:15), Easier Cut-Out Shoot-Out Platinum Scores (Hart Attack 1775, Come Hell Or High
  Water 1700, Balls Of Steel 1200) and Quicker Electro Chimp Discomatic (Platinum 4:00, Gold 3:00,
  Silver 2:00, Bronze 1:00). These change what the game asks for, while the client is connected
  and from the next time the mission is loaded.

**Bonus Items**
* Progressive Starting Armour, Progressive Behead The Undead Score Multipliers and Progressive
  Miscellaneous Challenges Score Multipliers (each off, start with one, or shuffle all), an option
  for each multiplier to make one an early item, and Include Weapon Buffs.

**Milestone Locations**
* Four switches for the group, league and all-Challenges milestones.

## Streamer Mode
With Streamer Mode on, the licensed song in the Disco map and the credits is replaced with "Like
A Monkey", another track from the game. It applies while the client is connected, from the next
time that music starts.

## Death Link
With Death Link on, failing a mission sends a death to everyone else with it on: dying in a
Story level, failing a Story objective, or failing an Arcade League mission or Challenge. Dying
and respawning in an Arcade League match does not count. When someone else's death arrives, the
mission you are playing fails; nothing happens if you are in the menus or a custom Arcade match.
Finishing an Arcade League mission or Challenge below Bronze counts as failing it. Receiving
deaths needs Dolphin's cheat codes to be off.

## How it works

The client changes the game's own unlock rules in memory while it is connected, and one small
piece of the game's code so that story levels follow your items (when you beat a level, the game
only carries on into the next one if you have it; otherwise it returns to the menus). Your save
data is not changed, and everything goes back to normal when the game is restarted without the
client.

## Universal Tracker

If Universal Tracker is installed, the client shows its tracker tab and knows which checks are in
logic. No YAML is needed: it rebuilds the logic from the game you connect to.
