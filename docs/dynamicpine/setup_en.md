# Dynamic Pine setup guide

Dynamic Pine is not a game you play — it's shared infrastructure that other PS2
apworlds (e.g. Ratchet & Clank: Size Matters) build on. If a game you're
playing supports it, install the Dynamic Pine apworld the same way you would
any other, then configure it once in your `host.yaml`:

```yaml
dynamic_pine_options:
  pcsx2_path: "C:/Program Files/PCSX2/pcsx2-qt.exe"
  pcsx2_data_path: "dynamic_pine_pcsx2_data"
  bios_path: "C:/Users/you/Documents/PCSX2/bios"
  game_files:
    SCUS-97615: "C:/isos/Ratchet and Clank Size Matters.iso"
```

| Setting | Meaning |
|---|---|
| `pcsx2_path` | Path to your PCSX2 executable. Shared by every Dynamic Pine game - if missing, you'll be prompted to browse for it once and the choice is remembered. |
| `pcsx2_data_path` | Root folder for PCSX2's portable per-instance settings data. A subfolder per game serial, then per connecting slot name, is created here - kept separate from your regular PCSX2 install so multiple games/slots can run at once. |
| `bios_path` | Folder containing your PCSX2 BIOS file(s), shared across every instance. Leave unset to be prompted the first time an instance needs one. |
| `game_files` | Your own ISOs, keyed by each game's PS2 serial. A game with no entry here can still be played - Dynamic Pine just can't auto-launch PCSX2 for it (you'd start PCSX2 yourself). |

None of these are required up front - `pcsx2_path`, `bios_path`, and each
game's ISO will each prompt you with a native file/folder picker the first
time they're needed, and the choice is written back to `host.yaml` so you're
only asked once.

## Using it

Once configured, install a Dynamic Pine enabled apworld and launch the
**"Dynamic Pine"** entry from the AP Launcher. It opens a hub with one tab per
installed Dynamic Pine game, each with:

- Its configured ISO status, with a **"Locate ISO..."** button if it's not
  found yet.
- An **Instance** field (the slot name you'll connect with — leave as
  `default` if you don't know it yet).
- Either a single **Launch** button (games that launch PCSX2 and their client
  together) or separate **Launch PCSX2** / **Launch Client** buttons.
- A live **Instances** status line and a **Clear Unused** button to delete old
  instances you no longer need (frees their disk space/port).

The shared BIOS folder can be set or changed from the row at the top of the
hub at any time.

### Headless / without the GUI

The same actions are available as client commands if you're running the hub
without a GUI (`--nogui`) — see [Client commands](commands.md) for
`/games`, `/launch`, `/launch_pcsx2`, `/clear`, and `/bios`.

## Reference

- [API reference](api.md) — for world/client authors integrating a game.
- [PCSX2.ini settings](ini_settings.md) — exactly what Dynamic Pine changes
  in your PCSX2.ini and why.
