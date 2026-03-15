# Final Fantasy X Setup Guide

## Required Software
* A copy of [Final Fantasy X/X-2 on PC](https://store.steampowered.com/app/359870/FINAL_FANTASY_XX2_HD_Remaster/)
* An installation of [Archipelago](https://archipelago.gg/tutorial/Archipelago/setup_en)
* The latest [.NET Runtime 10](https://dotnet.microsoft.com/en-us/download/dotnet/10.0), Windows x86 (x64 is optional).
* _Both_ Microsoft Visual C++ Redistributable [x86](https://aka.ms/vs/17/release/vc_redist.x86.exe) and [x64](https://aka.ms/vs/17/release/vc_redist.x64.exe)
* 4GB Patch (Reduces Crashing) - https://ntcore.com/4gb-patch/ 
* _Retrieve the Archipelago Mod and the APWorld from the #releases forum in the Discord server._
* The latest Archipelago version of the [Cutscene Remover](https://github.com/FFX-AP/FFXCSRRando/releases/latest)
* Check out the [FFX Poptracker Pack](https://github.com/FFX-AP/FFX-Poptracker/releases) which uses the [Poptracker](https://poptracker.github.io/) software.

<!---APWorld setup instructions unnecessary in archipelago markdown context-->

## Fahrenheit Setup

1. Go to your installation path for Final Fantasy X&X-2 HD Remaster (By default `C:\Program Files (x86)\Steam\steamapps\common\FINAL FANTASY FFX&FFX-2 HD Remaster`)
2. Paste the 4GB Patch file and run it, selecting the “FFX” application file to patch it.
3. Unzip the _fahrenheit.zip_ file, open the resulting folder, and drag the folder inside named "fahrenehit" to where FFX.exe is (By default `C:\Program Files (x86)\Steam\steamapps\common\FINAL FANTASY FFX&FFX-2 HD Remaster`)
4. Create a seed, finishing the steps in [APWorld Setup](https://github.com/FFX-AP/Archipelago-FFX-Client/wiki/2-APWorld-Setup)
5. Navigate to C:\ProgramData\Archipelago\output and unzip the generated zip file. 
   - Move the contained .apffx file with your chosen slot name to `C:\Program Files (x86)\Steam\steamapps\common\FINAL FANTASY FFX&FFX-2 HD Remaster\fahrenheit\mods\archipelago-ffx\resources\seeds`<br>(Example: AP_42748106456788000549.zip and AP_42748106456788000549_P1_Peepen.apffx)
   - If someone else generated, they need to give you the apffx file corresponding to your slot.
6. Double Click the start_game.bat file to open the game
   - Optional: Download the CSR from github or the discord, and make sure it's the modified one that Omnises released.
   - Regular CSR/SpeedrunMod is incompatible.
   - Start CSR after launching the game.
7. Press F8 to open the built-in client on the Title Screen and select the seed (which has the name of the apffx file).
8. Connect the client to the server.
   1. Fill out the Name field EXACTLY how it appears on your YAML file.
   2. Fill the Address field which will either be "localhost" if you are hosting, or the server address listed in the Archipelago lobby if hosting through Archipelago.
   3. Finally, a password (if applicable)
   4. Press connect!
9. Start a new game!

## Commands and Shortcuts

### Client Commands
- `/help` shows you what commands you can perform.
- `/send_checks` sends what the client believes it has collected to the server.
- `/clear` sets the client back to how it is when launched.
- `/resetregion` sets the region back to the initial visit, vital for if any missable checks were missed.
### Shortcuts
`F8`: Toggle ImGUI Window<br>
`Select + R1`: Reset Party<br>
`L1 + R1 + Start:` Soft Reset (Using in Battle will Game Over)<br>

## Notes

* Sometimes crashes occur, or autosaves place you into a softlock. Manually save often!
* Open CSR _after_ opening the game.
* Blocked all travel directly between Regions. Trying to enter another region will now either lead to the Airship menu or simply turn you around
* Airship Codes have been disabled.
* If you unlock Seymour, he will only be available in battle and not in the party menu.
* Succeeding the Jecht Shot scene with CSR will crash the game.
* If you reset a region and go through it again, consider closing and reopening CSR so it will trigger properly.

## Troubleshooting
<!-- TODO: solutions to common issues people have setting the rando up -->
