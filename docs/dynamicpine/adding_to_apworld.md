# Adding Dynamic Pine to your apworld

Two touch points, both optional-dependency safe — Dynamic Pine may not be
installed, so every import is guarded and every call checked for `None`/
`ImportError` first.

## 1. Declare support on your World

This is how the hub discovers your game and builds its tab/commands for it:

```python
try:
    from worlds.dynamicpine import DynamicPineGame
except ImportError:
    DynamicPineGame = None


class MyPS2World(World):
    game = "My PS2 Game"
    ...
    if DynamicPineGame:
        dynamic_pine = DynamicPineGame(
            game_ids="SCUS-97615",             # serial as PCSX2/PINE reports it
            client_component="My Game Client", # your Component's display_name
            # memcard_name="memcard.ps2",      # optional
            # ini_overrides={"EmuCore": {"EnableCheats": "true"}},  # optional
            # launcher_options="simple",       # optional, see below
        )
```

### Multiple regions/releases

If your game has more than one valid PS2 serial — different regions, or a
patched re-release with its own serial — pass all of them as a tuple. A
player only needs *one* of them configured; Dynamic Pine treats them as
interchangeable everywhere it matters (matching a serial passed to
`launch_pcsx2`, looking up the configured ISO under `game_files`):

```python
dynamic_pine = DynamicPineGame(
    game_id=("SCUS-97615", "SCES-53960", "SCPS-15087"),  # NTSC-U, PAL, NTSC-J
    client_component="My Game Client",
)
```

Instance data (save states, memcard, ini) is still organized under one
canonical folder regardless of which release the player's ISO is — the first
serial in the tuple, `dynamic_pine.game_ids[0]`.

`launcher_options` controls the hub's per-game button layout:

- `"full"` (default) — separate **Launch PCSX2** and **Launch Client**
  buttons, for games that want to start PCSX2 and their client independently.
- `"simple"` — a single **Launch** button that launches PCSX2 with this
  game's configured ISO/settings and then starts the client together, marking
  the spawned client (via `mark_pcsx2_already_launched`) so it skips
  launching PCSX2 itself and just resolves the port Dynamic Pine already
  assigned. Use this when your client should never attempt to launch PCSX2 on
  its own — see [Client-side: resolve only, don't
  launch](#client-side-resolve-only-dont-launch) below.
- `"client"` — just **Launch Client**, nothing PCSX2-related at all. For
  games whose client already owns launching PCSX2 itself end-to-end (e.g. it
  patches its own ISO before launching) - the client calls `launch_pcsx2`
  directly rather than relying on the hub to have done it. See [Launching
  PCSX2 yourself from the
  client](#launching-pcsx2-yourself-from-the-client) below.
- `"patch"` — like `"client"`, plus a per-launch file picker: the button
  prompts for a `patch_file_suffix` file first and forwards its path to your
  client's `Component.func` (same as double-clicking that file would - see
  `Launcher.py`'s `run_component`), before doing anything else. For games
  whose client needs a per-seed patch file (e.g. an `.aprac2` archive) before
  it can patch-and-launch itself. Set `patch_file_suffix` (e.g. `".aprac2"`)
  alongside it. Your `Component.func`/`run_client`-equivalent needs to accept
  that path as a plain positional argument (`def run_client(*args: str):
  ...`, not read from `sys.argv`) since the hub calls it directly rather than
  spawning a fresh process with real CLI arguments - see
  [`rac2/__init__.py`](../../rac2/__init__.py)'s `run_client` for a working
  example.

## 2. Get your PINE port from Dynamic Pine in your client

### Pre-filling the slot name (optional)

The hub's `/launch <game> <instance>` (and the "simple" launcher's Launch
button) records `instance` as the slot name it expects you to connect
with — `get_pine_port`/`launch_pcsx2` key their config off exactly that
string, so a typo when the player manually types their slot name into your
client breaks the port lookup. Pre-fill it instead, before your client would
otherwise prompt for a slot name (e.g. at the top of `server_auth`):

```python
try:
    from worlds.dynamicpine import get_pending_auth, launched_via_hub
except ImportError:
    get_pending_auth = launched_via_hub = None

def _pending_auth(self) -> None:
    if self.auth or not launched_via_hub or not launched_via_hub():
        return
    pending = get_pending_auth()
    if pending:
        self.auth = pending
```

Guarded the same way as everything else here — only applies when actually
launched through the hub (`launched_via_hub()`), and only if `self.auth`
isn't already set some other way (a `--name` CLI arg, a prior connection).
See [`RACSizeMatterWorld`'s
`_dynamic_pine_auth()`](../../rac_size_matters/client/context.py) for a
complete example wired into `server_auth`.

Typically in your `Connected` package handler, once the slot name is known:

```python
try:
    from worlds.dynamicpine import launch_pcsx2
except ImportError:
    launch_pcsx2 = None

if launch_pcsx2:
    try:
        port = launch_pcsx2("My PS2 Game", self.auth)
    except Exception as exc:
        logger.warning(f"Dynamic Pine PCSX2 launch failed: {exc}")
        port = None
    if port is not None:
        self.pine.set_port(port)  # or however your client sets its PINE port
```

That's the whole integration: Dynamic Pine builds/repairs the ini, picks the
port, disables achievements, launches PCSX2 with the user's ISO, and hands you
the port. Your client's logic is untouched from there onwards — Dynamic Pine
never wraps or modifies game clients, it only starts them.

### Handling `launch_pcsx2`'s exceptions

`launch_pcsx2` raises rather than silently doing nothing when it can't
proceed — see [API reference](api.md#exceptions) for the full list
(`InstanceAlreadyRunningError`, `NoPCSX2Executable`, `NoBiosConfigured`,
`NoIsoConfigured`). The one you should always handle specially is
`InstanceAlreadyRunningError` — it's not a failure, it just means this
game+slot instance is already running, so fall back to
`get_pine_port(game, slot_name)` to reuse its port instead (this is exactly
what re-asking on reconnect should do):

```python
from worlds.dynamicpine import InstanceAlreadyRunningError, get_pine_port, launch_pcsx2

try:
    port = launch_pcsx2("My PS2 Game", self.auth)
except InstanceAlreadyRunningError:
    port = get_pine_port("My PS2 Game", self.auth)
except Exception as exc:
    logger.warning(f"Dynamic Pine PCSX2 launch failed: {exc}")
    port = None
if port is not None:
    self.pine.set_port(port)
```

`get_pine_port(game, slot_name)` is also available on its own if you only want
to look up a port without launching anything.

### Shortcut: a ready-made `/launch_pcsx2` command

If your client uses `launcher_options="full"` and you want a `/launch_pcsx2`
command in your own client (not just the hub's GUI buttons) so players can
launch PCSX2 from your client's own command line, mix in
`DynamicPineCommandMixin` rather than writing the exception handling above by
hand — same pattern as `PineMixin`/`DeathLinkMixin` in
`rac_size_matters/client/context.py`:

```python
from CommonClient import ClientCommandProcessor
from worlds.dynamicpine import DynamicPineCommandMixin

from .constants import GAME_NAME


class MyCommandProcessor(DynamicPineCommandMixin, ClientCommandProcessor):
    dynamic_pine_game_name = GAME_NAME
```

That's it — `_cmd_launch_pcsx2` reads the connected slot from `self.ctx.auth`,
calls `launch_pcsx2(GAME_NAME, self.ctx.auth)`, falls back to
`get_pine_port` on `InstanceAlreadyRunningError`, and reports every other
Dynamic Pine exception through `self.output(...)`. It's a no-op with a
message if Dynamic Pine isn't installed, so it's safe to mix in
unconditionally.

## Launching PCSX2 against a patched ISO

Some games patch a copy of the player's ISO per-seed (traps, item placement
baked into the disc image, etc.) rather than applying changes at runtime.
`launch_pcsx2` takes an optional `iso` argument that overrides the
`dynamic_pine_options.game_files` entry for that one launch, so PCSX2 comes up
pointed at your patched copy instead of the user's vanilla ISO:

```python
from pathlib import Path
from worlds.dynamicpine import InstanceAlreadyRunningError, get_pine_port, launch_pcsx2

patched_iso = Path(self.patched_iso_path)  # wherever your client wrote/downloaded it

try:
    port = launch_pcsx2("My PS2 Game", self.auth, iso=patched_iso)
except InstanceAlreadyRunningError:
    # Already running - the ISO override only matters at launch time, so
    # just reuse whatever this instance is already running against.
    port = get_pine_port("My PS2 Game", self.auth)
except Exception as exc:
    logger.warning(f"Dynamic Pine PCSX2 launch failed: {exc}")
    port = None
if port is not None:
    self.pine.port = port
```

Unlike the unconfigured-`game_files` case, a missing `iso` override raises
`NoIsoConfigured` immediately rather than prompting the user to browse for
one — an explicit override is assumed to be a specific file your client
prepared, not something the user should be asked to locate.

## Launching PCSX2 yourself from the client

If your client already has its own end-to-end launch flow (e.g. it patches an
`.aprac2`-style archive into a per-seed ISO before doing anything else, then
opens PCSX2 against it directly), use `launcher_options="client"` and call
`launch_pcsx2` yourself instead of going through the hub's PCSX2 buttons at
all — the hub then only ever shows a **Launch Client** button for this game.

If your client needs a per-seed file (like that `.aprac2` archive) to do any
of this, plain `"client"` isn't enough by itself — the hub's **Launch Client**
button doesn't know which file to pass it. Use `launcher_options="patch"`
instead (see [above](#1-declare-support-on-your-world)) so the hub prompts
for one and forwards it to your client the same way opening that file
directly would.

This is exactly the [patched-ISO](#launching-pcsx2-against-a-patched-iso)
case above, just called from wherever your client already does its own
patch-then-launch step rather than from a `Connected` handler:

```python
from pathlib import Path
try:
    from worlds.dynamicpine import InstanceAlreadyRunningError, launch_pcsx2, mark_launched_via_hub
except ImportError:
    launch_pcsx2 = None


async def patch_and_run_game(archive_path: str) -> None:
    output_path = patch_iso(archive_path)  # your existing patch step

    if launch_pcsx2 is not None:
        # This client always patches and launches its own PCSX2, and never
        # goes through the Dynamic Pine hub - self-register as its own "hub"
        # rather than launch_pcsx2 silently no-op'ing (see below).
        mark_launched_via_hub()
        try:
            port = launch_pcsx2("My PS2 Game", slot_name, iso=Path(output_path))
        except InstanceAlreadyRunningError:
            port = None  # already running against this instance's own ISO
        except Exception as exc:
            logger.warning(f"Dynamic Pine PCSX2 launch failed: {exc}")
            port = None
        if port is not None:
            game_interface.pine_port = port  # point your interface at it
            return

    # Fall back to launching PCSX2 yourself, e.g. if Dynamic Pine isn't
    # installed, or it declined to launch (already running, no BIOS/PCSX2
    # configured, etc).
    run_pcsx2_directly(output_path)
```

`launch_pcsx2` no-ops (returns `None`, nothing attempted) unless
[`launched_via_hub()`](api.md#setup-helpers) is true for this process -
normally that's only the Dynamic Pine hub client itself, or a game client it
spawned, so an *unrelated* client's launch flow can't accidentally get
hijacked by Dynamic Pine just because it happens to be installed. Since this
pattern calls `launch_pcsx2` itself, that's exactly the deliberate opt-in the
guard exists to require - `mark_launched_via_hub()` provides it. Keep your
existing fallback launch path regardless, for whenever Dynamic Pine isn't
installed or declines to launch (see `launch_pcsx2`'s
[exceptions](api.md#exceptions)).

## Client-side: resolve only, don't launch

If your game uses `launcher_options="simple"`, the hub's combined **Launch**
button always launches PCSX2 *before* spawning your client process — your
client should never call `launch_pcsx2` itself, just resolve the port:

```python
def _dynamic_pine_port(self) -> None:
    if not self.auth:
        return
    try:
        from worlds.dynamicpine import get_pine_port
    except ImportError:
        return
    port = get_pine_port("My PS2 Game", self.auth)
    if port is not None:
        self.pine.set_slot(port)
```

## Picking up the port without a round trip (optional fast path)

`launch_pcsx2` and `ensure_instance_config` both set
`ARCHIPELAGO_DYNAMIC_PINE_PORT` in the hub process's own environment every
time either one resolves an instance's port. Because game clients are spawned
from the hub via `multiprocessing.Process`, they inherit the hub's
environment at spawn time.

This means: clicking **Launch Client** for a game prepares that instance's
config (even if its PCSX2 isn't started yet) before the client process is
spawned, so the client comes up with `ARCHIPELAGO_DYNAMIC_PINE_PORT` already
set to the right port — it can read it immediately with
`get_pine_port_from_env()`, before it's even connected to an AP server or
knows its slot name:

```python
from worlds.dynamicpine import get_pine_port_from_env

env_port = get_pine_port_from_env()
if env_port is not None:
    self.pine.port = env_port  # point at it immediately, no need to wait
```

**This is a fast-path only, not a replacement for calling `launch_pcsx2`.** A
client must still call it (or the resolve-only pattern above, if
`launcher_options="simple"`) once the slot name is known, to actually get
PCSX2 launched in the first place and to get the correct port if this
particular instance wasn't already running when the client process was
spawned.

Because the env var is a single fixed name (not keyed by game), it only ever
reflects the *most recently resolved* instance's port in that process — never
rely on it once more than one Dynamic Pine instance may have been resolved in
the same process (the hub itself, mid-session, launching several games).

## See also

- [API reference](api.md) — every function/exception, full signatures.
- [PCSX2.ini settings](ini_settings.md) — what `ini_overrides` can and can't
  change.
