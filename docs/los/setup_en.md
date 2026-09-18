# Castlevania: Lords of Shadow setup

## Upgrading to 0.6.1 (same run)

Close the game/client and replace **both** `bin/dinput8.dll` and `custom_worlds/los.apworld`.
Keep your existing profile, YAML settings and AP room. **Do not delete your save to upgrade.**
The DLL handles the obsolete AP command record behind the completion/relaunch crash. New
command state is not saved in the profile. Logic corrections apply to newly generated seeds.

## Starting a new run

1. Install Archipelago 0.6.7.
2. Copy `los.apworld` into Archipelago's `custom_worlds` folder.
3. Copy the package's `Game Folder` contents into the Lords of Shadow installation folder. This
   adds only `bin/dinput8.dll`; it does not replace the game executable or a retail archive.
4. Edit the provided YAML yourself, then generate or join a room normally.
5. Fully close the game, manually back up `Castlevania.profile`, disable Steam Cloud for the game,
   and remove only that profile. Leave `Castlevania.cfg` in place.
6. Open the standard Lords of Shadow Archipelago client and connect to the room.
7. Start Lords of Shadow normally through Steam. Select New Game on the empty profile; the retail
   World Map should show the seed's authorized starting levels.
8. Keep the AP client open. It reconnects after deaths, checkpoints, and level transitions.

For another seed, manually archive/remove the AP `Castlevania.profile` again. To return to the normal
campaign, close the game and restore the profile you backed up. The mod includes no custom executable,
launcher, save manager, or replacement level selector and never changes `Castlevania.cfg`.
# Optional paid skill checks (0.7.1 alpha)

Set `skills_as_checks: enabled` to add all 31 purchasable skill entries as
checks and shuffle their move unlocks. Starting/free moves, riding abilities,
story rewards and automatic relic/tool moves are excluded. Each purchase costs
its retail XP amount. Buying an upgrade requires buying its predecessor check;
using the move still requires receiving the appropriate skill item(s) and relics.
Starting levels remain fully random. Skill mode places two 3,000-XP rewards on
early reachable checks, and the shop checks cannot contain those prerequisite
rewards. Normal combat in any reachable level supplies renewable XP. The fixed
25-package AP XP pool totals 65,000 XP; no separate shop budget is added.

Set `reveal_skill_rewards: enabled` to read each purchase's actual AP item and
recipient before buying it. This works with items from other games. Long names
cycle through overlapping segments. It does not create AP hints. Both options
default to disabled; the preview option has no effect when skill checks are off.
These options require a newly generated seed.

The three-entry native menu pilot is tested; the full catalog, previews and
replay farming are new alpha coverage. Report problems with the purchase journal
and client log intact. If a game reload interrupts an uncertain XP debit, skill
purchases pause instead of automatically charging again. Keep the per-seed journal
under `%LOCALAPPDATA%/Archipelago/LordsOfShadow/skill-purchases` for diagnosis.
Do not run a standalone prototype helper alongside the public AP client.
