# Bitburner Setup Guide

## Required Software

- A build of Bitburner containing the Archipelago client module.
- Archipelago, to generate a seed and host the room.

## Configuring your YAML

Generate a template YAML from the Archipelago Launcher ("Generate Template Options"), or write one
by hand. The only Bitburner-specific option is `goal`:

```yaml
Bitburner:
  goal: source_genesis

  # Content that needs a source file from another BitNode. Leave these off for a BitNode 1 run,
  # or you will have checks you cannot reach.
  gangs: false
  corporations: false
  bladeburner: false
  sleeves: false
  hacknet_servers: false
  staneks_gift: false
```

`source_genesis` requires destroying BitNode 1 to earn the SF1.1 achievement. It is currently the
only goal.

## Connecting

1. Start Bitburner and load the save you want to play.
2. Open `Options` -> `Archipelago`.
3. Fill in the server address, port, slot name, and password (leave the password blank if the room
   has none), then enable the connection.
4. The character overview shows the connection status. Once it reports connected, checks you earn
   are sent automatically and items sent to you are applied as you receive them.

The client reconnects on its own if the connection drops, and re-sends any checks you earned while
disconnected the next time it connects.

## Checks

Checks come from Bitburner achievements, backdoors on each of the game's fixed servers, joining
factions, and buying programs from the darkweb. Earning, backdooring, joining or buying sends the
check automatically.

The port-opener programs arrive as items, but nothing stops you writing them or buying them yourself.
A server needs as many open ports as it demands before you can NUKE and then backdoor it, so if you
wait on the multiworld you will early on only reach the servers requiring no ports.

Buying a program from the darkweb is its own check, separate from owning the program. If Archipelago
or an augmentation already gave you one, `rm <program>.exe` and buy it to get the check.

You do not need to be connected at the time. The client sweeps game state every few seconds and
records what you have satisfied into your save, then sends anything outstanding the next time it
connects. This matters most for backdoors, which are wiped whenever you install augmentations —
recording them as they happen is what stops a check earned offline from being lost at your next
install.
