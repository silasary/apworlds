# Crash Team Racing Setup Guide

Crash Team Racing runs as a native PC port with the Archipelago client built in.
It does not use an emulator or a ROM patch. The detailed and actively maintained
client walkthrough is the
[CTR Archipelago setup guide](https://github.com/dowlle/ctr-native-ap/blob/main/SETUP.md).

<!-- The native repository's SETUP.md is the canonical client guide. Keep this
page focused on Archipelago generation and do not duplicate its troubleshooting
or platform instructions here. -->

## What you need

- The release archive for your platform from the
  [CTR Archipelago releases page](https://github.com/dowlle/ctr-native-ap/releases):
  the Windows `.zip`, or the Linux and Steam Deck `.tar.gz`.
- Your own NTSC-U (North American) Crash Team Racing disc image. The client
  ships no game data. A raw MODE2/2352 `.bin` can be used directly; `.chd`
  images use the optional extractor described in the canonical setup guide.
- Your server address, slot name, and room password, if it has one.
- The matching `ctr.apworld` and a CTR YAML file if you are generating or
  hosting the multiworld yourself.

Only the person generating the room needs Archipelago installed locally and the
`ctr.apworld`. Players joining an existing room need the client, their game
image, and the room details.

## Generating a CTR multiworld

Download `ctr.apworld` from the same release as the client. Install it by
double-clicking it or placing it in the `custom_worlds` folder of your
Archipelago installation.

Open the Archipelago Launcher, choose **Generate Template Options**, and select
Crash Team Racing. Set your player name and options in the generated YAML, then
add it to the room's player files. Every available setting and value is
documented in that template.

The released client and apworld are a pair. Update both together, even when a
release appears to change only one side.

The defaults provide the full randomizer experience: randomized warp-pad
requirements and destinations, shuffled Gems, Gem Cups, and a small share of
trap items.

## Setting up the client

Follow the
[canonical client setup guide](https://github.com/dowlle/ctr-native-ap/blob/main/SETUP.md)
to extract the release archive, add your disc image, connect from **OPTIONS →
Connection**, configure controllers or Steam Input, and troubleshoot platform or
disc-image errors.

Once the status says **Connected**, start Adventure mode. The canonical guide's
“Your first five minutes” section explains checks, received items, traps, saving,
the seed warning, and the current disconnect limitation.

## Getting help

Report reproducible bugs and stuck seeds on the
[CTR Archipelago issue tracker](https://github.com/dowlle/ctr-native-ap/issues).
The native guide explains how to create a privacy-scrubbed support bundle. New to
Archipelago itself? Start with the [Archipelago tutorials](https://archipelago.gg/tutorial/).
