# Pokemon Pinball Setup Guide

## What you need
- Bizhawk https://tasvideos.org/BizHawk/ReleaseHistory#Bizhawk210
- The latest pokemon_pinball.apworld provided in the latest release post


## Installation
Same as every other unsupported Gameboy Color apworld, 
- simply move pokemon_pinball.apworld into the custom_worlds directory in your Archipelago install server
(default path: C:\ProgramData\Archipelago\custom_worlds)
- or simply double click the apworld and it should install itself (Archipelago version 0.5.0 and later)

## Running
1. In the Archipelago launcher push the 'Generate Template Options' button to generate a yaml for your options
2. Like every other apworld, fill out your yaml options and have the host generate the multiworld, the produced zip file should contain a .apkpinball patch file. Receive this .apkpinball patch from the multiworld host.
3. Push the 'Open Patch' button in the launcher and it should ask for a 'Pokemon Pinball (US)' legal ROM dump (MD5 Hash: fbe20570c2e52c937a9395024069ba3c), then select the generated  .apkpinball patch file to produce a .gbc ROM which should auto launch in a bizhawk instance. You should be set otherwise from here just follow the same instructions as any other supported GGameboy Color apworld.

## Troubleshooting
- The windows 7 version of archipelago uses python 3.8 which will not work with this apworld.