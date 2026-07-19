# Super Smash Bros. 64 Setup Guide

1. Generate with the Super Smash Bros. 64 YAML.
2. Open the generated `.apsmash64` patch with ArchipelagoLauncher.
3. When prompted, select the USA `.z64` ROM with MD5 `f7c52568a31aadf26e14dc2b6416b2ed`.
4. Load the patched `.z64` in BizHawk, open the Lua Console, and run `data/lua/connector_bizhawk_generic.lua`.
5. Connect the BizHawk Client to your Archipelago room.


Important: if installing manually, the apworld file must be named `smash64.apworld` so its filename matches the internal `smash64` package folder. Using a renamed file such as `smash64_fixed.apworld` can prevent Archipelago from loading the world and registering `.apsmash64` patches.

## ROM formats

This apworld accepts a USA Super Smash Bros. 64 ROM in `.z64`, `.n64`, or `.v64` byte order. The patched output is always written as `.z64`, so load the generated `.z64` in BizHawk.
