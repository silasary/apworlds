# AP Hangman

AP Hangman is a meta-game for the [Archipelago Multiworld Randomizer](https://archipelago.gg/) where you must find all the letters in a secret word randomly selected during multiworld generation. The locations of all letters start out hinted, so it's up to you to make educated guesses as to which letters to pursue. For example, you might not bother to hint for the items that will help you reach the letter `X`... but that may change once you've filled in `E_AMPLE`.

## How does it work?

- For each letter from A-Z, an item is generated and sent out to other games in the multiworld.
- A secret word is selected during multiworld generation. Your goal is to find all of the letters in that word.
- Several locations are generated for each position in the secret word (enough to add up to 26 total).
- Finding a letter that is in the word will collect the rewards for the corresponding position(s). If a letter appears more than once in the word, finding it can get you quite a few checks!
- The custom text client sends out rewards automatically. Just connect to the server and you're good to go.
- You can ask the Hangman client for a status update at any time. This includes your current progress on the secret word as well as a list of the letters that you have and have not found.

## Setup guide

- Download the `hangman.apworld` file and add it to the `custom_worlds` folder of your Archipelago installation
- Download the `hangman.yaml` file and update it with your player name and any other settings you'd like
- Add the YAML to your Archipelago installation's `Players` folder (or send it to whoever is generating the multiworld, along with `hangman.apworld`)
- Generate (or wait for someone else to generate) the multiworld as usual!

## Supported YAML options
- `word`: Use a specific word rather than picking one at random during generation
- All the standard Archipelago options

## How to play
- Open the Archipelago launcher and open the Hangman Client.
- Connect to the server as usual. The client will send out rewards whenever someone finds a letter in the secret word!
- Whenever someone finds a letter (whether it's in the word or not), the client will also print an update with your current progress as well as a list of found and missing letters. Use this information to decide which letters to seek out next.
- In the custom client, you can view your progress at any time with the command `/status`
- In any other text client, you can request a progress update by sending the chat message `@SlotName status`, where `SlotName` is the slot name or alias of the Hangman player.