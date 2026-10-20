# Mass Effect Legendary Edition 1

**Status: beta test (0.2).** Playable end to end on the Steam release; expect rough edges. Shop slots and the in-game
tracker (journal, galaxy-map markers) are new in 0.2 and not yet confirmed in game.

## What does randomization do to this game?

Shepard starts as a Spectre aboard the Normandy with no squad. Galaxy-map destinations (Eden Prime, Therum, Feros,
Noveria, Virmire, Asteroid X57) stay locked until their coordinates are found. Squadmates are items (Kaidan and Ashley
can instead join at the Citadel as in the original game). Ilos opens once Virmire is done and enough Prothean Beacon
Fragments are collected. Weapons, armor, bio-amps, omni-tools and upgrades from every manufacturer arrive as items,
and their level climbs from I to X over the seed. Credits, omni-gel, medi-gel and grenades are filler.

Decryption locks on containers can be removed, and Wrex always listens to reason on Virmire (Charm and Intimidate are
always available in the standoff).

Quality of life: items sent and received show as notices on the game's HUD (`/notices all`, `important` or `off` in the
client), sprinting never runs out of stamina (option), and the mass relay and FTL travel videos on the galaxy map are
skipped (chosen when installing the mod).

## How do I know where to go?

The client works out your seed's logic as you play and shows it in the game:

- **F7**: a summary box: checks in logic per region, every uncharted planet with checks in logic, and what each locked
  world still needs (for example `Virmire [coords, Kaidan + Ashley]`). Close it with its button or F7.
- Landing somewhere shows how many checks are in logic there, and how many are locked.
- The journal has an **Archipelago** assignment: Beacon Fragments collected / needed, coordinates found, squadmates,
  the Mako, Ilos, and every region that has checks in logic right now.
- The galaxy map marks worlds with "Archipelago: checks in logic" and "Archipelago: locked checks".
- Hints about your items, or pointing at your checks, show on the HUD.

## What is the goal?

Reach Ilos, follow Saren through the Conduit, and defeat Saren and Sovereign on the Citadel.

## Which locations are checks?

- Story milestones and squad recruitment moments.
- Codex pages (codexsanity).
- Journal entries: each quest's first entry and its completion (journalsanity). Completions can be missed by story
  choices, so they only hold filler.
- Containers and Aid Stations (containersanity), optionally once per treasure roll.
- Shop slots (shop_slots, 3 per merchant by default): extra entries in the stock of ten merchants on the Normandy, the
  Citadel, Noveria, Feros and Virmire, a few hundred credits each. Buying one sends its item. While the client is
  connected, each entry shows the item it holds (for example "Link's Hookshot"), and its description says who it is for
  and whether it is progression; otherwise it shows as "Archipelago Item".

Uncharted worlds, derelict freighters and side-assignment transmissions count as available after the Citadel's first
act, with the Mako. Aid Stations cannot be used at full medi-gel: use a medi-gel first to send the check.

Therum and Virmire close for good once finished, so their containers hold filler by default (finished_mission_checks).
A shop fills its stock the first time you open it: connect the client before your first shop visit so it shows the
right number of slots. Commander Rentola only sells on the Normandy for a short while after Virmire, so his slots hold
filler only.
