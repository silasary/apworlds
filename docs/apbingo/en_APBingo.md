# AP Bingo!!

## What Does Randomization do to this Game?
- For each bingo square an item is generated and sent out to the multiworld
- If a bingo square is found, it's marked off on your bingo sheet
- Getting the right squares for a bingo sends out checks!

## What is the Goal of APBingo in Archipelago

The goal of APBingo is to get a certain amount of Bingos, as set in your YAML

## What is Required to Play the Game in Archipelago?

The APWorld itself, and one of the available Web Clients.

## Set Up Guide

- Install the APWorld
- Open one of the available Web Clients

## What are special bingos?

- Blackout is all squares
- Corners is all four Corners
- Pictureframe is all edge squares
- Checkerboard is every second square, starting from the first
- Reverse Checkerboard is every second square, starting from the second

## What do minigames do?

If the user has turned minigames on in the yaml options, when the timer at the top is finished, completing any of the minigames with the goal score/time will award a free hint scout! 
Revealing one of the items that are behind bingo's.

## What does death link in Bingo do?

If the user has minigames on, dying while the timer is ready will send a death link. Receiving a death link will cause a death within the minigames.

### Installing the APWorld

- Download and install the latest archipelago release from the archipelago releases page.
- Download APBingo.apworld
- Navigate to your archipelago installation (default C:\ProgramData\Archipelago).
- Navigate to custom_worlds under your archipelago base folder.
- Move APBingo.apworld into this folder.

### Generating a game

- Download or generate the APBingo YAML file
- Edit the file to have your desired settings.
- Navigate to your archipelago installation (default C:\ProgramData\Archipelago).
- Navigate to \players under your archipelago base folder.
- Move the yaml into this folder.
- Navigate back to your archipelago base folder and run ArchipelagoGenerate.exe
- Your generated game will be in the \output folder under the archipelago base folder.

### Joining a multiworld:

- Navigate to your archipelago base folder (default C:\ProgramData\Archipelago).
- Open your Web Client of choice
- Connect to the room via the AP panel at the top left

