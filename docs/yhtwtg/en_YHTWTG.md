# You Have to Win the Game

*What is this game?*

You Have to Win the Game is a free exploration platformer with a retro 1980s PC aesthetic. Run, jump, and avoid deadly pitfalls as you explore the ruins of a lost world in search of hidden treasures and rare artifacts!

*What changed?*

* The map mod has extra platforms and teleporters to prevent softlocking.
* The texture mod replaces all of the pickups with the Archipelago logo.
* Along with the 4 main power-ups, you will need to find each letter to the password at the end of the game.

*What options can I enable to spice things up?*

* Several traps can be shuffled into your multiworld. Some traps can have an adjustable duration.
* Certain points in the game can be arbitrarily locked off.
* You can lock the usage of teleporters behind an item.
* The `Spider Glove` item can be split into left and right variants.
* You can randomize the password that needs to be input at the end of the game.

*Common Questions*

* What makes a check "In Logic"?
    * Logic dictates that you may go through a Point of No Return in order to get a check. ie: You can enter a room but become unable to exit it. Logic should never require a death, but may require warping (see below).

* I'm stuck.
    * Crouch for about 5 seconds. You will be teleported to the starting room.

* No I'm the other kind of stuck where I don't know what to do.
    * Download the Universal Tracker APWorld. The client has an integrated tab that will show you what checks are still in logic.

* Hey your code sucks and I found a bug.
    * This is my first APWorld and I'm kind of winging it. Feel free to tell me about any unintended behavior in the future-game-design thread. Don't hesitate to ping me (@blitzashspear) and I'll try my best to fix it.

* Did you use AI when making this?
    * Yes, AI was utilized during this project. Apart from troubleshooting, two major instances of AI exist. 
    * The first instance is raw data. The game uses an XML file that stores important in the room layout. I used AI to convert that room data into certain dictionaries for easier access.
    * The second instance is in relation to the password tab in the client. I had Copilot generate most things kivy related. 
    * I have personally vetted and understand any code that was not made by me. 
    * Generative AI was not used for images/assets.
    * Any other code is Grade-A organic human slop because I code at 3 in the morning instead of sleeping like a normal person.