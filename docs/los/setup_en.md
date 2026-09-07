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
