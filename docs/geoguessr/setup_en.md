# Geoguessr Archipelago setup

## Table of contents

- [Requirements](#requirements)
- [Setup](#setup)
    - [For players of a session](#for-players-of-a-session)
    - [For hosts only](#for-hosts-only)
        - [Install Archipelago Launcher](#install-archipelago-launcher)
        - [Install Geoguessr's `.apworld`](#install-geoguessrs-apworld)
        - [Gather your player's YAML files](#gather-your-players-yaml-files)
        - [Generate the Archipelago session](#generate-the-archipelago-session)
        - [Host the Archipelago session](#host-the-archipelago-session)
    - [Generating a YAML file](#generating-a-yaml-file)
- [Troubleshooting](#troubleshooting)
    - [The generation of a multiworld does not work](#the-generation-of-a-multiworld-does-not-work)
    - [I got disconnected while playing and my locations weren't validated](#i-got-disconnected-while-playing-and-my-locations-werent-validated)
    - [Connexion isn't working after a while on the same server](#connexion-isnt-working-after-a-while-on-the-same-server)

# Requirements

To play an Archipelago session on Geoguessr, you need access to a **Geoguessr Pro subscription** (to generate solo games).

It is possible to submit challenges manually and to retrieve scores of a free account on them to allow playing if you're not the one generating the game. But this can be tedious, as you will need someone with a pro subscription to generate the challenges along the way.

# Setup

Here are the installation steps for players. For the person hosting (the one which will create the game), see the special steps [here](#for-hosts-only).

## For players of a session

You only have **two things to do** if you are not the host:

- First, install the **client extension** using one of the following links, depending of your browser
    - Firefox: https://addons.mozilla.org/firefox/addon/geoguessr-archipelago-client/
    - Chrome (and variants): https://chromewebstore.google.com/detail/geoguessr-archipelago-cli/hemokppgpfdnfbjkjgifogekkbphkhgg

- Then, you'll have to generate your game's **configuration file** (aka **YAML file**) which will setup your own settings for the game. See [here](#generating-a-yaml-file) for instructions. Send that file to your host for the multi-game generation.

Once installed, click on the **extension icon** to open the *Geoguessr Archipelago* tab.

This tab will be your main hub for playing an Archipelago game on Geoguessr.

We advise you to also put the extension's icon *pinned* into your toolbar.

You may read the **`How to play`** section at the bottom of the tab to see the basics and explanations on how to play, especially if you're not familiar with randomizers or Archipelago.

## For hosts only

### Install Archipelago Launcher

Go on https://github.com/ArchipelagoMW/Archipelago/releases/latest and download your OS's installation files (.exe for Windows) **at the bottom of the page**.

Launch the setup program to install the Archipelago Launcher.

### Install Geoguessr's `.apworld`

Go on https://github.com/remigranotier/geoguessr-archipelago/releases/latest and download our latest release's `.apworld` file.

Once downloaded, double click it to install it. This might take a while (up to a minute).

### Gather your player's YAML files

Archipelago expects **one YAML file per player**. This is the configuration Archipelago will use to generate a playable game regarding each participant's defined settings. To generate YAML files, see [here](#generating-a-yaml-file).

### Generate the Archipelago session

1. Open the Archipelago Launcher. (on Windows, in the Start menu)
2. Search for `Browse Files` and click on `Open`. This will open a File Explorer to your Archipelago directory.
3. Open the ``Players`` directory.
4. Move or copy all your players' YAML files into this folder
5. Go back to the Archipelago Launcher, search for `Generate` and click on `Open`.

If everything went well, you can go back to your Archipelago directory, go to `output` and see a brand new `.zip` file. This is the file you will need to create the game: it contains all the hidden logic of your session.

### Host the Archipelago Session

Once you have your `.zip` file ready, go on [Archipelago's official website](https://archipelago.gg/).

1. Click `Start Playing` on the homepage.
2. Click the link at the bottom that says `host a pre-generated game for you`
3. Upload your `.zip` file.
4. Click on `Create new room`.

With this, you'll eventually see (maybe after a refresh) a link to your Archipelago session (something like `archipelago.gg:33333`). Use this link in the `Geoguessr Archipelago` extension to connect to this session!

## Generating a YAML file

Archipelago describes how YAML files work [here](https://archipelago.gg/tutorial/Archipelago/advanced_settings_en).

You have several options:
- **(recommended)** Use our YAML generator by clicking on **Generate a YAML** on the web extension game tab's footer.
- (requires [Archipelago Launcher](#install-archipelago-launcher)) Use Archipelago Launcher's "Options Creator" by searching for it in the Archipelago Launcher. Select Geoguessr and crawl through the options to choose what you prefer.
- (requires [Archipelago Launcher](#install-archipelago-launcher)) Generate the base template using the launcher's "Generate Template Options" functionality. You can then edit this template with at least your slot name (the "Slot name" is the name of the slot you'll use when connecting to the Archipelago server, so it's basically your player name).

We tried to put default settings as fun as we could, but some tweaking can be done on your side depending on your level and how you felt playing your last games of Archipelago on Geoguessr.

You will also find option presets to quickly setup different session types. These presets are explained more in detail in the browser extension's YAML generator.

## Troubleshooting

### The generation of a multiworld does not work

Make sure to read the error message that shows up when you click on the Generate option in the launcher. It is most likely that your settings are contradictory or too limiting for a generation to be possible.

### I got disconnected while playing and my locations weren't validated

If your game results are not taken into account, you can paste the id of the seed you played (or are still playing) in the extension page. Any medal/5k that wasn't validated will be double-checked.

### Connexion isn't working after a while on the same server

Sometimes the port of your game changes. Go back to the archipelago server URL to fetch the new one and connect using the new port!