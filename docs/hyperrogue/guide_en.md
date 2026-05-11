# Hyperrogue Setup Guide

## Required Software
- Archipelago Version of Hyperrogue from: [Hyperrogue Archipelago Github Page](https://github.com/RealMelwei/hyperrogue_experimental_fork/)

## Installation Procedure (Linux)

Clone/Download the repository to your machine and follow the build instructions at the bottom of the README.md file / at the bottom of the github page.

## Joining a MultiWorld Game

1. Before launching the game, edit the `ap_settings.json` file in the root of the Archipelago Hyperrogue install.

2. For the `ip` field, enter the address of the server, such as `archipelago.gg:38281`. Your server host should be able to tell you this.

3. For the `slotname` field, enter your "name" field from the yaml or website config.

4. For the `password` field, enter the server password if one exists; otherwise leave this field blank.

5. Save the file, and run Hyperrogue. If you can continue past the title screen, then you are successfully connected.

An Example `AP.json` file:

```
{
	"ip": "archipelago.gg:12345",
	"slotname": "max",
	"password": ""
}
```
