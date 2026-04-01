# GoldenEye 007 Setup Guide

## What You Need

- Archipelago `0.6.6` or newer
- BizHawk
- Archipelago BizHawk Client
- GoldenEye 007 AP world installed as a custom world
- A compatible patched GoldenEye 007 ROM

## Install the AP World

1. Place the packaged `goldeneye.apworld` into Archipelago's `custom_worlds` folder.
2. Restart Archipelago tools if they were already open. I still fuck this up all the time, you actually have to completely close everything AP if you install a new apworld.

## Generate a Seed

1. Open your YAML template.
2. Configure your GoldenEye options.
3. Generate normally through Archipelago.
4. Do death_link unless you're a big baby.

## BizHawk Setup

1. Open the patched GoldenEye ROM in BizHawk.
2. Load `goldeneye_ap_randomizer.lua`.

## Connect to Archipelago

1. Start the Archipelago BizHawk Client.
2. Connect it to your server.
3. Join using your GoldenEye slot name.

## Troubleshooting

- If the client does not connect, make sure `goldeneye_ap_randomizer.lua` and `connector_bizhawk_generic.lua` are in the same folder.
- If generation fails, refresh the CSV exports and rerun `test_build/codegen.py`.
- If the world does not appear in Archipelago, confirm the `.apworld` is in `custom_worlds` and that `archipelago.json` is present inside the package.
