# Status Lock

## Installation
 - Place the `status_lock.apworld` package in your Archipelago's `custom_worlds/` directory. You can also run it with Archipelago to auto-install.


## Generation:
- Put the yaml in the players folders and generate as you would any other world.
- Generator confirmation: by default, the generator will ask you for confirmation before finalizing; you can disable this with the world option `Ignore Generation Confirmation` or by running on an headless server.

## Playing
- Client usage: the Status Lock client provides the following commands:
	- `/set_password` — Set the admin password for the current connection. Passwords are stored encrypted and will overwrite previous passwords for seeds with the same player list.
	- `/load_keys` — Load stored (encrypted) passwords into the client.
	- `/save` — Save the current encrypted passwords (and their deletions) to persistent storage.
	- `/tray` — Send the client window to the system tray so it can run in the background (OS dependent).
	- `/copy_lines` — (Client helper) Copy client registration lines to paste into the host console (useful when client is not sending automatically or not wanting to put the admin password in).
