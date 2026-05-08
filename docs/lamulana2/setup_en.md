Alpha release of the La-Mulana 2 APWorld.

The APWorld ports most functionalities of the [original randomizer by Coookie93](https://github.com/Coookie93/LaMulana2Randomizer) with some additional safeguards and features.

**_Please set up the LaMulana2Archipelago BepInEx Mod prior to setting up the APWorld._**
https://github.com/Crownmuri/LaMulana2Archipelago

# How to Play 
1. Download the La-Mulana 2 APWorld and YAML template here: https://github.com/Crownmuri/Archipelago/releases
2. Install it (put it into the `archipelago/custom_worlds` folder)
3. Customize the YAML template and put it into the `archipelago/Players` folder
4. Start the Archipelago Server
5. Launch La-Mulana 2. On startup it will load some sprites from certain areas. 
6. On the title screen, **LaMulana2Archipelago** will automatically attempt to connect to `localhost:38281` with slotname `Lumisa` first. If the connection fails, you can manually fill in the server, slotname and password in the GUI on the title screen.
7. Once you're connected you're good to go!
8. [Optionally] [Connect the La-Mulana 2 PopTracker pack for auto-tracking](https://github.com/Crownmuri/LaMulana2AP-PopTracker)
9. [Optionally] For offline play, you can use the APWorld to generate a legacy `seed.lm2r` file (backwards compatible with the original randomizer)

# Ported Features
Same seed writing structure as the original randomizer. This means that the most options are ported:
- Starting Items (Holy Grail, FDC, Hand Scanner, Shell Horn, Codices, Ring, Maps/Software (available at start is untested)
- Randomized Mantras / Shops / Research / Dissonance (switching to Guardians) / Cursed Chests
- Option to remove Maps / Research / excess Skulls (replaced by filler)
- Randomized Starting Weapon / Starting Area
- Logic appends: FDC required / HoM Life Sigil required / DLC item usage / Costume Clip (untested)
- Hard Logic (untested) / Echidna Type (untested)
- Quality of Life features (auto-scan / auto-skulls / starting money & weights / chest colors)
- Entrance Randomization (horizontal / vertical / gates / soul gates / randomized souls / mixed transitions) 

# New Features
- Guardian Specific Ankh Jewels 
This will append Ankh Jewels with boss names at the boss locations in the World.json logic mapping. (e.g. "Ankh Jewel (Fafnir)")
The LM2 Bepinex Mod will live patch the usability of Ankh Jewels for specific bosses.
- Death Link
This will trigger an instant death similar to casting all mantras without meeting all conditions.
The LM2 Bepinex Mod will separately have a toggle button to turn on/off Death Link in the main menu.
- AP Chest Color
You can now choose colors separately for LM2 non-filler chests, LM2 filler chests, and AP item chests.
The LM2 Bepinex Mod will live patch the AP item chest color based on the seed loaded in the server.
- Potsanity mode (WIP)
When turning this mode on, the first 30 item pots (Village of Departure, La-Mulana Ruins, Roots of Yggdrasil) are added to the pool.

# Adjustments
- New filler items
While the seed writer still uses ChestWeight/FakeItem/NPCMoney/FakeScan for placing in-game filler, the filler needed to be able to be sent to the LM2 player from AP at any given time, non-location specific. As a result, the contents of the filler is automatically converted to one of the items below. Currently I have set these filler items to accommodate more purchasing power for AP items in shops.
*1 Coin
*10 Coins
*30 Coins
*50 Coins
*80 Coins
*100 Coins
*1 Weight
*5 Weights
*10 Weights
*20 Weights

- Shop prices
The dynamic sphere based shop price balancing is mostly maintained but I reduced the multiplier by half.
In addition, filler items in shops are free one time purchases instead of converted to [Weights]. 
Balancing might still be required.

# Issues
- Some untested options (I ported the functions but did not test yet)
- Death Link sometimes not sending out to other players (on AP BepInEx mod side)
