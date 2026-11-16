# Pac-Man World 2 Archipelago

## What does randomization do to this game?
- Locks the ability to play levels with the `Progressive Level` item.
- If you do not have enough `Progressive Level`s, the client will send a warning log and prevent you from sending out checks.

## What is the goal of Pac-Man World 2 when randomized?
- Beat the final level depending on the `total_levels` setting.

## Which items can be in another player's world?
- `Progressive Level` to unlock the next level
- `Token` is a mcguffin. You need to collect however many you set the `token_goal` yaml setting to.

## What are the locations in Pac-Man World 2?
- By default, every fruit and level completion are locations.
- You can enable time trials, tokens, or pac-dots for extra locations.

## When the player receives an item, what happens?
- If it is a `Progressive Level`, the client will check if you have enough to play the next level and will allow you to send checks out for the next location.
- If it is a `Token`, the client will update and once you reach enough tokens, you can send out checks on the final level.

## Notes and Limitations
- There is 1 initial warning log about progressive levels when opening the game due to how the game is structured.

## Credits
- [Armored Core 3](https://github.com/Aleksandylmao/Armored-Core-3-PCSX2-Archipelago/). A lot of the client code was copied from it.
- [pypine](https://github.com/evilwb/pypine/) for making the client implementation possible.
- [Ghidra](https://github.com/NationalSecurityAgency/ghidra) with this [PS2 plugin](https://github.com/chaoticgd/ghidra-emotionengine-reloaded) to help me decompile the game
- [Retro Achievements](https://retroachievements.org/codenotes.php?g=19097) provided a lot of addresses as a baseline

## AI Usage Disclosure
![No AI Usage](https://res.cloudinary.com/dtz0urit6/image/upload/q_auto:best,f_jpg/cloudinary-tools-uploads/gqok2sm1gxarvoip5x0z)