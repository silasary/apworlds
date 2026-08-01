# Bitburner

## What does randomization do to this game?

Augmentations become Archipelago items. You receive them from the multiworld instead of buying
them, and they are applied immediately, without an install or reset.

The five port-opener programs also become items. You can still write them yourself and still buy them
from the darkweb — nothing is taken away — but logic assumes you are waiting on the items, so the
number of port openers you have received decides how much of the network the multiworld expects you
to reach. Writing your own simply puts you ahead of logic.

Earning achievements, joining factions, installing backdoors, and buying programs from the darkweb
all send checks.

## What is the goal?

Acquire Source Genesis — destroy BitNode 1 and earn the SF1.1 achievement. This is currently the
only value of the `goal` option.

## Which items can be in another player's world?

All of them. Every augmentation in the pool may be placed in any world in the multiworld.

## What does another world's item look like in Bitburner?

Checks are sent when you earn the corresponding achievement. The item you found is reported by the
Archipelago server, not shown in Bitburner itself.

## What are the checks?

Up to 186, from five sources:

- **68 achievements.** Everything except the secret achievements, the source file achievements for
  other BitNodes, and the challenge-run achievements.
- **70 server backdoors**, one per server in Bitburner's fixed server list.
- **27 faction joins**, for the factions whose join is not already an achievement.
- **11 darkweb purchases**, one per program the darkweb sells. These need the TOR router.
- **10 program creations**, for the programs you can write yourself _and_ buy from the darkweb.

A default seed has 166 of those. The rest belong to content options that are off unless you turn
them on.

Buying and writing a program are separate checks, and both are the *act*, not owning the file — so
being given a program by Archipelago or by an augmentation sends neither. If you already have a
program and want its checks, delete it with `rm <program>.exe`, then buy it and write it. That is
also the only way to get the `DarkscapeNavigator.exe` purchase check if you picked it up from the
Shadowed Walkway.

`NUKE.exe` and `b1t_flum3.exe` have no creation check, even though you can write them. NUKE you
already own, and b1t_flum3 cannot be written until you know about the BitVerse, which does not happen
in a first BitNode 1 run — either would be a check you could not reach. `DarkscapeNavigator.exe` has
no creation check because it has no recipe.

## Content options

Gangs, corporations, Bladeburner, Sleeves, hacknet servers and Stanek's Gift each need a source file
from another BitNode, so a BitNode 1 run cannot reach any of them. Each has an option, off by
default, that adds its checks and any augmentations exclusive to it.

Turn one on only if your run can actually reach that content.

## Current scope

Logic covers open ports, which is what gates the backdoors. It does not yet cover required hacking
skill, money, or faction reputation, so a check can be in logic while still being a long grind
away.

Because program acquisition is not restricted, the port requirements are deliberately conservative:
logic will never expect you to reach a server you cannot, but you can get ahead of it by writing or
buying your own port openers.
