# Half-Life (Sven Co-op) Setup Guide

## Please read first: this is a multiplayer game

Sven Co-op is a multiplayer game, and its version of the Half-Life campaign is
built to be played co-operatively. Some of what it asks of you, such as needing
more than one player at a campaign portal console, is there on purpose to keep it
that way.

This randomizer is made for co-op lobbies. We do not endorse using it, or any
convenience it adds, to work around Sven Co-op's multiplayer design or to treat
the campaign as a free single-player Half-Life. Play it with other people. If you
want Half-Life on its own, buy Half-Life.

## Requirements

- Sven Co-op (free on Steam). The Half-Life campaign maps ship with it — there is
  nothing extra to download.
- Archipelago 0.6.7 or newer.
- The `half_life_sven.apworld` file.

## Install

1. Put `half_life_sven.apworld` in your Archipelago `custom_worlds` folder.
2. Open the Archipelago Launcher and start **Half-Life (Sven Co-op) Client**.
3. The first time it runs, a folder picker asks for your Sven Co-op folder (the
   one containing `svencoop`). It remembers the answer in your `host.yaml`, so it
   only asks once:

   ```yaml
   half_life_sven_settings:
     game_folder: F:/SteamLibrary/steamapps/common/Sven Co-op
   ```

   You can edit that by hand instead of using the picker if you prefer.
4. Type `/install` in the client. That copies the AngelScript plugin into your
   game and registers it in `svencoop/default_plugins.txt`.

`/uninstall` removes it again, and leaves nothing behind: the scripts, the bridge
directory and the backup of your `default_plugins.txt` all go.

If you would rather do it by hand, the plugin tree is inside the apworld at
`half_life_sven/plugin/plugins/`, which mirrors `svencoop/scripts/`. Copy it
across and add this block to `svencoop/default_plugins.txt` yourself:

```
"plugin"
{
    "name" "Archipelago"
    "script" "archipelago/ap_main"
}
```

## Play

1. Generate and host a multiworld containing your Half-Life (Sven Co-op) slot.
2. Start Sven Co-op and create a **listen server** (New Game) on the map
   `-sp_campaign_portal`. This is the Sven Co-op campaign portal, and it is your
   hub. Plugins only run on servers, so joining someone else's server means
   *their* machine needs the plugin and the client.
3. Connect the client to the room.

You should see `[AP] Connected to the multiworld.` in the game chat.

## Universal Tracker

If you have the [Universal Tracker](https://archipelago.miraheze.org/wiki/Universal_Tracker)
apworld installed, this client grows a **Tracker** tab showing which locations
are in logic right now. Nothing to configure: the client uses Universal Tracker's
window when it finds it and its own when it does not.

Two of this world's decisions are rolled at generation rather than derived from
your YAML — which mission each campaign opens with, and what the run starts you
holding — so the world hands the real seed's answers back to the tracker rather
than letting it roll its own. Without that its view would drift from the server's
by a whole starting mission.

## Client commands

| Command | Effect |
| --- | --- |
| `/install` | install the plugin into the selected game folder |
| `/uninstall` | remove the plugin, its scripts and its bridge files |
| `/gamedir` | reopen the folder picker to change installs |
| `/gamedir <path>` | set the folder directly, without the picker |
| `/where` | show the game folder, bridge path and plugin status |
| `/commands` | list the chat commands you type inside the game |
| `/missions` | show mission unlock status |
| `/deathlink` | toggle DeathLink |
| `/amnesty <n>` | show or change the DeathLink amnesty for this session |

## Campaigns

Sven Co-op ships four single-player conversions and the campaign portal fronts
all of them. Each is a YAML toggle:

| Option | Campaign | Missions | Finale |
| --- | --- | --- | --- |
| `include_half_life` | Half-Life | 18 | Nihilanth |
| `include_opposing_force` | Opposing Force | 13 | Worlds Collide |
| `include_blue_shift` | Blue Shift | 7 | Power Struggle |
| `include_they_hunger` | They Hunger | 3 | Episode 3 |

Only Half-Life is on by default, so a YAML written before this existed generates
exactly the seed it always did. Switch every campaign off and Half-Life comes
back on regardless, because a seed has to contain something.

### What each campaign needs installed

Everything runs on the **host's** machine: the plugin and these maps have to be
on the server, not on the people joining it. A campaign whose maps are missing
will fail the moment someone warps into it, so check before you generate.

| Campaign | Missions | Maps it needs | Check for |
| --- | --- | --- | --- |
| Half-Life | 18 | `hl_c00` … `hl_c18` | `svencoop/maps/hl_c00.bsp` |
| Opposing Force | 12 | `of0a0` … `of6a4b` | `svencoop/maps/of0a0.bsp` |
| Blue Shift | 7 | `ba_tram1` … `ba_outro` | `svencoop/maps/ba_tram1.bsp` |
| They Hunger | 3 | `th_ep1_00` … `th_ep3_07` | `svencoop/maps/th_ep1_00.bsp` |

**Some missions have no hub console and are reached by `!warp` alone.** No
campaign has a panel for its intro, and Opposing Force has two more gaps besides:

| Mission | Campaign | Reach it with | Intro? |
| --- | --- | --- | --- |
| Black Mesa Inbound | Half-Life | `!warp 0` | yes |
| Boot Camp | Opposing Force | `!warp 18` | no, the training course |
| Incoming | Opposing Force | `!warp 19` | yes |
| Crush Depth | Opposing Force | `!warp 25` | no |
| Living Quarters Outbound | Blue Shift | `!warp 31` | yes |

Opposing Force's panels run 01-05 and 07-11 with no sixth — that gap is Crush
Depth. `exclude_intro_missions` drops the three intros and leaves Boot Camp and
Crush Depth in, console-less, reached by `!warp`.

The campaign portal can also have whole areas switched off by the server, which
looks identical to a missing campaign from in-game. If a campaign's consoles are
sealed, check these in your `server.cfg`:

```
as_command spcp_hlsp 1
as_command spcp_opfor 1
as_command spcp_bshift 1
as_command spcp_theyhunger 1
```

Enabling more than one changes the run in three ways:

- **Every campaign hands you one of its own missions at the start.** Four
  campaigns means four missions open from the first spawn, not one.
- **Every campaign's finale is a goal.** The seed is won when all of them are
  done, and the client says how many are left as each falls.
- **Weapons go into one shared pool.** Opposing Force's displacer, sniper rifle,
  SAW and spore launcher turn up in Black Mesa, and Half-Life's crossbow and Tau
  cannon turn up in theirs. Blue Shift brings no weapons of its own, so it gains
  the most from having company.

**They Hunger's weapons are the exception.** Its tommy gun, tesla gun, spanner
and the rest are not weapons Sven Co-op ships: they are custom entities its own
maps register, so they only exist while you are playing They Hunger. They still
shuffle inside the seed, but the game will only hand one over once you are in a
They Hunger map. Receive a tesla gun while you are in Black Mesa and it is
waiting for you the moment you warp to an episode. Nothing is lost, and nothing
in Half-Life's or Opposing Force's logic ever expects one.

**They Hunger also reskins the weapons it borrows**, so a few checks are named
for what you see rather than what the engine calls it. The crowbar is an
umbrella, the pipe wrench is a shovel, and hand grenades are sticks of TNT. They
are the same items as everywhere else — send someone the Pipe Wrench and they
swing a shovel in Episode 1 and a wrench in Black Mesa.

**Missions Required is per campaign and the settings are independent.**
`missions_required` is Half-Life's and opens Nihilanth;
`opposing_force_missions_required`, `blue_shift_missions_required` and
`they_hunger_missions_required` do the same for theirs. Finishing Opposing Force
missions does nothing for Nihilanth.

They Hunger is the thin one. Under strict logic its Episode 1 is enterable with a
melee weapon and Episodes 2 and 3 expect a gun, its own or one that travels; its
check placement has had no pass yet, and with three chargers in the whole
campaign almost all of its checks come from reaching maps.

## Playing the randomizer

You start with the crowbar, the medkit, and **one random mission unlock per
campaign in the seed**.

**`random_starting_weapon`** swaps the crowbar for a random melee weapon from the
campaigns you enabled: Opposing Force's pipe wrench or combat knife, They
Hunger's spanner, or the crowbar anyway. With only Half-Life or Blue Shift on
there is nothing else to pick and the setting changes nothing.

Whatever it lands on replaces the crowbar rather than joining it. Crowbars are
then refused for the rest of the run the way any ungranted weapon is, and if the
weapon it chose was an item, that item leaves the pool — nobody is going to send
you a wrench you are already holding. The medkit is yours either way.

Walk up to a chapter's console in the portal room and press either button. The
plugin rewires the consoles: one press travels to that mission if you have its
unlock, or tells you it is locked.

There is no console for Black Mesa Inbound — the portal map does not have one.
`!warp 0` is the only way to reach mission 0. If you would rather not have a
mission that can only be reached by typing a command, set
`include_black_mesa_inbound: false` in your YAML and it is left out of the seed
entirely, along with its checks and its unlock item.

Chat commands (press `Y` in game, not the console):

| Command | Effect |
| --- | --- |
| `!help` | list these commands |
| `!ap` | list every mission and its status, printed to your console (`~`) |
| `!tracker` | every location in the seed, by map, found or not, to your console |
| `!tracker <text>` | just the maps or missions matching that, e.g. `!tracker hl_c03` or `!tracker office` |
| `!find` | point you at the nearest check on this map you have not found |
| `!find <text>` | point you at a check by name, e.g. `!find hev charger 3` |
| `!warp <number or name>` | travel to an unlocked mission |
| `!warp <name>` | the same by name, e.g. `!warp office` |
| `!warp <name> <part>` | back to one part of it, e.g. `!warp surface tension 3` |
| `!warp <map>` | the same by map name, e.g. `!warp hl_c11_a3` |
| `!hub` | return to the campaign portal |

Every one of these also works **in the console** (`~`), which saves opening chat
and losing mouse look just to ask where a charger is.

**Mind the leading dot.** Sven Co-op namespaces a plugin's console commands, and
with no namespace set the separator dot is still there — so it is `.ap`, not
`ap`. The server prints the exact list at load:

```
[AP] console commands ready (6): .ap, .ap_tracker, .ap_find, .ap_warp, .ap_hub, .ap_help
```

| Chat | Console |
| --- | --- |
| `!ap` | `.ap` |
| `!tracker [text]` | `.ap_tracker [text]` |
| `!find [text]` | `.ap_find [text]` |
| `!warp <number or name>` | `.ap_warp <number or name>` |
| `!hub` | `.ap_hub` |
| `!help` | `.ap_help` |

The `!` versions are chat commands: they only work typed into chat (`Y`), not
into the console. The `.` versions are the reverse.

Console output from `ap` and `ap_tracker` lands in the console you are already
looking at, which is the main reason to prefer them.

**Going back for a check you missed.** `!find` names the part a check is in and
prints the exact command to get there, and `!warp` will drop you straight into
that part rather than at the start of the mission. Only parts you have already
reached: the mission has to be unlocked *and* you have to have stood in that part
before, so this is for going back, never for skipping ahead.

`!warp` numbers run across all campaigns: 0-17 Half-Life, 18-27 Opposing Force,
28-33 Blue Shift, 34-36 They Hunger. Half-Life's are unchanged, and `!ap` prints
the numbers grouped by campaign.

`!tracker` only lists checks the seed actually contains, so `chargesanity: false`
means no charger lines rather than two hundred that can never be ticked.

The client also prints this list when it connects.

Finishing a mission sends you back to the hub automatically and sends its
completion check. Trying to enter a locked mission is refused.

**Weapons are items.** A weapon lying in the world still sends its check the first
time you walk over it — anywhere in the campaign, and whether or not you are
allowed to keep it. You cannot hold it until the multiworld gives you that weapon.
The campaign's own per-map loadouts are stripped for the same reason.

**Chargers are checks.** Every health charger and HEV charge panel sends a check
the first time someone presses use on it, even an empty one. That is 107 of
Half-Life's 173 locations, and 143 of the 353 across all four campaigns;
`chargesanity: false` in your YAML removes them all for a much shorter run. The
other campaigns have far fewer: 23 in Opposing Force, 12 in Blue Shift, 3 in the
whole of They Hunger.

**The HEV suit is armour, not the suit.** With `shuffle_hev_suit: true` you keep
the suit and its HUD from the start — you would not be able to switch weapons
without it — but your armour is held at zero until the HEV Suit item arrives.
Batteries, wall chargers and Armor Battery filler all do nothing until then, and
the game says so in chat when the item lands.

**The long jump module is switched on, not handed over.** With
`shuffle_longjump: true` you cannot long jump until the item arrives, however
many modules the campaign puts in front of you. With it off the module is left to
Half-Life entirely: nothing early, and you get it where the campaign gives it, in
Forget About Freeman and everything after.

That is the one place the two pieces of optional equipment differ. An unshuffled
HEV suit is granted from the start, because the item is the only thing that ever
turns armour on and nothing in the campaign would.

**A finale is not unlocked by an item.** Each campaign's last mission opens once
you have completed that campaign's own `missions_required` count, set in your
YAML and defaulting to all of them. Every finale in the seed has to be cleared to
win it.

**Blue Shift seals two missions, not one.** A Leap Of Faith is the escape
cutscene at the end of Power Struggle rather than a mission of its own, so the
two are one ending and neither has an unlock item: the count opens Power
Struggle, and clearing Power Struggle opens A Leap Of Faith behind it. That
leaves five Blue Shift missions the count can ask for.

## DeathLink

Any death gibs the entire Sven Co-op lobby, and if DeathLink is on it is also
sent to the multiworld. A DeathLink arriving from another world gibs everyone in
the lobby too. Toggle it live with `/deathlink` in the client.

**Amnesty.** `death_link_amnesty` in your YAML (default 4) is how many deaths the
lobby is forgiven before one is reported to the multiworld. It only affects
deaths going *out*: inside Sven Co-op the lobby still gibs every time, and the
death message says how much is left ("Amnesty remaining: 3"). When the allowance
runs out the next death goes to the multiworld and the allowance starts again.
The countdown is shared by everyone in the lobby, survives map changes, and can
be changed for the session with `/amnesty <n>`. Set it to 0 to send every death.

## Troubleshooting

**Nothing happens / no `[AP]` messages.** The plugin is not loading. Check the
server console for `[AP] loaded 18 chapters, 174 locations` at map start. If it
is missing, `default_plugins.txt` is wrong or the scripts were not copied.

**`[AP] FATAL: could not open .../checkdata.txt`.** `scripts/plugins/store/archipelago/checkdata.txt`
did not get copied. Rerun the installer.

**Client connects but the game never reacts.** `/gamedir` is pointing at the
wrong install. The client prints the bridge path it is using; check that
`ap_in.txt` is appearing there.

**You keep the weapons you pick up.** The plugin is not running, or that
classname is not in `checkdata.txt`. Only the classnames listed as `K` records
are gated.
