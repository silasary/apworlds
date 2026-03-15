# AP Tombola

## What Does Randomization do to this Game?
- For each number, an item is generated and sent to the multiworld
- When a number is received, you can mark it in the Card
- Marking enough numbers to complete a "Score" sends out one or more checks

The Scores possible are:
- 2 in any one row of the card (Ambo)
- 3 in any one row of the card (Terno)
- 4 in any one row of the card (Quaterna)
- 1 entire row of the card (Cinquina)
- 2 entire rows of the card (Decina)
- All of the numbers in the card (Tombola)

## What is the Goal of AP Tombola in Archipelago

The goal of AP Tombola is to get a certain amount of Tombola Scored, configurable in the YAML

## What is Required to Play the Game in Archipelago?

The Client, currently available as a Windows Executable, Linux Executable and as a web page on https://arenes214.itch.io/ap-tombola

## Set Up Guide

- Generate a game with AP Tombola and other games in it
- Launch the client and connect to the server
- All of the cards will be shown, and you can start marking numbers received

### Installing the APWorld

- Download and install the latest archipelago release from the archipelago releases page.
- Download aptombola.apworld
- Navigate to your archipelago installation (default on Windows C:\ProgramData\Archipelago).
- Navigate to custom_worlds under your archipelago base folder.
- Move aptombola.apworld into this folder.

### Generating a game

- Generate the AP Tombola YAML file
- Edit the file to have your desired settings.
- Navigate to your archipelago installation (default C:\ProgramData\Archipelago).
- Navigate to \players under your archipelago base folder.
- Move the YAML into this folder, as well as YAMLs for other games, as needed.
- Navigate back to your archipelago base folder and run ArchipelagoGenerate.exe
- Your generated game will be in the \output folder under the archipelago base folder.

### Joining a multiworld:

- Navigate to https://arenes214.itch.io/ap-tombola or download the Windows/Linux client from the releases tab
- Launch the game
- Connect to the room via the room URL.

