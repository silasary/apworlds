# Black Market of Bulletphilia ~ 100th Black Market

## Where is the options page?

The player options page for this game contains all the options you need to configure and export a config file. Player options page link: [100th Black Market Player Options Page](../player-options). If installed as a custom .apworld, it is recommended to use the Archipelago Launcher's **Options Creator** instead.

## What does randomization do to this game?
The following are now location checks:
- All boss encounters and defeats from the _Tutorial_ stage to _End of Market_.
- All boss encounters in Challenge Market.
- All card unlocks at the end of every run.
- All card dex unlocks.
Optionally, the following could also be location checks:
- All Music Room soundtrack unlocks.
- All Achievements.

They may contain items for different games as well as different items from within 100th Black Market.

## What is the goal of 100th Black Market when randomized?
You may choose 1 out of 5 goals to reach for in this implementation.
- Complete the **full story line**. This means defeating not just the boss of End of Market, but also the hidden bosses of the 4th and 6th Market.
- Complete the **minimum story line**. This means only defeating the hidden boss of the 6th Market is necessary.
- Collect **all Ability Cards**.
- Defeat **all bosses**. Challenge Market does not count.
- And both of the above, shown as **Full Clear** in the options page.

## Which items can be in another player's world?
### Stage Unlocks (Progression)
- Tutorial - First Black Market Deal
- 1st Market - Secret Heaven Cliff
- 2nd Market - Misty Lake
- 3rd Market - Sai no Kawara
- 4th Market - Moriya Shrine (Dark Fair)
- 5th Market - Youkai Mountain
- 6th Market - Rainbow Dragon Cave
- End of Market - Lunar Rainbow Market
- Challenge Market - Lunar Rainbow Black Market
### Ability Cards in Card Market (Progression)
All cards except two of Nazrin's "Money Comes and Goes On Its Own" cards are shuffled. See [here](https://en.touhouwiki.net/wiki/100th_Black_Market/Ability_Cards) for specifics.
### Useful/Filler Items
- Additional Lives
- Additional Funds
- Additional Bullet Money
- Various Magic Circle stat changes
- Movement Speed
- Shot Attack Strength
- Temporary Invincibility
### Traps (Toggleable via Trap Chance)
- Reduced Funds
- Reduced Bullet Money
- Reduced Equipment Cost Limit
- Various Magic Circle stat changes
- Hyper Movement Speed
- Instant Invincibility Cancel

Certain items received only take effect in a stage. If the player is not in a stage, the game will wait until they are in a stage before processing said items. These items last only during the current run of a stage and will disappear upon the start of a new run, except for items related to **Funds**, **Bullet Money**, and **Equipment Cost Limit**.

## What does another world's item look like in 100th Black Market?
The items are **visually unchanged**. After collecting an item, a message will show up in the client.

## When the player receives an item, what happens?
When you receive an item, the client will inform you of what you received. Changes will occur as appropriate in the game.

## Credits
- **Nepley**: AP implementations for Embodiment of Scarlet Devil, Perfect Cherry Blossom, and Imperishable Night borrowed as a framework for 100th Black Market AP. Anticheat disabling as well.
- **CodeGorilla**: Nicer-looking names in Options.
- **Doremy/Iesua Inane** of Mirage Creators: Playtesting, writing several Death Link messages.
