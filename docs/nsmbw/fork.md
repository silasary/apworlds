# Forking
This repo is build to be modular, so it should be easy to fork tp support for a mod.
This has not be verified and if you want to support a mod for archipelago it would be nice if you contacted miiroun (miirounn@gmail.com) so we could work on it together to streamline the prossess.
However first you need to verify the mod does not contain any game assets

Howto:
1) Fork the repo on git-hub
2) Renmae the `/nsmbw/` folder to your mod name. (might require code change elsewere, if so contact miiron)
2) Edit Common.py, make sure to at least change the game_name and nsmbw_settings fields
3) Change the logic and level layout in raw_rules
4) If the mods licence allows it then copy the riivlution file into `Riivolution_template`
5) Run the build_apworld script and distribute the apworld.
