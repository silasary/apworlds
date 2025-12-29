# DORONKO WANKO Multiworld Setup Guide

## Required Software

- DORONKO WANKO: [Steam](https://store.steampowered.com/app/2512840/DORONKO_WANKO/)
- DORONKO WANKO Archipelago: [GitHub](https://github.com/Vendily/DoronkoWankoArchipelago)


## Installation

Follow the instructions in the README of the DORONKO WANKO Archipelago GitHub.

## Connecting

1. Before launching the game, edit the `AP.json` file in the root of the Celeste 64 install.

2. For the `Url` field, enter the address of the server, such as `archipelago.gg:38281`. Your server host should be able to tell you this.

3. For the `SlotName` field, enter your "name" field from the yaml or website config.

4. For the `Password` field, enter the server password if one exists; otherwise leave this field blank.

5. Save the file, and run DORONKO WANKO. You should connect to the room upon selecting `New Game` or `Continue`

An Example `AP.json` file:

```
{
	"Url": "archipelago.gg:12345",
	"SlotName": "Pome",
	"Password": ""
}
```
