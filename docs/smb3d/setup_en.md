# Super Meat Boy 3D setup

Install the matching APWorld, Windows client and UE4SS game mod from the integration package. Update the APWorld and restart Archipelago before generating a new seed when changing options. Close the game before running Install-Mod.cmd.

```yaml
Super Meat Boy 3D:
  goal: all_bosses
  darksanity: false
  bandagesanity: false
  speedsanity: false
  tofu_trap_filler_weight: 0
```

The three sanity toggles default to off. Darksanity adds 75 dark clears and 75 dark access items. Bandagesanity adds 75 light-level bandage checks. Speedsanity adds 75 light A+ checks, and another 75 dark A+ checks only with Darksanity. All original item/location IDs remain stable.

Connect the matching client with the room server:port, slot name and optional password, then launch the game. Existing generated rooms retain their old option layout; regenerate to change sanity options.
