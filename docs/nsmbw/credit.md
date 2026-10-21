# Credit
<!-- TOC -->
* [Credit](#credit)
  * [Main developer](#main-developer)
  * [Main logic designer](#main-logic-designer)
  * [Others that helped](#others-that-helped)
  * [Communities that helped](#communities-that-helped)
* [Licences](#licences)
  * [Image licences](#image-licences)
    * [NSMBW_logo:](#nsmbw_logo)
    * [Tracker images](#tracker-images)
    * [Community projects used](#community-projects-used)
    * [AP projects based on](#ap-projects-based-on-)
    * [NSMBW projects used / taken inspiration from](#nsmbw-projects-used--taken-inspiration-from)
    * [Other open source software bundled with the client](#other-open-source-software-bundled-with-the-client)
  * [Original game](#original-game)
  * [NSMBW AI Usage Disclosure](#nsmbw-ai-usage-disclosure)
  * [Specific AI-usage](#specific-ai-usage)
<!-- TOC -->
## Main developer
- [Miiroun](https://github.com/Miiroun) : Coded apworld, client and patches.

## Main logic designer
- [React](https://github.com/ReactJacob) : Developed most of logic.


## Others that helped
- Sponk : Created 3d model of star coin merged with archipelago logo and boss key model
- CrazyJoe : Created the custom title screen
- Flo : Playtester and designed some icons
- Matgamer2575 : started project and found some memory addresses
- Adibtw : Consulted Linux compatibility
- [CelestePihen](https://github.com/CelestePihen) : PRed a few fixes.
- [IndyGibb](https://github.com/IndyGibb) : PRed some light code changes using Claude
- Techmuse : helped with locating addresses
- LuigiXRules : Fixed typos in documentation, provided helpful insight and playtested Us rev1


## Communities that helped
- [NSMBW channel](https://discord.com/channels/731205301247803413/1542569054026342520/1542569783113818112) in Archipelago dc server (for feature requests and playtesting)
- [Archipelago](https://discord.gg/archipelago) dc server (worlddev help and documentation)
- [Horizon](https://discord.gg/Quvaj2Ufhb) and [NSMBW Hacking Depot](https://discord.gg/nXgyHrMyjA) discord servers (knowledge about the game)

# Licences
## Image licences
### NSMBW_logo:
- Image by miiroun
- Remixed of archipelago logo by Krista Corkos and Christopher Wilson, licensed under [Attribution-NonCommercial 4.0 International](https://creativecommons.org/licenses/by-nc/4.0/)
- Based on star coins in mario, made by nintendo

### Tracker images
- The world map images are downloaded from https://www.mariowiki.com/ which is licenced under https://creativecommons.org/licenses/by-sa/4.0/. Some of them have been compresed.
- ALl draw images are (for now) made by miiroun and licenced under MIT


### Community projects used
- [Archipelago](https://archipelago.gg/)
- [Dolphin emulator](https://dolphin-emu.org/)
- [Dolphin memory engine (python lib)](https://github.com/randovania/py-dolphin-memory-engine)
- [Dolphin memory engine (RAM search tool)](https://github.com/aldelaro5/Dolphin-memory-engine)
- [retroachievements](retroachievements.org/codenotes.php?g=95)
- [Archipelago fuzzer (by Eijebong)](https://github.com/Eijebong/Archipelago-fuzzer)
- [Universal tracker](https://github.com/FarisTheAncient/Archipelago)
- [mariowiki.com](https://www.mariowiki.com/New_Super_Mario_Bros._Wii)
- [NSMBW decompiler](https://nsmbw-community.github.io/NSMBW-Decomp/)
- [NSMBW Address map](https://github.com/NSMBW-Community/NSMBW-Maps)
- [NSMBW Symbol map](https://rootcubed.dev/nsmbw-symbols/)


### AP projects based on 
(have borrowed significant code from the following ap-implementations, licenced under MIT)
- [APquest](https://github.com/ArchipelagoMW/Archipelago/tree/main/worlds/apquest)
- [Metroid Prime](https://github.com/Electro1512/MetroidAPrime/tree/main)
- [Mario kart Wii](https://github.com/toent/Archipelago-MKWii)


### NSMBW projects used / taken inspiration from
- [wii-code-tools](https://github.com/RoadrunnerWMC/wii-code-tools/tree/master), MIT, convert memory addresses between versions
- [Kamek (NSMBW compiler)](https://github.com/Treeki/Kamek), MIT, build system
- [Propeller parts](https://github.com/PropelParts-org/PropelParts), MIT, build system
- [mkwcat/gecko-codes](https://github.com/mkwcat/gecko-codes), MIT, some of the patches are modified but included
- [nsmbw-pipe-randomizer](https://github.com/mkwcat/nsmbw-pipe-randomizer), MIT, included but modified
- [NSMBW randomizer (original, non ap)](https://hbrohei.github.io/NSMRWii/), GPL, only inspiration


### Other open source software bundled with the client
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago), MIT
- [Keyboard (Python library)](https://github.com/boppreh/keyboard), MIT
- [wii-code-tools](https://github.com/RoadrunnerWMC/wii-code-tools/tree/master), MIT
- [Kamek-Ninja-Template](https://github.com/NSMBW-Community/Kamek-Ninja-Template), MIT
- [Wiithon](https://github.com/Demorck/wiithon), MIT
- [Propellerparts](https://github.com/PropelParts-org/PropelParts), MIT, only the binary loader
- [Archipelago fuzzer](https://github.com/Eijebong/Archipelago-fuzzer), MIT
- [Universal tracker](https://github.com/FarisTheAncient/Archipelago), MIT
- [NSMBW headers](https://github.com/PropelParts-org/PropelParts/tree/main/PropelParts/include), licenced under different licences, see each file separately.


The included licenses can be found [here](../dev_files/Licences).
TLDR: NSMBW Client and AP-world are both licenced under MIT with copyright by miiroun.



## Original game
Nintendo

## NSMBW AI Usage Disclosure
- NSMBW is not vibe-coded.
- NSMBW does not contain AI art.
However, generative AI have been used for the following in this project:
1) As a linter (line completer)
2) To help with decompiling source code (unsuccessfully) (~ 10 lines of code, heavily modified by human afterward)
3) Small PR have been made by IndyGibb using Caude, they have been thoroughly reviewed by humans ( ~ 50 lines of code, later modified by human)


## Specific AI-usage
Gemini & ChatGPT 
  - decoding assembly and reading address maps (very minor usage, they are not good at this)

Pycharm linter
  - linter, a line completion tool built into py-charm (extensive usage)

Claude
  - Small PR have been made by IndyGibb using claude, they have been thoroughly reviewed by humans
