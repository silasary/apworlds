# Atlyss

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to
configure and export a YAML file.

## What does randomization do to this game?

ATLYSS stays a single-player (or local co-op) action RPG. Archipelago adds multiworld checks and
items on top of vanilla play:

* **Locations** send checks when you hit milestones in your save — even levels, boss kills, quest
  completions, optional achievements, shop purchases (with Shop Sanity), and profession-tool
  purchases (with Profession Tools in pool mode).
* **Items** from other players arrive through the in-game mod. Equipment and consumables are
  delivered via **Spike's storage** (or applied directly for portals, crowns, and similar rewards).
* **Area access** can depend on portal items. With **Random Portals** off (default), you unlock
  regions through **Progressive Sanctum Portal** and **Progressive Tuul Portal** lines. With
  **Random Portals** on, each area or dungeon floor has its own portal item.
* **Equipment Progression** controls whether gear follows tier/gated placement (**Gated**) or
  appears as individual pieces anywhere (**Unrestricted**).

Early **Goal** options trim locations that lie beyond that goal's progression so shorter runs
have fewer checks and less filler.

## What is the goal of Atlyss in Archipelago?

Your YAML **goal** option sets the victory condition. The mod reports **ClientGoal** to the server
when you meet it in-game. Options include:

* Defeat a specific major boss (Slime Diva, Lord Zuulneruda, Colossus, Galius, Lord Kaluuz, or
  Valdur).
* **All Bosses** — defeat all six major bosses.
* **All Quests** — complete every tracked quest.
* **Level 32** — reach the maximum level.

You do **not** need every location check to finish if your goal is reached earlier. Unchecked
locations may still release items depending on server settings.

## Which items can appear in other players' worlds?

Your slot can send many ATLYSS items, including:

* **Equipment** — weapons, armor, and trinkets (progressive lines when using gated progression).
* **Consumables and materials** — potions, bombs, keys, crafting mats, and similar filler or
  useful items.
* **Crowns** — currency grants (`Crowns (...)` items).
* **Portals** — progressive or per-area portal unlocks, depending on **Random Portals**.
* **Progressive class gear** — Fighter, Mystic, and Bandit lines when class filtering allows them.

**Class Filter** limits which class-tagged gear enters your pool. Universal trinkets, consumables,
and **Progressive Any** items are not filtered.

## What is considered a location check in Atlyss?

Checks are sent automatically while connected (and re-sent from save state after reconnect when
the game still shows completion):

* **Reach Level** — even character levels 2 through 32.
* **Boss defeats** — major bosses placed for your goal scope.
* **Quest completions** — finished quests in your save.
* **Achievements** — when the **Achievements** option is enabled (default).
* **Shop Sanity** — buying flagged shop stock (when enabled).
* **Profession Tools** — first fishing-rod or pickaxe purchase at a merchant when tools are in the
  item pool.

## When the player receives an item, what happens?

The BepInEx mod receives items from the Archipelago server in order. Most gear goes to **Spike's
storage**; portals unlock areas; crowns add currency; level and quest event items are logic-only
and do not appear as physical loot. Duplicate or extra copies of the same item are supported —
the mod tracks grants so reconnects stay in sync.

## Can you play multiplayer?

Yes. Multiple people can share one ATLYSS session, but only **one Archipelago slot** applies per
game instance. Each player slot in a multiworld needs its own game (or host handoff). Everyone in
the same instance benefits from items sent to that slot's player.

## Death Link

If you enable **Death Link** in the mod's Archipelago settings tab (or your YAML tags), linked
deaths from other worlds can affect your run when the feature is active on the server.

## Connection drops

The in-game mod retries login after an unexpected disconnect (BepInEx `Connection.AutoReconnect`,
default on). Press **F5** to connect manually or reset backoff. Intentional disconnects (main
menu, save and quit) do not auto-reconnect.
