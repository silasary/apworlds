# Sekiro: Shadows Die Twice

Game Page | [Items] | [Locations]

[Items]: /worlds/sekiro/docs/items_en.md
[Locations]: /worlds/sekiro/docs/locations_en.md

## What do I need to do to randomize Sekiro?

See full instructions on [the setup page].

[the setup page]: /worlds/sekiro/docs/setup_en.md

## What does randomization do to this game?

1. All item locations can be randomized, including those in the overworld, in
   shops, and dropped by enemies. Treasure Carp locations are turned off by 
   default, but can be enabled. Most locations can contain items from other 
   worlds, and any items from your world can appear in other players' worlds.

2. By default, all enemies and bosses except for Headless are randomized. This 
   can be disabled by setting `Randomize Enemies` to false.

3. By default, we have added some hard region separators to make the game a 
   little more segmented. This can be disabled by setting 
   `Additional Progression Blockers` to false. Since these are custom items not 
   found in the vanilla game, they have been documented explicitly in the 
   [Items] guide.

There are also options that can make playing the game more convenient or bring 
a new experience. These include removing the Headless-induced slow walk, 
shuffling skills and prosthetic learn trees or even having the skills from the 
esoteric texts be separate item drops. Check out the Template YAML or the Option 
Builder in the Archipelago Launcher for more.

## What's the goal?

There are two options available for the goal, to be selected in the YAML.

The `Full Game` goal is to reach the final boss of the second invasion and 
achieve one of the endings that require the `Divine Dragon's Tears`.

The `Shura` goal is achieved by joining Owl in the first invasion and defeating
the alternate final boss.

## Do I have to check every item in every area?

Sekiro has nearly 750 item locations, but you don't necessarily need to check 
all of them. Locations that you can potentially miss, such as rewards for 
failable quests or areas that become unavailable during the game state changes, 
will _never_ have items required for any game to progress. The following types 
of locations are also guaranteed not to contain progression items by default:

* **Hidden:** Locations that are particularly difficult to find, such as in
  crawl spaces, down hidden drops, behind walls and so on. Does not include 
  large locations like Ashina Outskirts after the Central Forces invasion.

* **Headless:** Headless miniboss drops. These locations contain the spiritfall 
  items in vanilla.

You can customize which locations are guaranteed not to contain progression
items by setting the `exclude_locations` field in your YAML to the [location
groups] you want to omit. For example, this is the default setting but without
`Headless` so that those locations can contain progression items:

[location groups]: /worlds/sekiro/docs/locations_en.md#location-groups

```yaml
Shadows Die Twice:
  exclude_locations:
    - Hidden
```

This allows _all_ non-missable locations to have progression items, if you're in
for the long haul:

```yaml
Shadows Die Twice:
  exclude_locations: []
```

## What if I don't want to do the whole game?

If you want a shorter Sekiro randomizer experience, you can choose the `Shura` 
goal. This will allow you to end the game after the first invasion and removes 
several late-game regions entirely.

If you want to reduce the number of locations containing progression items 
further regardless of the goal, add the `Miscellaneous` and `Upgrade` location 
groups to your excluded locations:

```yaml
Shadows Die Twice:
  exclude_locations:
    - Hidden
    - Headless
    - Miscellaneous
    - Upgrade
```

Using these exclusions will make only around 150 - 200 locations eligible for 
progression items (exact number depending on chosen options). This will however 
not reduce your total location count in the log as they are still all generated!

## Where can I learn more about Sekiro locations?

Location names have to pack a lot of information into very little space. To
better understand them, check out the [location guide], which explains all the
names used in locations and provides more detailed descriptions for each
individual location.

[location guide]: /worlds/sekiro/docs/locations_en.md

## Where can I learn more about Sekiro items?

Check out the [item guide], which explains the named groups available for items 
as well as the custom items added to the game for the 
`Additional Progression Blockers` option.

[item guide]: /worlds/sekiro/docs/items_en.md
