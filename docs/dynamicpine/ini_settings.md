# PCSX2.ini settings Dynamic Pine manages

Dynamic Pine only ever touches these keys, re-applying all of them on every
(re)build of an instance's ini so manual edits self-correct on the next
launch. Anything else in `PCSX2.ini` is left as PCSX2's own defaults / the
user's own settings:

| Section        | Key                | Value                          | Set by |
|----------------|---------------------|--------------------------------|--------|
| `EmuCore`      | `EnablePINE`        | `true`                          | `pypine`'s `PineConfig` |
| `EmuCore`      | `PINESlot`          | the instance's resolved port    | `pypine`'s `PineConfig` |
| `Memcard`      | `Slot1_Enable`      | `true`                          | `pypine`'s `PineConfig` |
| `Memcard`      | `Slot2_Enable`      | `false`                         | `pypine`'s `PineConfig` |
| `Memcard`      | `Slot1_Filename`    | the game's `memcard_name`       | `pypine`'s `PineConfig` |
| `Folders`      | `Bios`              | the shared `bios_path`, if set  | `DynamicPineConfig` |
| `Achievements` | `Enabled`           | `false`                         | `DynamicPineConfig` (`BASE_INI_SETTINGS`) |
| `Achievements` | `ChallengeMode`     | `false`                         | `DynamicPineConfig` (`BASE_INI_SETTINGS`) |
| `UI`           | `SetupWizardIncomplete` | `false`                     | `DynamicPineConfig` (`BASE_INI_SETTINGS`) |
| `UI`           | `SettingsVersion`   | `1`                             | `DynamicPineConfig` (`BASE_INI_SETTINGS`) |
| *(any)*        | *(any)*             | per-game `ini_overrides`        | the game's `DynamicPineGame` declaration |

The `UI` keys exist purely to skip two blocking PCSX2 dialogs a brand-new,
blank ini otherwise pops on its very first `-batch` launch — PCSX2's
first-run setup wizard, and a "Settings failed to load, or are the incorrect
version - reset to defaults?" confirmation. Without them, Dynamic Pine's
headless launch just hangs waiting for someone to click through a dialog on
an emulator window it never expects anyone to look at.

A game adds to this list, rather than Dynamic Pine growing more hardcoded
settings, via `ini_overrides` on its `DynamicPineGame` declaration:

```python
dynamic_pine = DynamicPineGame(
    game_ids="SCUS-97615",
    ini_overrides={"EmuCore": {"EnableCheats": "true"}},
)
```

Overrides are applied last, after the base settings, so a game can override
anything above **except** `EnablePINE`/`PINESlot` (re-applied last of all by
`pypine` itself, so PINE can never accidentally be disabled).

See [Adding Dynamic Pine to your apworld](adding_to_apworld.md) for the full
`DynamicPineGame` declaration.
