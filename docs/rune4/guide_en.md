# GAMENAME Setup Guide

## What you need
- Bizhawk https://tasvideos.org/BizHawk/ReleaseHistory#Bizhawk210
- The latest APNAME.apworld provided in the latest release post


## Installation
Same as every other unsupported GAMESYSTEM apworld, 
- simply move APNAME.apworld into the custom_worlds directory in your Archipelago install server
(default path: C:\ProgramData\Archipelago\custom_worlds)
- or simply double click the apworld and it should install itself (Archipelago version 0.5.0 and later)

## Running
1. In the Archipelago launcher push the 'Generate Template Options' button to generate a yaml for your options
2. Like every other apworld, fill out your yaml options and have the host generate the multiworld, the produced zip file should contain a .PATCHEXT patch file. Receive this .PATCHEXT patch from the multiworld host.
3. Push the 'Open Patch' button in the launcher and it should ask for a 'GAMENAME (US)' legal ROM dump (MD5 Hash: HASH), then select the generated  .PATCHEXT patch file to produce a .GAMEEXT ROM which should auto launch in a bizhawk instance. You should be set otherwise from here just follow the same instructions as any other supported GAMESYSTEM apworld.

## Troubleshooting
- The windows 7 version of archipelago uses python 3.8 which will not work with this apworld.