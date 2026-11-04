# Stick Ranger Randomizer Setup Guide

Stick Ranger is played on its official page at [dan-ball.jp](https://dan-ball.jp/en/javagame/ranger/). The
Archipelago client is a userscript: the game keeps loading from Dan-Ball, and the script adds the client on top of it.
Stick Ranger is made by ha55ii; nothing of the game is part of the script.

## Required Software

- A desktop browser: Chrome, Edge, Firefox, Safari or Opera.
- The [Tampermonkey](https://www.tampermonkey.net/) browser extension.
- `stick-ranger-archipelago.user.js`, the client, from the
  [latest release](https://github.com/Kryen112/AP_Stick_Ranger/releases/latest).
- To generate a multiworld yourself: `stick_ranger.apworld` from the same release, placed in the `custom_worlds`
  folder of your Archipelago installation.

## Installing the client

1. Install Tampermonkey from your browser's extension store.
2. In Chrome or Edge, open the extensions page (`chrome://extensions` or `edge://extensions`), choose **Details** on
   Tampermonkey and turn on **Allow User Scripts**. Without it the browser doesn't let Tampermonkey run any script.
   Older versions have no such switch; turn on **Developer mode** on the extensions page instead.
3. Open
   [stick-ranger-archipelago.user.js](https://github.com/Kryen112/AP_Stick_Ranger/releases/latest/download/stick-ranger-archipelago.user.js).
   Tampermonkey shows an install page; choose **Install**.
4. Go to [Stick Ranger](https://dan-ball.jp/en/javagame/ranger/). An **Archipelago** window appears over the page.
   Drag it by its title bar; the **–** button folds it away.

Tampermonkey checks for updates of the script by itself. Each new release of the apworld comes with a matching client,
so after an update of the apworld, make sure the script is up to date too: in Tampermonkey's menu, choose **Check for
userscript updates**.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it
should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player
to enjoy an experience customized for their taste, and different players in the same multiworld can all have different
options.

### Where do I get a YAML file?

You can customize your settings by visiting the
[Stick Ranger Player Options Page](/games/Stick%20Ranger/player-options).

That page is only available on a host that has the Stick Ranger apworld installed. Otherwise, take the
`Stick Ranger.yaml` template attached to the
[latest release](https://github.com/Kryen112/AP_Stick_Ranger/releases/latest) and edit it by hand, or generate a fresh
one from your own Archipelago install with **Generate Template Options** in the Launcher.

Put the finished yaml in Archipelago's `Players` folder before you generate.

## Joining a multiworld game

1. Go to [Stick Ranger](https://dan-ball.jp/en/javagame/ranger/).
2. In the Archipelago window, enter the **server**, **port**, **slot name** and **password** (if the room has one),
   and choose **Connect**.
3. The page reloads once, into AP mode: its address now ends in `#ap…`.
4. If this slot has a saved run, choose **Load Game** on the title screen. If not, choose **New Game** and pick your
   team.

With Archipelago installed, there is a shortcut: on the room page, click your slot name. The Archipelago Launcher opens
the game page with the server, port and slot already filled in. **Stick Ranger Client** in the Launcher opens the game
page too.

Type in the bottom of the window to chat with the room. `!hint stage` and `!hint class` ask Archipelago for whatever
the next locked boss gate still needs.

## Your saves

- Your Archipelago run is saved on the Archipelago server, with your slot, and loads wherever you connect to it.
- Your normal Stick Ranger save is never touched. In AP mode the game neither reads nor writes it. Choose
  **Disconnect** to leave AP mode: the page reloads with your normal save.
- To start a run over on the same slot, choose **New Game**. Everything you received comes back at once, except traps:
  each trap hits a slot only once.
- Rankings are off in AP mode, so multiworld runs never reach Dan-Ball's leaderboards.

## Troubleshooting

- **No Archipelago window:** check that Tampermonkey is allowed to run scripts (step 2 of the install), and that the
  script is switched on in Tampermonkey's menu while you are on the game page.
- **Playing on a server on your own computer** (`localhost`): Chrome asks whether dan-ball.jp may connect to your local
  network. Allow it, or the client cannot reach the server.
- **"Stick Ranger has been updated on dan-ball.jp":** the script only runs on the version of the game it was made
  for. When Dan-Ball updates the game, the client stays off until a matching update of the script is out.
- **The seed was made with a newer apworld than the client:** update the script, as described under
  [Installing the client](#installing-the-client).
