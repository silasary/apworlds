
# Commander Keen in Goodbye, Galaxy


## What items and locations get shuffled?

Level unlocks, per-level keygems and keycards, and optionally wetsuit/pogo stick/neural stunner can all be added to the item pool. Extra stunner ammo and extra lives are added as filler items. Locations include picking up keygems and keycards, as well as finishing levels. Future releases will include an optional "pointsanity" location option where per-level point threshholds will be added as locations.

## Which items can be in another player's world?

Any of the items which can be shuffled may also be placed into another player's world. It is possible to choose to limit
certain items to your own world.

## What does another world's item look like in Commander Keen?

There is no visible difference in item appearance. Keygems still look like keygems, but collecting one will not add that keygem to the inventory. Instead, an item will be sent to another player.

## When the player receives an item, what happens?

When the player receives an item, there is currently no feedback to alert the player. It is highly recommended to play with a text client or Universal Tracker open to see what items are sent and received.

## What is the goal to finish Commander Keen?
In episode 5, the goal is to finish the canonical final level, "Quantum Explosion Dynamo". Episode 4 doesn't have a final level, so "Bean-With-Bacon Megarocket" has been designated the goal level. In both episodes, the final level will not be accessible until all other levels are accessible.

## What options are available?
* Episode Select: Play episode 4, 5, or both! Episode 6 is not supported.
* Enable Gemsets: You can opt to receive all keygems for a level at once instead of individually. This reduces the number of times you have to enter a level.
* Additional Starting Levels: You will always start with Border Village and Slug Village in episode 4 and Ion Ventilation System and Security Center in episode 4. You can select to start with 3 to 10 additional levels chosen at random.
* Enable Conesanity: Turns every reachable Ice Cream Cone (Keen 4 5000-point pickup) into its own AP location.
* Enable Sugarsanity: Turns every reachable Bag O' Sugar (Keen 5 5000-point pickup) into its own AP location.
* Enable Flasksanity: Turns every reachable Lifewater Flask (Keen 4 extra-life pickup) into its own AP location. Unreachable flasks are excluded automatically.
* Enable Kegsanity: Turns every Vitalin Keg (Keen 5 extra-life pickup) into its own AP location.
* Enable Keen 4 Secret Level: Adds the Pyramid of the Forbidden as an optional level (see [Secret levels](#secret-levels) below). Off by default.
* Enable Keen 5 Secret Level: Adds Korath III Base as an optional level (see [Secret levels](#secret-levels) below). Off by default.
* Randomize Stunner/Pogo/Wetsuit: For each item you can select whether to start with it, have it placed early in the seed, or to completely randomize it.

## Secret levels

Each episode has an optional secret level. Both are off by default and toggled
separately (*Enable Keen 4 Secret Level* / *Enable Keen 5 Secret Level*), and
neither is required to reach the goal.

* **Pyramid of the Forbidden** (Keen 4): its hidden entrance only opens after
  you gather all the inchworms inside the **Pyramid of the Moons**, behind that
  level's yellow-gem door. So logic won't expect anything in the Pyramid of the
  Forbidden until you can also reach the Pyramid of the Moons **and** hold its
  yellow gem (i.e. you could complete the Pyramid of the Moons).
* **Korath III Base** (Keen 5): reached only through the hidden teleporter deep
  inside the **Gravitational Damping Hub** (the "Impossible Pogo Trick"). You
  need the pogo stick to get there, and the teleporter sits past the Hub's green
  and red doors — so logic also requires the Gravitational Damping Hub unlock
  plus its **green** and **red** gems (the same reach as the Hub's Vitalin Keg,
  plus the red gem for the teleporter door).

When enabled, a secret level adds its own unlock item, keygems (plus a keycard
for Korath), a level-completion check, and — if the matching sanity option is on
— its cones/flasks (Keen 4) or sugar/kegs (Keen 5).

### Two gems of one colour

The Pyramid of the Forbidden has **two red gems and two red doors**, and Korath
III Base has **two blue gems and two blue doors** — the only levels with two
gems of a single colour. Because the game reports a gem pickup only by its
colour, the two same-coloured gems share a **single** "Red Gem" / "Blue Gem"
location check: picking up either one completes that check, so on a tracker both
gem pins will light up at once. You still receive **two** separate gem items,
and you need **both** to open both doors and finish the level.

### Don't worry about getting stranded

The Pyramid of the Forbidden sits in a sealed pocket of the Shadowlands map
(vanilla flies you in once you've gathered the inchworms in the Pyramid of the
Moons). If you visit it before you have what you need to finish it, you might
worry about being trapped there — you can't walk back out, and pressing CTRL+R
inside the level just drops you at the entrance in that same pocket.

You can always get out: **pressing CTRL+R while standing on the overworld map
returns Keen to the level's starting position** (the same spot a new game
starts you at). So the escape is to step back onto the secret-level entrance,
CTRL+R out into the pocket, then CTRL+R once more on the map to warp back to the
start. This works on any map, so a secret level can never strand you.

(Inside a level, CTRL+R still returns you to wherever you entered from — so you
can freely leave and re-enter a level you're working on.)

## What changes have been made from the vanilla game?
* You will be unable to enter a level until the level unlock item is received from the multiworld.
* You can exit a level early by pressing CTRL+R. Pressing CTRL+R while on the
  overworld map instead returns you to the map's starting position, so you can
  never get stranded (see [Don't worry about getting stranded](#dont-worry-about-getting-stranded) above).
* You can replay completed levels.
* Rescuing all council members in episode 4 no longer triggers the end of the game.
* Gates on the overworld have been removed. For example:
	* In episode 4, you no longer have to complete Slug Village to access the rest of the levels.
	* In episode 5, you no longer have to finish the defense tunnel level to play the level locked behind it.