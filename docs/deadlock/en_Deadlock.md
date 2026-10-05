# Deadlockipelago

A **meta-progression randomizer** for [Deadlock](https://store.steampowered.com/app/1422450/Deadlock/). You play normal matches; the Archipelago client tracks your results and sends **location** checks (hero wins, match milestones, accolades). Items you receive from the multiworld are **hero unlocks**-each "Unlock [Hero]" item lets you pick that hero in-game. Only wins on heroes you’ve unlocked count for location checks. Complete your configured **goal** (e.g. win with N unique characters or N total wins) to finish the seed.

## How it works

- **Items:** Progression items that unlock playable heroes (e.g. Unlock Seven, Unlock Wraith). You must have received the unlock before you can submit a match played as that hero.
- **Locations:** Checked by the client when you submit a match. They include: winning as each hero (3 checks per hero), matches played, total wins, Soul Urn, neutral camps, Sinner’s Sacrifice jackpots, kills, assists, souls, Key Player/MVP, boss/player damage, denies, and last hits. Progress is cumulative from the start of your seed.
- **Goal:** Either "Win with N unique characters" or "Win N matches total." The client checks the **Goal** location automatically when you meet the condition.

## What you need

- **Deadlock** (Steam) and an **Archipelago** room (solo or multiworld).
- The **Deadlock Archipelago client** (included with the world). You connect to the room, set your **SteamID3** (`/set_player_id`), then after each match you run **`/submit_match <match_id>`**. The client fetches match data from the Deadlock API and sends any earned location checks.
- **[Deadlock API Ingest](https://github.com/deadlock-api/deadlock-api-ingest)** is strongly recommended so your matches are available in the API; otherwise `/submit_match` may fail or require long waits. Match data can still take around 5 minutes to appear after a game.

See the **Setup Guide** (setup_en.md) for step-by-step installation and play instructions.
