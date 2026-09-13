# RemoteLua connection (Dread :6969)

## Roles

| Side | Role | Port |
|------|------|------|
| **Game** (open-dread-rando-exlaunch `remote_api.cpp`) | TCP **server**: `Bind`/`Listen`/`Accept` on **6969** | 6969 |
| **PC client** (Randovania `DreadExecutor` / AP `MetroidBreadClient`) | TCP **client**: `connect` → handshake → Lua EXEC | — |

The game opens the listen socket from `RemoteApi::Init()` during `multiworld_init` (Lua `RemoteLua` init), not at NSO load. Until then, clients see **connection refused**.

Exlaunch accepts **one** client (`Listen` backlog 1). Keep-alive must arrive about every **2s**; after ~**10s** without it the game closes the client socket (`keepAlive` countdown in `remote_api.cpp`).

## Randovania model

- `GameConnection` timer (`_dt = 2.5`) calls `DreadConnectorBuilder.build_connector()` while disconnected.
- `DreadExecutor.connect()` is a single `asyncio.open_connection` + handshake + bootstrap + `RL.UpdateRDVClient`; failures return an error string (no raise).
- On drop, the connector is removed and the **2.5s** timer builds again — passive retry until the port accepts.

## Archipelago model (current)

- Same protocol and port as RDV.
- `ensure_dread_connected()` / `/connect_dread`: **passive** retry with backoff until `:6969` accepts (mirrors RDV).
- Hub after Ryujinx launch: short grace (~3s), then `/connect_dread` (not a blind 30s one-shot).
- Keep-alive / read errors: tear down, then **auto-reconnect** if the user still wants a game link (`/disconnect_dread` clears that).
- Grants stay gated by cooldown / transition hold until MAINMENU/INGAME; the TCP link is **not** torn down solely for an unstable mode poll.

## Why AP felt flakier than RDV

1. One-shot connect (Hub 30s delay then fail) vs RDV’s continuous 2.5s retry.
2. Tearing down after bootstrap when game mode was not yet MAINMENU/INGAME (keep-alive never started → game drop / WinError 10053).
3. No auto-reconnect after keep-alive/read failure.
4. Extra AP Lua traffic (map/labels/death poll) after connect — still compatible, but needs a live keep-alive during settle.

## Do not

- Probe-connect-and-close to “check the port” while another client should attach — exlaunch only accepts one client.
- Hold Randovania Game Connection and AP on `:6969` at the same time.
