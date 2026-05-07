# Bomberman Hero Setup Guide

## What you need
- Bizhawk https://tasvideos.org/BizHawk/ReleaseHistory#Bizhawk210
- The latest Bomberman Hero .apworld provided in the latest release post
https://discord.com/channels/731205301247803413/1330612852867858505/1330734687798300764


## Installation
Same as every other unsupported N64 apworld, 
- simply move bomberman_hero.apworld into the custom_worlds directory in your Archipelago install server
(default path: C:\ProgramData\Archipelago\custom_worlds)
- or simply double click the apworld and it should install itself (Archipelago version 0.5.0 and later)

## Running
1. In the Archipelago launcher push the 'Generate Template Options' button to generate a yaml for your options
2. Like every other apworld, fill out your yaml options and have the host generate the multiworld, the produced zip file should contain a .apbombh patch file. Recieve this .apbombh patch from the multiworld host.
3. Push the 'Open Patch' button in the launcher and it should ask for a 'Bomberman Hero (US)' legal ROM dump (MD5 Hash: ef2453bff7ad0c4bfa9ab0bd6324ebf3), then select the generated  .apbombh patch file to produce a .z64 ROM which should auto launch in a bizhawk instance. You should be set otherwise from here just follow the same instructions as any other supported N64 apworld.