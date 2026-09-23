# Deadlockipelago - Setup Guide

Follow these steps to play Deadlock with Archipelago.

---

## 1. Install the Deadlock world

- **Recommended:** Install the **deadlock.apworld** file via the Archipelago Launcher (**Options** → **Install APWorld**, or drag the file into the launcher).
- **From source:** Place the `deadlock` folder inside your Archipelago `worlds/` directory.

After installation, **Deadlock** and **Deadlock Client** should appear in the launcher.

---

## 2. Create your options

- Use the **Player Options** page (if provided with this world) to choose goal type, win counts, and starting heroes, then download the YAML.
- Or in the Archipelago Launcher: **Generate Template Options** → select **Deadlock** and configure options.

---

## 3. Generate a multiworld

Create a new multiworld (solo or with others), add **Deadlock** with your options, and generate the seed. Note the **room connection details** (server, port, slot/password or room URI).

---

## 4. Run the Deadlock client and connect

Open **Deadlock Client** from the launcher and connect using the room URI or server address and slot/password.

---

## 5. Set your SteamID3

In the client, run:

```
/set_player_id [U:1:123456789]
```

or

```
/set_player_id 123456789
```

Replace with your own SteamID3 (e.g. from [steamid.io](https://steamid.io/)). This is required so the client can identify you in match data when you submit games.

---

## 6. Recommend: Install Deadlock API Ingest

The client fetches match data from **api.deadlock-api.com**. If your matches are not submitted to that API, `/submit_match` will fail or take a long time.

**[Deadlock API Ingest](https://github.com/deadlock-api/deadlock-api-ingest)** runs in the background and submits your matches to the API automatically. Install it once (Windows, Linux, Docker, or NixOS) and leave it running. See the linked repo for install scripts.

---

## 7. Play Deadlock and submit matches

1. Play matches in Deadlock.
2. Get the **match ID** for each finished match (e.g. from your match history or a match-history site).
3. In the client, run: **`/submit_match <match_id>`** (aliases: `/submit`, `/s`).
4. The client fetches match data, awards any earned locations, and updates your progress. **Match data can take around 5 minutes (or more) to appear in the API**-if the command fails, wait and try again.
5. When you meet your goal, the client will send the **Goal** check and mark your game complete.

Only matches that **started after** you began this Archipelago seed can be submitted.

---

## Goals

- **Unique Characters:** Win with **N** different heroes (option: Unique Characters to Win, 1–38).
- **Total Wins:** Win **N** matches total (option: Total Wins to Win, 1–100).

The client checks the dynamic **Goal** location when you achieve the condition.

---

## Useful client commands

| Command | Description |
|--------|-------------|
| `/goal` | Show your current goal and progress. |
| `/heroes` | List heroes unlocked via Archipelago items. |
| `/stats` | Show games submitted, kills, assists, souls, and related totals. |
| `/save_path` | Show the path to your Deadlock save file and seed name. |
