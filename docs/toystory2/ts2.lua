-- ============================================================================
-- Toy Story 2 (PS1) Archipelago - ALL-IN-ONE BizHawk script
-- ----------------------------------------------------------------------------
-- CONNECTOR VERSION: 2.1.1   <-- must match the Toy Story 2 .apworld release.
--   If a player reports odd behaviour (e.g. checks sending early), have them
--   confirm this line. It is also printed in the BizHawk Lua console on load and
--   again when settings are received, so they can read it back without opening
--   the file. A mismatch with the current release means their connector is stale.
-- ============================================================================
-- This ONE file replaces BOTH old scripts. You no longer load
-- connector_bizhawk_generic.lua separately - it is bundled at the bottom here.
-- Open the BizHawk Lua Console and load ONLY this file (after your ROM is open).
--
--   Part 1: Toy Story 2 tracking logic. Registers an onframestart handler
--           (ts2_main) and returns - it does NOT block.
--   Part 2: the stock Archipelago generic BizHawk connector (c) 2023 Zunawe,
--           MIT. It runs the blocking frame loop that talks to the Python
--           client; ts2_main fires every frame inside that loop.
--
-- Each part is wrapped in its own do...end so their top-level locals get
-- separate scopes (Lua caps locals at 200 per function/chunk). Global functions
-- (ts2_main, the connector's main/tick) and the onframestart handler still work
-- across the boundary. Do not split this file.
-- ============================================================================

-- === Part 1: Toy Story 2 logic =============================================

-- Single source of truth for the connector release version (see header). Bump this
-- in lockstep with the .apworld release. Global so it stays in scope across the
-- Part 1 / Part 2 do...end blocks without consuming a local slot.
TS2_VERSION = "2.1.1"

do
-- ============================================================
-- Toy Story 2: Buzz Lightyear to the Rescue
-- Archipelago Combined Script
-- ============================================================
-- Requires connector_bizhawk_generic.lua to be running
-- Settings are written by the Python client via shared memory
-- ============================================================

-- ============================================================
-- SHARED MEMORY ADDRESSES
-- ============================================================

-- Core settings
local SHARED_GAME_MODE        = 0x1FFFD1
local SHARED_BUNDLE_SIZE      = 0x1FFFD3
local SHARED_TOKEN_POOL       = 0x1FFFD5
local SHARED_TICKETS_REQ      = 0x1FFFD7
-- Gates
local SHARED_GATE_1           = 0x1FFFD9
local SHARED_GATE_2           = 0x1FFFDB
local SHARED_GATE_3           = 0x1FFFDD
local SHARED_GATE_4           = 0x1FFFDF
local SHARED_GATE_5           = 0x1FFFE1
-- Player state
local SHARED_TOKENS           = 0x1FFFE3
local SHARED_UNLOCKS_LOW      = 0x1FFFE5
local SHARED_UNLOCKS_HIGH     = 0x1FFFE7
local SHARED_TICKETS          = 0x1FFFE9
local SHARED_LASER_LEVEL      = 0x1FFFEB
local SHARED_MOVE_UNLOCKS_LOW = 0x1FFFED
local SHARED_MOVE_UNLOCKS_HIGH= 0x1FFFEF
local SHARED_BOSS_DEFEATS     = 0x1FFFF2
-- Rex / Prospector
local SHARED_REX_LOW          = 0x1FF9C4
local SHARED_REX_HIGH         = 0x1FF9C5
local SHARED_PROSP_ITEM       = 0x1FF9C6
-- Despawn seeds (server -> Lua, ONE DIRECTION). The client derives the current
-- level's collected mask from the AP server's checked_locations and writes it
-- here every tick; the Lua only READS these to hide already-collected objects.
-- We never write them, and the client never reads them back, so merging them can
-- never produce a phantom check (unlike the SHARED_BATTERY/LIFE/LASER/TOY masks,
-- which carry our own fresh-collection reports outward). Globals to stay under
-- the 200-local limit in main.
SHARED_DESPAWN_BATTERY  = 0x1FF97F
SHARED_DESPAWN_LIFE      = 0x1FF980
SHARED_DESPAWN_LASER     = 0x1FF9C7
SHARED_DESPAWN_TOY       = 0x1FF9FF
-- Traps / death / filler
local SHARED_TRAP_NARROW      = 0x1FF981
local SHARED_TRAP_INVINCIBLE  = 0x1FF982
local SHARED_TRAP_FREEZE      = 0x1FF983
local SHARED_TRAP_CUTSCENE    = 0x1FF984
local SHARED_TRAP_DAMAGE      = 0x1FF985
local SHARED_DEATH_LINK       = 0x1FF986
local SHARED_EXTRA_LIFE       = 0x1FF987
local SHARED_HEALTH_UP        = 0x1FF988
SHARED_INVINCIBLE_BUZZ  = 0x1FF96B  -- filler: 15s of Buzz invincibility (global: main chunk is at the 200-local limit)
-- On-screen item feed: client writes a sequence byte (bumped on each new
-- message) at 0x1FFF60, then up to 63 ASCII bytes + null terminator starting at
-- 0x1FFF61. The Lua shows the latest message top-right for a few seconds.
-- Parts collected
local SHARED_EAR_COLLECTED    = 0x1FF989
local SHARED_EYE_COLLECTED    = 0x1FF98A
local SHARED_ARM_COLLECTED    = 0x1FF98B
local SHARED_FOOT_COLLECTED   = 0x1FF98C
local SHARED_MOUTH_COLLECTED  = 0x1FF98D
-- Parts received
local SHARED_EAR_RECEIVED     = 0x1FF98E
local SHARED_EYE_RECEIVED     = 0x1FF98F
local SHARED_ARM_RECEIVED     = 0x1FF990
local SHARED_FOOT_RECEIVED    = 0x1FF991
local SHARED_MOUTH_RECEIVED   = 0x1FF992
-- Parts exchanged (turned in to Mr. Potato Head) — 0x1FF9E1-0x1FF9E5
local SHARED_EAR_EXCHANGED    = 0x1FF9E1
local SHARED_EYE_EXCHANGED    = 0x1FF9E2
local SHARED_ARM_EXCHANGED    = 0x1FF9E3
local SHARED_FOOT_EXCHANGED   = 0x1FF9E4
local SHARED_MOUTH_EXCHANGED  = 0x1FF9E5
-- Gadgets received

local SHARED_COINS = {
    [1]=0x1FF971,[2]=0x1FF972,[4]=0x1FF973,[5]=0x1FF974,
    [7]=0x1FF975,[8]=0x1FF976,[10]=0x1FF977,[11]=0x1FF978,
    [13]=0x1FF979,[14]=0x1FF97A,
}
-- Coin bundle ITEMS received from AP (count of bundles granted, to convert to
-- coins to spend). SEPARATE from SHARED_COINS (coinsanity detection).
local SHARED_COIN_ITEMS = {
    [1]=0x1FF9E6,[2]=0x1FF9E7,[4]=0x1FF9E8,[5]=0x1FF9E9,
    [7]=0x1FF9EA,[8]=0x1FF9EB,[10]=0x1FF9EC,[11]=0x1FF9ED,
    [13]=0x1FF9EE,[14]=0x1FF9EF,
}
-- Hamm "50 coins" check done per coin level (client writes 1 from checked_locations).
-- Global to avoid the 200-local limit.
SHARED_HAMM_DONE = {
    [1]=0x1FF960,[2]=0x1FF961,[4]=0x1FF962,[5]=0x1FF963,
    [7]=0x1FF964,[8]=0x1FF965,[10]=0x1FF966,[11]=0x1FF967,
    [13]=0x1FF968,[14]=0x1FF969,
}
-- Token checks collected, one byte per hover_id (7-20). Bits: 1=Hamm's,
-- 2=Missing Toys, 4=Race, 8=Hidden, 16=Boss. Lua writes, client reads.
local SHARED_TOKENS_COLLECTED = {
    [7]=0x1FF9F0,[8]=0x1FF9F1,[9]=0x1FF9F2,[10]=0x1FF9F3,
    [11]=0x1FF9F4,[12]=0x1FF9F5,[13]=0x1FF9F6,[14]=0x1FF9F7,
    [15]=0x1FF9F8,[16]=0x1FF9F9,[17]=0x1FF9FA,[18]=0x1FF9FB,
    [19]=0x1FF9FC,[20]=0x1FF9FD,[21]=0x1FF9FE,
}
local SHARED_TOY_COLLECTED = {
    [1]=0x1FF9A1,[2]=0x1FF9A2,[4]=0x1FF9A3,[5]=0x1FF9A4,
    [7]=0x1FF9A5,[8]=0x1FF9A6,[10]=0x1FF9A7,[11]=0x1FF9A8,
    [13]=0x1FF9A9,[14]=0x1FF9AA,
}
local SHARED_TOY_RECEIVED = {
    [1]=0x1FF9AB,[2]=0x1FF9AC,[4]=0x1FF9AD,[5]=0x1FF9AE,
    [7]=0x1FF9AF,[8]=0x1FF9B0,[10]=0x1FF9B1,[11]=0x1FF9B2,
    [13]=0x1FF9B3,[14]=0x1FF9B4,
}
local SHARED_BATTERY = {
    [1]=0x1FF9B5,[2]=0x1FF9B6,[6]=0x1FF9B7,[4]=0x1FF9B8,
    [5]=0x1FF9B9,[7]=0x1FF9BA,[8]=0x1FF9BB,[9]=0x1FF9BC,
    [11]=0x1FF9BD,[13]=0x1FF9BE,[14]=0x1FF9BF,
}
local SHARED_LIFE = {
    [1]=0x1FF9D9,[2]=0x1FF9DA,[4]=0x1FF9DB,[5]=0x1FF9DC,
    [7]=0x1FF9DD,[8]=0x1FF9DE,[11]=0x1FF9DF,[14]=0x1FF9E0,
}
local SHARED_LASER_SANITY = {
    [1]=0x1FF9C8,[2]=0x1FF9C9,[3]=0x1FF9CA,[4]=0x1FF9CB,
    [5]=0x1FF9CC,[7]=0x1FF9CD,[8]=0x1FF9CE,[10]=0x1FF9CF,
    [11]=0x1FF9D0,[13]=0x1FF9D1,[14]=0x1FF9D2,
}

-- ============================================================
-- GAME ADDRESSES (table to stay under local limit)
-- ============================================================
local A = {
    LEVEL=0x0A16A8, INPUT=0x0A3DDB, HOVER=0x0C26B4, MAP_TOKEN=0x1FFF18,
    SPIN=0x0A14EC, STOMP=0x0A115C, JUMP=0x0B2214, LEDGE=0x04C310,
    POLE=0x0A1244, VAULT=0x04B000, PUSH=0x048AC4, ROPE=0x04BD48,
    LASER_PROG=0x04A636, LASER_SUPER=0x0A15E0, LASER_UI=0x0C2AD1,
    BOSS_HP=0x0C2F1A, PROSP2=0x0C2FB2, PROSP3=0x0C304A,
    NARROW_VIS=0x0A1398, FREEZE=0x0A10A0, INVINCE=0x06D610,
    DISC=0x0A15C4, GRAPPLE=0x0A1368, PAUSE=0x0A10F4,
    BUZZ_X=0x0B2188, BUZZ_Y=0x0B2189, BUZZ_HP=0x0B221E,
    BUZZ_POS=0x0B2191, LEVEL_READY=0x0A1044,
    BUZZ_LIVES=0x0B2222, BUZZ_IFRAME=0x0B221C,
    COIN=0x0B2226, COIN_ANIM=0x0CD404, LIVES_UI=0x0CD400,
    HEALTH_UI=0x0CD402, COIN_UI=0x0C2ACD, BUZZ_STATE=0x0A155C,
    MUSIC=0x0A1530, REX_TEXT=0x0CDD28, DIALOG_OPEN=0x0A1328,
    LOCKED_MSG=0x1FFF08, LIFE=0x0B2222, POTATO_UI=0x0A13BB,
    TOY_UI=0x0A11F8, DIALOG=0x0CDD28, FALL_ANIM=0x0A1320,
}

-- ============================================================
-- CONSTANTS
-- ============================================================

local MAP_LEVEL_ID = 16
local MIN_LEVEL    = 1
local MAX_LEVEL    = 15

local BITS = {SPIN=0,STOMP=1,DBL_JUMP=2,VISOR=3,LEDGE=4,POLE=5,VAULT=6,PUSH=7,ROPE=0}

local LZ = {SQUARE_BIT=128, PROG_DEFAULT=141442, PROG_VAL=140288, SUPER_VAL=1200, VISOR_L1_BIT=4}

local MV = {
    LEDGE_LOCKED=0x00000000, LEDGE_UNLOCKED=0x8E020004,
    POLE_LOCKED=0xFFFFFFFF,  POLE_UNLOCKED=0x00000000,
    VAULT_LOCKED=0x00000000, VAULT_UNLOCKED=0x00431023,
    PUSH_LOCKED=0x00000000,  PUSH_UNLOCKED=0x8663000E,
    ROPE_LOCKED=0x00000000,  ROPE_UNLOCKED=0x00431023,
}

local TOKEN_ADDR = {
    [7]=0x0C1618,[8]=0x0C1619,[9]=0x0C161A,[10]=0x0C161B,
    [11]=0x0C161C,[12]=0x0C161D,[13]=0x0C161E,[14]=0x0C161F,
    [15]=0x0C1620,[16]=0x0C1621,[17]=0x0C1622,[18]=0x0C1623,
    [19]=0x0C1624,[20]=0x0C1625,
}
local BOSS_HOVER_IDS={[9]=true,[12]=true,[15]=true,[18]=true}
local HOVER_TO_LEVEL={
    [7]=1,[8]=2,[9]=6,[10]=4,[11]=5,[12]=3,
    [13]=7,[14]=8,[15]=9,[16]=10,[17]=11,[18]=12,
    [19]=13,[20]=14,[21]=15,
}
local LEVEL_TO_HOVER={}
for h,l in pairs(HOVER_TO_LEVEL) do LEVEL_TO_HOVER[l]=h end
local HOVER_TO_BIT={
    [7]=0,[8]=1,[9]=2,[10]=3,[11]=4,[12]=5,[13]=6,[14]=7,
    [15]=0,[16]=1,[17]=2,[18]=3,[19]=4,[20]=5,[21]=6,
}
local COIN_LEVEL_IDS={
    [1]=true,[2]=true,[4]=true,[5]=true,[7]=true,
    [8]=true,[10]=true,[11]=true,[13]=true,[14]=true,
}
local COIN_MAX={
    [1]=93,[2]=99,[4]=72,[5]=103,[7]=71,
    [8]=89,[10]=63,[11]=72,[13]=72,[14]=88,
}
local CUTSCENE_ADDRS={
    0x0C1628,0x0C1629,0x0C162A,0x0C162B,0x0C162C,0x0C162D,
    0x0C162E,0x0C162F,0x0C1630,0x0C1631,0x0C1632,0x0C1633,
    0x0C1637,0x0C1634,0x0C1635,
}
local AREA_LEVELS={
    [0]={regular={7,8},boss={9},locked={10,11,12,13,14,15,16,17,18,19,20,21}},
    [1]={regular={7,8,10,11},boss={12},special={9},locked={13,14,15,16,17,18,19,20,21}},
    [2]={regular={7,8,10,11,13,14},boss={9,12,15},keep_zero={15},locked={16,17,18,19,20,21}},
    [3]={regular={7,8,10,11,13,14,16,17},boss={9,12,15,18},keep_zero={18},locked={19,20,21}},
    [4]={regular={7,8,10,11,13,14,16,17,19,20},boss={9,12,15,18},locked={}},
}
local AREA_UNLOCKED={
    [0]={7,8},[1]={7,8,10,11},[2]={7,8,10,11,13,14},
    [3]={7,8,10,11,13,14,16,17},[4]={7,8,10,11,13,14,16,17,19,20},
}
local BOSS_GATE={[9]=1,[12]=2,[15]=3,[18]=4,[21]=5}
local BOSS_HOVER_GATE={[9]=SHARED_GATE_1,[12]=SHARED_GATE_2,[15]=SHARED_GATE_3,[18]=SHARED_GATE_4}
local BIT_TO_NAME={[1]="Hamm's 50 Coins Token",[2]="Missing Toys Token",[4]="Race Token",[8]="Hidden Token",[16]="Boss Token"}


-- ============================================================
-- SETTINGS READERS (from shared memory, written by Python)
-- ============================================================
GM_LATCH = {}  -- global (no local-limit cost): game-mode latch state
function get_game_mode()
    -- Read the game mode from the mirror (0x1FF97D) the client writes, tagged
    -- 0xA0=open / 0xA1=linear. We only trust (and latch) a magic-tagged value, so
    -- random RAM garbage can't be mistaken for a real mode (a bare 0/1 could, and
    -- that broke linear after the first level). The real settings byte (0x1FFFD1)
    -- is in the top-of-RAM region the game corrupts during transitions, so it's
    -- only a last-resort fallback before the client's first write.
    if GM_LATCH.cached ~= nil then return GM_LATCH.cached end
    local m = mainmemory.read_u8(0x1FF97D)
    if m == 0xA0 or m == 0xA1 then
        GM_LATCH.cached = m - 0xA0
        return GM_LATCH.cached
    end
    -- Mirror not written yet: fall back to the raw settings byte.
    return mainmemory.read_u8(SHARED_GAME_MODE)
end
function get_checks_bundle_size()
    -- Coins-per-CHECK. 0 means ALL (handled by callers as one whole-level check).
    return mainmemory.read_u8(SHARED_BUNDLE_SIZE)
end
function get_recv_bundle_size()
    -- Coins granted per received Coin Bundle ITEM. Never 'all'.
    local s = mainmemory.read_u8(0x1FFFD4)
    return s == 0 and 5 or s
end
function get_token_pool()       return mainmemory.read_u8(SHARED_TOKEN_POOL) end
function get_tickets_req()
    local v = mainmemory.read_u8(SHARED_TICKETS_REQ)
    return v == 0 and 4 or v
end
function get_gate(n)
    local addrs = {SHARED_GATE_1,SHARED_GATE_2,SHARED_GATE_3,SHARED_GATE_4,SHARED_GATE_5}
    local defaults = {10,20,30,40,50}
    local v = mainmemory.read_u8(addrs[n] or SHARED_GATE_5)
    return v == 0 and defaults[n] or v
end
function get_ap_tokens()        return mainmemory.read_u8(SHARED_TOKENS) end
function get_tickets()          return mainmemory.read_u8(SHARED_TICKETS) end
function get_laser_level()      return mainmemory.read_u8(SHARED_LASER_LEVEL) end
function get_spin_level()       return mainmemory.read_u8(0x1FFFEC) end  -- SHARED_SPIN_LEVEL
-- Progressive Spin level 3 ("super spin") + Dizzy Buzz trap state. Globals (not
-- local) to stay clear of the main-chunk 200-local limit.
SPIN_SUPER       = 0xFFFFFED2   -- written every frame while super spin is ON
SPIN_DIZZY       = 0xFFFFFF87   -- Dizzy Buzz value (triggers Buzz's dizzy animation)
SPIN_UI_ADDR     = 0x0C2ACF     -- spin UI element (re-hidden during dizzy w/o spin)
SPIN_HOLD_FRAMES = 8            -- frames O must be held to flip the super-spin toggle
SPIN_DIZZY_CLEAR = 1            -- frames to hold 0x0A139C at 0 before the dizzy value
SPIN_UI_HOLD     = 180          -- keep hiding the spin UI 3s (60fps) after dizzy ends
spin3_on = false                -- super-spin toggle
spin_streak = 0                 -- noise-tolerant "O held" counter
spin_consumed = false           -- current hold already flipped the toggle
dizzy_seq = 0                   -- >0 while the clear-then-dizzy write sequence runs
dizzy_active = false            -- dizzy live; hands off 0x0A139C until the game zeroes it
spin_ui_hidden = nil            -- learned value of the spin UI while it is hidden
spin_ui_hold = 0                -- frames left to keep hiding the spin UI post-dizzy
function clear_spin3()
    mainmemory.write_u32_le(0x0A139C, 0)   -- zeroes 0x0A139C..0x0A139F
end
function is_move_unlocked(bit, is_rope)
    if is_rope then return (mainmemory.read_u8(SHARED_MOVE_UNLOCKS_HIGH) & 1) ~= 0 end
    return (mainmemory.read_u8(SHARED_MOVE_UNLOCKS_LOW) & (1 << bit)) ~= 0
end
function is_level_unlocked(hover_id)
    local bit = HOVER_TO_BIT[hover_id]
    if not bit then return false end
    local byte = hover_id <= 14
        and mainmemory.read_u8(SHARED_UNLOCKS_LOW)
        or  mainmemory.read_u8(SHARED_UNLOCKS_HIGH)
    return (byte & (1 << bit)) ~= 0
end
function set_level_unlocked(hover_id, unlocked)
    local bit = HOVER_TO_BIT[hover_id]
    if not bit then return end
    local addr = hover_id <= 14 and SHARED_UNLOCKS_LOW or SHARED_UNLOCKS_HIGH
    local cur  = mainmemory.read_u8(addr)
    mainmemory.write_u8(addr, unlocked and (cur | (1<<bit)) or (cur & ~(1<<bit)))
end

-- Sanity settings (bit flags in a settings byte — we read SHARED_GAME_MODE area)
-- The Python client writes slot_data settings; we read them from fixed addresses
-- We use dedicated addresses just above our shared map for sanity toggles
local SHARED_SETTINGS = 0x1FF9D3  -- 1 byte: bit0=coinsanity, bit1=lifesanity, bit2=batterysanity, bit3=laser_sanity, bit4=rexsanity, bit5=movesanity, bit6=hintsanity
local SHARED_MUSIC_MODE   = 0x1FF9D4  -- 0=off, 1=normal, 2=chaos, 3=oops
local SHARED_MUSIC_TRACK  = 0x1FF9D5  -- oops all bangers track
local SHARED_SKIP_SONG    = 0x1FF9D6  -- 1=enabled
local SHARED_QOL          = 0x1FF9D7  -- bit0=autosave, bit1=disc-fill, bit2=fallAnim, bit3=skipCutscenes, bit4=autocoins
local SHARED_DEATH_LINK_ON= 0x1FF9D8  -- 1=death link enabled

function setting(byte_addr, bit)
    return (mainmemory.read_u8(byte_addr) & (1 << bit)) ~= 0
end

function is_coinsanity()    return setting(SHARED_SETTINGS, 0) end
function is_lifesanity()    return setting(SHARED_SETTINGS, 1) end
function is_batterysanity() return setting(SHARED_SETTINGS, 2) end
function is_lasersanity()   return setting(SHARED_SETTINGS, 3) end
function is_rexsanity()     return setting(SHARED_SETTINGS, 4) end
function is_hintsanity()    return setting(SHARED_SETTINGS, 6) end
function is_auto_save()     return setting(SHARED_QOL, 0) end
function is_autocoins()     return setting(SHARED_QOL, 4) end
function is_disc_fill()     return setting(SHARED_QOL, 1) end
function is_no_fall_anim()  return setting(SHARED_QOL, 2) end
function is_skip_cutscenes()return setting(SHARED_QOL, 3) end
function is_start_full_health() return setting(SHARED_QOL, 5) end
function is_never_game_over()  return setting(SHARED_QOL, 6) end
function is_death_link()    return mainmemory.read_u8(SHARED_DEATH_LINK_ON) == 1 end
function music_mode()       return mainmemory.read_u8(SHARED_MUSIC_MODE) end
function oops_track()       return mainmemory.read_u8(SHARED_MUSIC_TRACK) end
function skip_song_enabled()return mainmemory.read_u8(SHARED_SKIP_SONG) == 1 end

-- ============================================================
-- GLOBAL STATE
-- ============================================================
local script_initialized = false
local last_level        = -1
local buzz_moved        = false
local last_buzz_x       = -1
local last_buzz_y       = -1
local buzz_baseline_set = false
local buzz_spawn = {started=false, base=0, cand=-1, stable=0, gadget_applied={},
                    move_x=nil, move_y=nil, move_frames=0, lr_frames=0, lr_snapshot=nil}
local on_map            = false
local map_was_on        = false
local map_saved         = false

-- ============================================================
-- MOVES STATE
-- ============================================================
local spin_restored  = false
local pole_restored  = false
local vault_restored = false
local push_restored  = false
local rope_restored  = false
local visor_restored = false
local dbljump_restored = false

-- Double-jump input suppression state. GLOBAL, not local: the main chunk is at
-- the 200-local ceiling (see header), so new module state must not be a local.
DJ_SUPPRESSING = false   -- currently killing an in-air jump press
DJ_PAD_PREV    = false   -- real controller X last frame (for edge detection)
DJ_LATCHED     = false   -- debounced "airborne" latch
DJ_GROUND_RUN  = 0       -- consecutive frames the jump state has read grounded
DJ_PREV_PAUSED = false   -- pause menu was open last frame
DJ_X_AT_PAUSE  = false   -- was X already held when the pause menu opened?
DJ_GROUND_HOLD = 6       -- grounded frames required to clear the latch
local stomp_nudged   = false
local circle_was_up  = true

-- ============================================================
-- BOSS STATE
-- ============================================================
local boss_defeated       = false
local boss_started = {slime=false, toybarn=false, zurg=false, bombs=false}
local prosp_loading       = false

-- ============================================================
-- COIN SANITY STATE
-- ============================================================
local coins_checked   = {}
local last_ap_coins = {}
local coins_this_visit = {}
local coin_load_timer = 0
local coin_baseline_set = false
local COIN_LOAD_WAIT  = 120
local coin_reassert = 0
COIN_REASSERT_FRAMES = 60   -- frames to re-assert the coin baseline after entry (bridges the game's post-load counter reset)
local sanity_load_timer = 0
local SANITY_LOAD_WAIT  = 120
local LEVEL_READY_HOLD  = 180  -- frames (~3s) 0x0A1044 must hold >=21 before arming
local suppress_coin_ui= 0
for lid, _ in pairs(COIN_MAX) do
    coins_checked[lid]   = 0
    last_ap_coins[lid] = 0
    coins_this_visit[lid] = 0
end

-- ============================================================
-- REX STATE
-- ============================================================
local rex_state       = {}
local rex_lua_mask    = {lo=0, hi=0}
local was_dialog_open = false
local rex_triggered   = false
-- Connection generation: the client bumps SHARED_CONN_GEN each connect. When it
-- changes we clear the rex mask/state so talks from a previous seed (still held in
-- this running Lua) aren't asserted into a newly-connected seed.
SHARED_CONN_GEN       = 0x1FF96A
conn_gen_seen         = nil   -- global (200-local limit)

-- ============================================================
-- TRAP STATE
-- ============================================================
local narrow_active      = false
local narrow_frames      = 0
local NARROW_DURATION    = 30 * 60
local freeze_active      = false
local freeze_frames      = 0
local FREEZE_DURATION    = 10 * 60
local invince_active     = false
local invince_frames     = 0
-- QOL / filler cross-function state (global to avoid the 200-local main-chunk
-- limit, matching DEATH_PHASE et al.)
buzz_invince_frames = 0      -- Invincible Buzz filler: player i-frames remaining
INVINCE_BUZZ_FRAMES = 900    -- 15 seconds @ 60fps
full_health_frames  = 0      -- QOL: assert full health for a window after level entry
ngo_armed           = true   -- QOL Never Game Over: one-shot guard (re-armed when HP>0)
local INVINCE_DURATION   = 30 * 60
local COIN_LEVELS_SET    = COIN_LEVEL_IDS
-- Cutscene trap state machine (consolidated into one table to stay under Lua's
-- 200-local limit). Faithful port of the original ts2_traps.lua state machine.
local CS = {
    active=false, phase=0, trigger_timer=0, level_changed=false, pending=false,
    saw_boss_defeat=false, zurg_saw_64=false, zurg_first_done=false, cycles=0,
    post_pending=false, post_timer=0, saved={}, entered_level=nil,
}
CUTSCENE_TRIGGER_WAIT = 180   -- globals (no local-limit cost)
CUTSCENE_STATE_ADDR   = 0x00E065
CS_START_ADDR         = 0x0A3DDA
POST_CS_WAIT          = 180
DEATH_PHASE           = 0      -- death-link sequence: 0=idle, 1=dying
DEATH_A_FRAMES        = 0      -- frames elapsed while dying (safety backstop)
CS_PLAYING            = false  -- true only while a cutscene is actively on screen
local BOSS_DEFEAT_SCREENS= {[35]=true,[38]=true,[41]=true,[44]=true}

-- ============================================================
-- DEATH LINK STATE
-- ============================================================
local death_sent = false

-- ============================================================
-- MUSIC STATE
-- ============================================================
local music_last_level    = -1
local music_natural       = -1
local music_our_write     = -1
local music_current       = -1
local music_display_timer = 0
local MUSIC_DISPLAY_FRAMES= 5 * 60
local skip_r2_was_up      = true
local skip_l2_was_up      = true
local normal_map          = {}
local NORMAL_POOL = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,18,19}
local CHAOS_POOL  = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21}
local TRACK_NAMES = {
    [0]="Andy's House",[1]="Andy's Neighborhood",[2]="Bombs Away!",
    [3]="Construction Yard",[4]="Alleys and Gullies",[5]="Slime Time",
    [6]="Al's Toy Barn",[7]="Al's Space Land",[8]="Toy Barn Encounter",
    [9]="Elevator Hop",[10]="Al's Penthouse",[11]="The Evil Emperor Zurg",
    [12]="Airport Infiltration",[13]="Tarmac Trouble",[14]="Prospector Showdown",
    [15]="Miniboss Theme",[16]="Minigame Theme",[17]="Game Over",
    [18]="Credits",[19]="You've Got a Friend in Me",[20]="Title Screen",[21]="Level Complete",
}

function shuffle(t)
    local s = {} for i=1,#t do s[i]=t[i] end
    for i=#s,2,-1 do local j=math.random(i); s[i],s[j]=s[j],s[i] end
    return s
end

-- Seed-locked normal-mode music map, written by the client from slot_data.
-- SHARED_MUSIC_MAP_VALID is 1 once the 22 bytes at SHARED_MUSIC_MAP_BASE hold a
-- real map (index = natural track id, value = track to play instead).
-- GLOBAL, not local: the main chunk is at the 200-local ceiling (see header).
SHARED_MUSIC_MAP_VALID = 0x1FFB00
SHARED_MUSIC_MAP_BASE  = 0x1FFB01

-- Preferred path: the map was rolled at GENERATION time with the seed's own RNG
-- and shipped via slot_data, so it is identical on every reconnect. Returns true
-- once that map has been read in.
function read_shared_music_map()
    if mainmemory.read_u8(SHARED_MUSIC_MAP_VALID) ~= 1 then return false end
    for t = 0, 21 do
        normal_map[t] = mainmemory.read_u8(SHARED_MUSIC_MAP_BASE + t)
    end
    return true
end

-- Fallback for seeds generated before the map was shipped in slot_data (valid
-- flag never becomes 1). math.random is not seeded here, so this re-rolls on
-- every script load -- which is exactly the drift the shared map fixes. Built at
-- most once per run so the music at least stays stable within a session.
function build_normal_map()
    local shuffled, has_fp
    repeat
        shuffled = shuffle(NORMAL_POOL); has_fp = false
        for i,orig in ipairs(NORMAL_POOL) do
            if orig == shuffled[i] then has_fp=true; break end
        end
    until not has_fp
    for i,orig in ipairs(NORMAL_POOL) do normal_map[orig]=shuffled[i] end
    normal_map[17]=17; normal_map[20]=20; normal_map[21]=21
end



-- ============================================================
-- POTATO HEAD DATA
-- ============================================================
local MODEL_ADDRS = {
    [1]  = {{addr=0x0AD602,val=1}},
    [4]  = {{addr=0x0ABF3A,val=1}},
    [7]  = {{addr=0x0AB7A2,val=1},{addr=0x0ABBDA,val=1},{addr=0x0ABC46,val=1},{addr=0x0ABD8A,val=1}},
    [10] = {{addr=0x0AA8DE,val=1}},
    [13] = {{addr=0x0AAF9E,val=1}},
}

local PARTS = {
    [1]  = { received_flag=SHARED_EAR_RECEIVED,   collected_flag=SHARED_EAR_COLLECTED,   exchanged_flag=SHARED_EAR_EXCHANGED,
             hitbox={{addr=0x0C7A39,uncollected=13}},
             objects={{addr=0x150723,uncollected=16},{addr=0x15071F,uncollected=16},{addr=0x150721,uncollected=16}} },
    [4]  = { received_flag=SHARED_EYE_RECEIVED,   collected_flag=SHARED_EYE_COLLECTED,   exchanged_flag=SHARED_EYE_EXCHANGED,
             hitbox={{addr=0x0C7888,uncollected=116},{addr=0x0C7889,uncollected=195},{addr=0x0C788A,uncollected=255}},
             objects={{addr=0x13C4FA,uncollected=51},{addr=0x13C4FB,uncollected=19},{addr=0x13C4FC,uncollected=51},{addr=0x13C4FD,uncollected=19},{addr=0x13C4FE,uncollected=51},{addr=0x13C4FF,uncollected=19}} },
    [7]  = { received_flag=SHARED_ARM_RECEIVED,   collected_flag=SHARED_ARM_COLLECTED,   exchanged_flag=SHARED_ARM_EXCHANGED,
             hitbox={{addr=0x0C789A,uncollected=255}},
             objects={{addr=0x0C7899,uncollected=249}} },
    [10] = { received_flag=SHARED_FOOT_RECEIVED,  collected_flag=SHARED_FOOT_COLLECTED,  exchanged_flag=SHARED_FOOT_EXCHANGED,
             hitbox={{addr=0x0C788A,uncollected=255}},
             objects={{addr=0x0C7889,uncollected=241}} },
    [13] = { received_flag=SHARED_MOUTH_RECEIVED, collected_flag=SHARED_MOUTH_COLLECTED, exchanged_flag=SHARED_MOUTH_EXCHANGED,
             hitbox={{addr=0x0C7889,uncollected=236},{addr=0x0C788A,uncollected=236}},
             objects={{addr=0x14905B,uncollected=16},{addr=0x14905D,uncollected=16},{addr=0x14905F,uncollected=16}} },
}
-- Gadget-unlock bitfield (0x0A1154): which gadgets the game considers unlocked,
-- same bit layout as the token byte. When Potato Head gives you a part in his
-- gadget level, the game marks that gadget unlocked here AND tears down the world
-- part-pickup (vanilla treats collect+give as one object). To keep the separate
-- AP "Missing Part" pickup collectable, we clear that gadget's bit while in the
-- level until its Missing check is collected, which makes the game re-spawn the
-- pickup. Map: level -> gadget bit Potato Head grants there.
GADGET_UNLOCK_ADDR = 0x0A1154
PART_GADGET_BIT = {
    [1]  = 1,   -- Andy's House        -> Shield
    [4]  = 4,   -- Construction Yard    -> Disc Launcher
    [7]  = 2,   -- Al's Toy Barn        -> Rocket Boots
    [10] = 16,  -- Elevator Hop         -> Grappling Hook
    [13] = 8,   -- Airport Infiltration -> Hover Boots
}
-- Ownership flag (shared byte, 1 == you own the randomized item) for each
-- level's NATIVE Potato-Head gadget. The game would natively grant these via the
-- Potato flow; we only let that happen if you actually own the matching item.
NATIVE_GADGET_OWN = {
    [1]  = 0x1FF993,  -- Cosmic Shield - Andy's House
    [4]  = 0x1FF995,  -- Disc Launcher - Construction Yard
    [7]  = 0x1FF999,  -- Rocket Boots - Al's Toy Barn
    [10] = 0x1FF99D,  -- Grappling Hook - Elevator Hop
    [13] = 0x1FF99F,  -- Hover Boots - Airport Infiltration
}
-- Server-published seed: bit set when that level's "Missing X" pickup check is
-- collected. While the bit is CLEAR (pickup not yet collected) we clear the
-- gadget-unlock bit so the game re-spawns the world pickup.
SHARED_DESPAWN_PART = 0x1FF9C0
PART_SEED_BIT = {
    [1]=1, [4]=2, [7]=4, [10]=8, [13]=16,  -- bits 0..4
}
SHARED_DESPAWN_PART_EXCH = 0x1FF9C1
-- Potato/sanity/map state (compact)
local gadgets_written, part_watched, part_exchanged, toys_written = false, false, false, false
local part_seen_present = {}
local life_seen_present = {}
local battery_seen_present = {}
local laser_seen_present = {}
local dialog_was_open, hamm_uncollected_idx = false, 1
local toy_received_counts = {[1]=0,[2]=0,[4]=0,[5]=0,[7]=0,[8]=0,[10]=0,[11]=0,[13]=0,[14]=0}
local toy_collected_masks = {[1]=0,[2]=0,[4]=0,[5]=0,[7]=0,[8]=0,[10]=0,[11]=0,[13]=0,[14]=0}
-- Once we have seen a part turned in (exchanged flag set, from the client's
-- persistent restore or an in-game exchange), latch it per-level so a single
-- corrupted-RAM frame can't make the "give me my part" UI reappear.
local potato_exchanged_latch = {}
-- Once a part PICKUP has been detected as collected (check sent), latch it for
-- the session. Without this, returning to the level after giving the part to
-- Potato Head re-detects collection (the pickup is legitimately gone from the
-- world AND the shared collected flag can be reset/corrupted during the level
-- reload), which re-fired the part's location check on every re-entry.
local potato_collected_latch = {}
-- Debounce for part-collection detection: is_part_collected() can read TRUE for
-- a few frames during a level load (the part object isn't initialised yet, so its
-- hitbox byte reads 0 = "gone"). Requiring the collected read to HOLD for several
-- consecutive frames rejects that transient and prevents a phantom check the
-- instant you enter a level. Reset on level change. (Globals to stay under the
-- 200-local limit in main.)
potato_collect_streak = {}
POTATO_COLLECT_HOLD = 20
local potato_collected2_idx = {}
local items_written, last_life_count = false, -1
local battery_masks, life_masks, laser_masks = {}, {}, {}
local token_checks_sent = {}
local map_entry_timer, MAP_ENTRY_FRAMES = 0, 180
local last_unlocks_low, last_unlocks_high = -1, -1
local msg_playing, we_triggered_msg = false, false
local last_hovered = -1
local map_select_settle = 0
local MAP_SELECT_SETTLE = 10
local x_was_down = false
local last_tickets, last_tokens_linear = -1, -1
for lvl,_ in pairs(PARTS) do potato_collected2_idx[lvl]=1 end

local GADGETS = {
    [0x1FF993] = { level=1,
        containers={{addr=0x14F797,uncollected=16},{addr=0x14F799,uncollected=16},{addr=0x14F79B,uncollected=16},{addr=0x1B6619,uncollected=16},{addr=0x1B661D,uncollected=16},{addr=0x1B6622,uncollected=7},{addr=0x149B6A,uncollected=76},{addr=0x1B6621,uncollected=240}},
        hitboxes={{addr=0x0CA0D0,uncollected=8}},
        sizes={{addr=0x14F7B7,collected=32},{addr=0x14F7B9,collected=32},{addr=0x14F7BB,collected=32}},
        usability={0x0C78F1} },
    [0x1FF994] = { level=2,
        containers={{addr=0x13ED2B,uncollected=16},{addr=0x13ED2D,uncollected=16},{addr=0x13ED2F,uncollected=16},{addr=0x13FFAB,uncollected=16},{addr=0x13FFAD,uncollected=16},{addr=0x13FFAF,uncollected=16},{addr=0x13FFCB,uncollected=16},{addr=0x13FFCD,uncollected=16},{addr=0x13FFCF,uncollected=16},{addr=0x16CFA9,uncollected=16},{addr=0x16CFB1,uncollected=16},{addr=0x16CFB9,uncollected=16},{addr=0x16CFD1,uncollected=240},{addr=0x16AE11,uncollected=240},{addr=0x16AE19,uncollected=16},{addr=0x16AE1A,uncollected=7},{addr=0x16AE1E,uncollected=7},{addr=0x16AE21,uncollected=240},{addr=0x16B016,uncollected=3},{addr=0x16CFD9,uncollected=16},{addr=0x16CFE1,uncollected=240},{addr=0x13B4EE,uncollected=73},{addr=0x13C5BA,uncollected=73},{addr=0x13C5CE,uncollected=73}},
        hitboxes={{addr=0x0C9D90,uncollected=8},{addr=0x0C9DC4,uncollected=8},{addr=0x0C9DF8,uncollected=8}},
        sizes={}, usability={0x0C7A41,0x0C7A51,0x0C7A61} },
    [0x1FF995] = { level=4,
        containers={{addr=0x187A44,uncollected=224},{addr=0x187A45,uncollected=251},{addr=0x187A49,uncollected=16},{addr=0x187A4C,uncollected=32},{addr=0x187A4D,uncollected=4},{addr=0x187A50,uncollected=117},{addr=0x187A51,uncollected=15},{addr=0x187D10,uncollected=51},{addr=0x187D11,uncollected=19},{addr=0x187D18,uncollected=51},{addr=0x187D19,uncollected=19},{addr=0x187A40,uncollected=117},{addr=0x187A41,uncollected=15},{addr=0x1393DA,uncollected=9},{addr=0x1395E2,uncollected=9},{addr=0x187E55,uncollected=16},{addr=0x187E59,uncollected=16},{addr=0x187E5D,uncollected=240}},
        hitboxes={{addr=0x0C9D28,uncollected=8},{addr=0x0C9F30,uncollected=8}},
        sizes={}, usability={0x0C7881,0x0C7871} },
    [0x1FF996] = { level=5,
        -- 0x19E9CC/0x19E9CD were previously listed here too, but they belong to
        -- Rocket Boots (0x1FF998) -- they are the tail of its contiguous
        -- 0x19E9BC-0x19E9CD block. Having them in BOTH lists made the two gadgets
        -- fight over the same bytes: owning Grappling Hook but not Rocket Boots
        -- meant unlock_gadget wrote 0 over the 28/243 that write_gadget had just
        -- written, and since these writes are edge-triggered on ownership change,
        -- whichever ran last (pairs() order is undefined) stuck for the whole
        -- level visit. Rocket Boots owns them now; do not re-add them here.
        containers={{addr=0x19E9E4,uncollected=248},{addr=0x19E9E5,uncollected=244},{addr=0x19E9E8,uncollected=150},{addr=0x19E9E9,uncollected=11},{addr=0x19E9EA,uncollected=6},{addr=0x19E9ED,uncollected=16},{addr=0x19E9EE,uncollected=5},{addr=0x19E9F0,uncollected=106},{addr=0x19E9F1,uncollected=244},{addr=0x13AEA6,uncollected=73},{addr=0x13FE73,uncollected=12,collected=16},{addr=0x13FE75,uncollected=12,collected=16},{addr=0x13FE77,uncollected=12,collected=16},{addr=0x19E9F4,uncollected=248},{addr=0x19E9F5,uncollected=244}},
        hitboxes={{addr=0x0C9C58,uncollected=8}},
        sizes={}, usability={0x0C7961} },
    [0x1FF997] = { level=5,
        containers={{addr=0x19E69D,uncollected=252},{addr=0x19E6C2,uncollected=2},{addr=0x19E73D,uncollected=240},{addr=0x19E745,uncollected=16},{addr=0x19E746,uncollected=7},{addr=0x19E74A,uncollected=7},{addr=0x19E74D,uncollected=240},{addr=0x13AD52,uncollected=73}},
        hitboxes={{addr=0x0C9C24,uncollected=8}},
        sizes={}, usability={0x0C79F1} },
    [0x1FF998] = { level=5,
        containers={{addr=0x19E9BC,uncollected=140},{addr=0x19E9BD,uncollected=241},{addr=0x19E9BE,uncollected=194},{addr=0x19E9BF,uncollected=255},{addr=0x19E9C0,uncollected=221},{addr=0x19E9C1,uncollected=6},{addr=0x19E9C2,uncollected=168},{addr=0x19E9C3,uncollected=252},{addr=0x19E9C4,uncollected=54},{addr=0x19E9C5,uncollected=14},{addr=0x19E9C6,uncollected=120},{addr=0x19E9C7,uncollected=249},{addr=0x19E9C9,uncollected=250},{addr=0x19E9CA,uncollected=169},{addr=0x19E9CB,uncollected=248},{addr=0x19E9CC,uncollected=28},{addr=0x19E9CD,uncollected=243},{addr=0x13FEF3,uncollected=16},{addr=0x13FEF5,uncollected=16},{addr=0x13FEF7,uncollected=16},{addr=0x140093,uncollected=16},{addr=0x140095,uncollected=16},{addr=0x140097,uncollected=16},{addr=0x13AE56,uncollected=73},{addr=0x13AE92,uncollected=73}},
        hitboxes={{addr=0x0C9B54,uncollected=8},{addr=0x0C9B88,uncollected=8}},
        sizes={}, usability={0x0C7AB1,0x0C7951} },
    [0x1FF999] = { level=7,
        containers={{addr=0x168EA5,uncollected=16},{addr=0x168EA9,uncollected=240},{addr=0x137D13,uncollected=16},{addr=0x137D15,uncollected=16},{addr=0x137D17,uncollected=16},{addr=0x168EA1,uncollected=16},{addr=0x168EB7,uncollected=128},{addr=0x168EB6,uncollected=10},{addr=0x13458A,uncollected=73}},
        hitboxes={{addr=0x0C9C8C,uncollected=8}},
        sizes={}, usability={0x0C7881} },
    [0x1FF99A] = { level=7,
        containers={{addr=0x16A38C,uncollected=224},{addr=0x16A38D,uncollected=254},{addr=0x16A38E,uncollected=9},{addr=0x16A390,uncollected=245},{addr=0x16A391,uncollected=15},{addr=0x16A392,uncollected=7},{addr=0x16A394,uncollected=1},{addr=0x16A395,uncollected=16},{addr=0x16A396,uncollected=248},{addr=0x16A397,uncollected=255},{addr=0x16A398,uncollected=9},{addr=0x16A399,uncollected=240},{addr=0x16A39A,uncollected=6},{addr=0x16A39C,uncollected=224},{addr=0x16A39D,uncollected=254},{addr=0x16A3A4,uncollected=36},{addr=0x16A3A5,uncollected=75},{addr=0x135002,uncollected=73}},
        hitboxes={{addr=0x0C9D28,uncollected=8}},
        sizes={}, usability={0x0C78B1} },
    [0x1FF99B] = { level=7,
        containers={{addr=0x169AA8,uncollected=231},{addr=0x169AA9,uncollected=252},{addr=0x169AAD,uncollected=16},{addr=0x169AB0,uncollected=25},{addr=0x169AB1,uncollected=3},{addr=0x169AB4,uncollected=178},{addr=0x169AB5,uncollected=15},{addr=0x134B8E,uncollected=73},{addr=0x169AA5,uncollected=15}},
        hitboxes={{addr=0x0C9CC0,uncollected=8}},
        sizes={}, usability={0x0C7891} },
    [0x1FF99C] = { level=8,
        containers={{addr=0x170739,uncollected=254},{addr=0x17073C,uncollected=240},{addr=0x17073D,uncollected=15},{addr=0x17073E,uncollected=7},{addr=0x170741,uncollected=16},{addr=0x170742,uncollected=1},{addr=0x170744,uncollected=16},{addr=0x170745,uncollected=240},{addr=0x170746,uncollected=7},{addr=0x170748,uncollected=155},{addr=0x170749,uncollected=254},{addr=0x13661E,uncollected=73}},
        hitboxes={{addr=0x0C97E0,uncollected=8}},
        sizes={{addr=0x13A1B7,collected=32},{addr=0x13A1B9,collected=32},{addr=0x13A1BB,collected=32}},
        usability={0x0C7811} },
    [0x1FF99D] = { level=10,
        containers={{addr=0x13BE73,uncollected=16},{addr=0x13BE75,uncollected=16},{addr=0x13BE77,uncollected=16},{addr=0x1393F2,uncollected=73}},
        hitboxes={{addr=0x0C9CF4,uncollected=8}},
        sizes={}, usability={0x0C77A1} },
    [0x1FF99E] = { level=11,
        containers={{addr=0x14532F,uncollected=16},{addr=0x145331,uncollected=16},{addr=0x145333,uncollected=16},{addr=0x13FD22,uncollected=73}},
        hitboxes={{addr=0x0C9D5C,uncollected=8}},
        sizes={{addr=0x144EFF,collected=32},{addr=0x144F01,collected=32},{addr=0x144F03,collected=32}},
        usability={0x0C7841} },
    [0x1FF99F] = { level=13,
        containers={{addr=0x19643D,uncollected=16},{addr=0x196441,uncollected=16},{addr=0x1977ED,uncollected=240},{addr=0x1977F0,uncollected=1},{addr=0x1977F1,uncollected=16},{addr=0x1448AA,uncollected=73},{addr=0x145282,uncollected=73},{addr=0x1488EB,uncollected=16},{addr=0x1488ED,uncollected=16},{addr=0x1488EF,uncollected=16},{addr=0x148FD3,uncollected=16},{addr=0x148FD5,uncollected=16},{addr=0x148FD7,uncollected=16},{addr=0x195F5E,uncollected=129},{addr=0x196445,uncollected=240},{addr=0x1977F5,uncollected=16}},
        hitboxes={{addr=0x0C99B4,uncollected=8},{addr=0x0C9980,uncollected=8}},
        sizes={}, usability={0x0C7871,0x0C7881} },
    [0x1FF9A0] = { level=14,
        containers={{addr=0x186C40,uncollected=250},{addr=0x186C41,uncollected=255},{addr=0x186C45,uncollected=16},{addr=0x186C46,uncollected=7},{addr=0x186C49,uncollected=16},{addr=0x187191,uncollected=15},{addr=0x187194,uncollected=251},{addr=0x187195,uncollected=250},{addr=0x187199,uncollected=16},{addr=0x1871A1,uncollected=15},{addr=0x187190,uncollected=49},{addr=0x18719C,uncollected=5},{addr=0x18719D,uncollected=5},{addr=0x186D80,uncollected=87},{addr=0x186D81,uncollected=249},{addr=0x186D82,uncollected=3},{addr=0x186D84,uncollected=116},{addr=0x186D85,uncollected=241},{addr=0x186D86,uncollected=1},{addr=0x186D88,uncollected=1},{addr=0x186D89,uncollected=16},{addr=0x186D8A,uncollected=3},{addr=0x186D8C,uncollected=140},{addr=0x186D8D,uncollected=14},{addr=0x186CE1,uncollected=241},{addr=0x186CE4,uncollected=182},{addr=0x186CE5,uncollected=5},{addr=0x186CE6,uncollected=3},{addr=0x186CE9,uncollected=16},{addr=0x186CEA,uncollected=7},{addr=0x186CEC,uncollected=74},{addr=0x186CED,uncollected=250},{addr=0x186CEE,uncollected=7},{addr=0x186CF1,uncollected=241},{addr=0x186EC1,uncollected=15},{addr=0x186EC4,uncollected=94},{addr=0x186EC5,uncollected=5},{addr=0x186EC9,uncollected=16},{addr=0x186ECC,uncollected=162},{addr=0x186ECD,uncollected=250},{addr=0x186ED0,uncollected=18},{addr=0x186ED1,uncollected=15},{addr=0x186BC9,uncollected=14},{addr=0x186BCC,uncollected=94},{addr=0x186BCD,uncollected=7},{addr=0x186BD1,uncollected=16},{addr=0x186BD4,uncollected=162},{addr=0x186BD5,uncollected=248},{addr=0x186BD8,uncollected=51},{addr=0x186BD9,uncollected=14},{addr=0x186F39,uncollected=13},{addr=0x186F3C,uncollected=28},{addr=0x186F3D,uncollected=247},{addr=0x186F41,uncollected=16},{addr=0x186F44,uncollected=228},{addr=0x186F45,uncollected=8},{addr=0x186DD1,uncollected=5},{addr=0x186DD4,uncollected=14},{addr=0x186DD5,uncollected=241},{addr=0x186DD9,uncollected=16},{addr=0x186DDC,uncollected=242},{addr=0x186DDD,uncollected=14},{addr=0x186DE0,uncollected=182},{addr=0x186DE1,uncollected=5},{addr=0x186FB1,uncollected=5},{addr=0x186FB4,uncollected=10},{addr=0x186FB5,uncollected=15},{addr=0x186FB9,uncollected=16},{addr=0x186FBC,uncollected=246},{addr=0x186FBD,uncollected=240},{addr=0x186FC0,uncollected=117},{addr=0x186FC1,uncollected=5},{addr=0x186D31,uncollected=241},{addr=0x186D32,uncollected=7},{addr=0x186D34,uncollected=132},{addr=0x186D35,uncollected=249},{addr=0x186D36,uncollected=5},{addr=0x186D38,uncollected=1},{addr=0x186D39,uncollected=16},{addr=0x186D3A,uncollected=7},{addr=0x186D3C,uncollected=124},{addr=0x186D3D,uncollected=6},{addr=0x186D30,uncollected=96},{addr=0x187000,uncollected=255},{addr=0x187001,uncollected=14},{addr=0x187004,uncollected=109},{addr=0x187005,uncollected=250},{addr=0x187009,uncollected=16},{addr=0x18700C,uncollected=147},{addr=0x18700D,uncollected=5},{addr=0x187010,uncollected=255},{addr=0x187011,uncollected=14},{addr=0x186C95,uncollected=12},{addr=0x186C96,uncollected=6},{addr=0x186C99,uncollected=16},{addr=0x186C9A,uncollected=5},{addr=0x186C9C,uncollected=65},{addr=0x186C9D,uncollected=243},{addr=0x186C9E,uncollected=7},{addr=0x186CA0,uncollected=85},{addr=0x186CA1,uncollected=246},{addr=0x186C4D,uncollected=240},{addr=0x186C91,uncollected=246},{addr=0x186D41,uncollected=241},{addr=0x186D91,uncollected=249},{addr=0x186F49,uncollected=13},{addr=0x186BA1,uncollected=9},{addr=0x186BA5,uncollected=12},{addr=0x186BA9,uncollected=16},{addr=0x186BAD,uncollected=243},{addr=0x186BB1,uncollected=9}},
        hitboxes={{addr=0x0C987C,uncollected=8},{addr=0x0C9744,uncollected=8},{addr=0x0C9918,uncollected=8},{addr=0x0C98B0,uncollected=8},{addr=0x0C9980,uncollected=8},{addr=0x0C97AC,uncollected=8},{addr=0x0C9710,uncollected=8},{addr=0x0C98E4,uncollected=8},{addr=0x0C97E0,uncollected=8},{addr=0x0C9848,uncollected=8},{addr=0x0C994C,uncollected=8},{addr=0x0C9814,uncollected=8},{addr=0x0C9778,uncollected=8}},
        sizes={},
        usability={0x0C77E1,0x0C78B1,0x0C7801,0x0C78A1,0x0C77D1,0x0C77A1,0x0C7811,0x0C77F1,0x0C7871,0x0C77B1,0x0C7881,0x0C7821,0x0C77C1} },
}

local TOYS = {
    [1]  = {{addr=0x0C3244,uncollected=6},{addr=0x0C32DC,uncollected=6},{addr=0x0C3114,uncollected=6},{addr=0x0C307C,uncollected=6},{addr=0x0C31AC,uncollected=6}},
    [2]  = {{addr=0x0C3114,uncollected=13},{addr=0x0C2FE4,uncollected=13},{addr=0x0C31AC,uncollected=13},{addr=0x0C2F4C,uncollected=13},{addr=0x0C307C,uncollected=13}},
    [4]  = {{addr=0x0C3834,uncollected=19},{addr=0x0C3D8C,uncollected=19},{addr=0x0C379C,uncollected=19},{addr=0x0C39FC,uncollected=19},{addr=0x0C3BC4,uncollected=19}},
    [5]  = {{addr=0x0C3CF4,uncollected=43},{addr=0x0C3D8C,uncollected=43},{addr=0x0C3C5C,uncollected=43},{addr=0x0C3B2C,uncollected=43},{addr=0x0C3E24,uncollected=43}},
    [7]  = {{addr=0x0C3244,uncollected=28},{addr=0x0C3114,uncollected=28},{addr=0x0C31AC,uncollected=28},{addr=0x0C2FE4,uncollected=28},{addr=0x0C307C,uncollected=28}},
    [8]  = {{addr=0x0C31AC,uncollected=38},{addr=0x0C3244,uncollected=38},{addr=0x0C307C,uncollected=38},{addr=0x0C32DC,uncollected=38},{addr=0x0C3114,uncollected=38}},
    [10] = {{addr=0x0C2F4C,uncollected=23},{addr=0x0C31AC,uncollected=23},{addr=0x0C307C,uncollected=23},{addr=0x0C2FE4,uncollected=23},{addr=0x0C3114,uncollected=23}},
    [11] = {{addr=0x0C307C,uncollected=40},{addr=0x0C3244,uncollected=40},{addr=0x0C31AC,uncollected=40},{addr=0x0C32DC,uncollected=40},{addr=0x0C3114,uncollected=40}},
    [13] = {{addr=0x0C3114,uncollected=50},{addr=0x0C2EB4,uncollected=50},{addr=0x0C2FE4,uncollected=52},{addr=0x0C307C,uncollected=51},{addr=0x0C2F4C,uncollected=51}},
    [14] = {{addr=0x0C483C,uncollected=59},{addr=0x0C470C,uncollected=59},{addr=0x0C48D4,uncollected=59},{addr=0x0C47A4,uncollected=59},{addr=0x0C496C,uncollected=59}},
}

local DIALOG_SIGNATURES = {
    potato_uncollected = {
        [1]={0x68,0x65,0x79,0x20,0x62,0x75,0x7A,0x7A,0x21,0x20,0x79,0x6F,0x75,0x20,0x6E},
        [4]={0x68,0x69,0x20,0x62,0x75,0x7A,0x7A,0x21,0x20,0x79,0x6F,0x75,0x20,0x6E,0x65},
        [7]={0x68,0x69,0x20,0x62,0x75,0x7A,0x7A,0x21,0x20,0x79,0x6F,0x75,0x20,0x6E,0x65},
        [10]={0x68,0x69,0x20,0x62,0x75,0x7A,0x7A,0x21,0x20,0x79,0x6F,0x75,0x20,0x6E,0x65},
        [13]={0x6D,0x6D,0x6D,0x2E,0x2E,0x20,0x6D,0x75,0x6D,0x70,0x66,0x21,0x20,0x6D,0x6D},
    },
    potato_collected1 = {0x77,0x6F,0x77,0x21,0x20,0x74,0x68,0x61,0x6E,0x6B,0x73,0x20,0x62,0x75,0x7A},
    potato_collected2 = {
        [1]={0x74,0x68,0x65,0x20,0x5E,0x63,0x6F,0x73,0x6D,0x69,0x63,0x20,0x73,0x68,0x69},
        [4]={0x74,0x68,0x65,0x20,0x5E,0x64,0x69,0x73,0x6B,0x20,0x6C,0x61,0x75,0x6E,0x63},
        [7]={0x74,0x68,0x65,0x20,0x5E,0x72,0x6F,0x63,0x6B,0x65,0x74,0x20,0x62,0x6F,0x6F},
        [10]={0x77,0x69,0x74,0x68,0x20,0x74,0x68,0x65,0x20,0x5E,0x67,0x72,0x61,0x70,0x70},
        [13]={0x77,0x69,0x74,0x68,0x20,0x74,0x68,0x65,0x20,0x5E,0x68,0x6F,0x76,0x65,0x72},
    },
    hamm_uncollected={0x68,0x69,0x20,0x62,0x75,0x7A,0x7A,0x21,0x20,0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x62,0x72,0x69,0x6E,0x67,0x20,0x6D,0x65,0x20,0x5E,0x66,0x69,0x66,0x74,0x79,0x5E},
    hamm_collected={0x77,0x65,0x6C,0x6C,0x20,0x64,0x6F,0x6E,0x65,0x20,0x62,0x75,0x7A,0x7A,0x21},
}

local NEW_DIALOG = {
    potato_uncollected = {
        [1]="hey buzz! you need an ^ap item^? find my missing ^ear^ and i'll give you    one!",
        [4]="hey buzz! you need an ^ap item^? find my missing ^eye^ and i'll give you    one!",
        [7]="hey buzz! you need an ^ap item^? find my missing ^arm^ and i'll give you    one!",
        [10]="hey buzz! you need an ^ap item^? find my missing ^foot^ and i'll give you   one!",
        [13]="mmm.. mumph! mmmmu mo mmmme ^ap item^ mmmm mub ^mouth^ mmum mi mo mmmump!",
    },
    potato_collected1 = {
        [1]="wow! thanks buzz! in return for     finding my ^ear^ i'll let you have    this ^ap item^!",
        [4]="wow! thanks buzz! in return for     finding my ^eye^ i'll let you have    this ^ap item^!",
        [7]="wow! thanks buzz! in return for     finding my ^arm^ i'll let you have    this ^ap item^!",
        [10]="wow! thanks buzz! in return for     finding my ^foot^ i'll let you have   this ^ap item^!",
        [13]="wow! thanks buzz! in return for     finding my ^mouth^ i'll let you have  this ^ap item^!",
    },
    potato_collected2 = {
        "sorry, buzz. i only had one! but    hey, if you help me out again, i mayhave something ^special^ for you.",
        "hey uh... buzz. don't tell the mrs. i gave you that... she'd be real    cross with me and i don't really    want to hear it today...",
        "please...",
    },
    hamm_uncollected1="^useful^, ^filler^, ^progressive^? you    want it? it's yours, my friend.     as long as you have enough ^coinage^.",
    hamm_uncollected2="sorry, buzz. i can't give ^credit^!   come back when you're a little...   mmmmmmm... ^richer^!",
    hamm_collected="well done buzz! here is your ^ap     item^!",
}

-- ============================================================
-- SANITY DATA
-- ============================================================
local BATTERIES = {
    [1]={{addr=0x146596,uncollected=73},{addr=0x148D46,uncollected=73},{addr=0x149B56,uncollected=73},{addr=0x146EBA,uncollected=73},{addr=0x147CCA,uncollected=73},{addr=0x147DF6,uncollected=73}},
    [2]={{addr=0x13B7FA,uncollected=73},{addr=0x13BF8E,uncollected=73},{addr=0x13B4DA,uncollected=73},{addr=0x13C5F6,uncollected=73},{addr=0x13C5E2,uncollected=73}},
    [6]={{addr=0x107CD6,uncollected=73},{addr=0x107CEA,uncollected=73},{addr=0x107CFE,uncollected=73},{addr=0x107D12,uncollected=73}},
    [4]={{addr=0x139736,uncollected=73},{addr=0x1395A6,uncollected=73},{addr=0x1395BA,uncollected=73},{addr=0x1395CE,uncollected=73}},
    [5]={{addr=0x13ADB6,uncollected=73},{addr=0x13ADCA,uncollected=73},{addr=0x13ADA2,uncollected=73}},
    [7]={{addr=0x1344AE,uncollected=73},{addr=0x1344C2,uncollected=73},{addr=0x135516,uncollected=73},{addr=0x134B7A,uncollected=73},{addr=0x134C2E,uncollected=73}},
    [8]={{addr=0x135A52,uncollected=73},{addr=0x135A3E,uncollected=73},{addr=0x135A16,uncollected=73},{addr=0x135A2A,uncollected=73},{addr=0x135A02,uncollected=73}},
    [9]={{addr=0x11F12E,uncollected=73},{addr=0x11F106,uncollected=73},{addr=0x11F11A,uncollected=73},{addr=0x11F0F2,uncollected=73}},
    [11]={{addr=0x13CFFA,uncollected=73},{addr=0x13F99E,uncollected=73},{addr=0x13F0F2,uncollected=73},{addr=0x13E7CE,uncollected=73},{addr=0x13DD92,uncollected=73}},
    [13]={{addr=0x14477E,uncollected=73},{addr=0x144DFA,uncollected=73},{addr=0x144792,uncollected=73}},
    [14]={{addr=0x13A6A6,uncollected=73},{addr=0x13A732,uncollected=73},{addr=0x13A6CE,uncollected=73},{addr=0x13A6BA,uncollected=73},{addr=0x13A692,uncollected=73}},
}
local LIVES = {
    [1]={{addr=0x146532,uncollected=73},{addr=0x147DCE,uncollected=73},{addr=0x1470D6,uncollected=73}},
    [2]={{addr=0x13C60A,uncollected=73}},
    [4]={{addr=0x1397AE,uncollected=9},{addr=0x1393B2,uncollected=9}},
    [5]={{addr=0x13AD66,uncollected=73},{addr=0x13AD8E,uncollected=73},{addr=0x13AD7A,uncollected=73}},
    [7]={{addr=0x13543A,uncollected=73}},
    [8]={{addr=0x1359EE,uncollected=73}},
    [11]={{addr=0x13CFE6,uncollected=73}},
    [14]={{addr=0x13A796,uncollected=73}},
}
local LASERS_SANITY = {
    [1]={{addr=0x14719E,uncollected=73}},
    [2]={{addr=0x13C02E,uncollected=73}},
    [3]={{addr=0x10AF02,uncollected=73}},
    [4]={{addr=0x139592,uncollected=9}},
    [5]={{addr=0x13BE5A,uncollected=73}},
    [7]={{addr=0x1345DA,uncollected=73}},
    [8]={{addr=0x136B5A,uncollected=73}},
    [10]={{addr=0x138B5A,uncollected=73}},
    [11]={{addr=0x13CF96,uncollected=73}},
    [13]={{addr=0x145372,uncollected=73}},
    [14]={{addr=0x13A836,uncollected=73}},
}
for lvl,_ in pairs(BATTERIES) do battery_masks[lvl]=0 end
for lvl,_ in pairs(LIVES)     do life_masks[lvl]=0 end
for lvl,_ in pairs(LASERS_SANITY) do laser_masks[lvl]=0 end

-- ============================================================
-- REX DATA
-- ============================================================
local REX_LEVEL_TO_BIT = {
    [1]={addr=0x1FF9C4,bit=0},[2]={addr=0x1FF9C4,bit=1},
    [4]={addr=0x1FF9C4,bit=2},[5]={addr=0x1FF9C4,bit=3},
    [7]={addr=0x1FF9C4,bit=4},[8]={addr=0x1FF9C4,bit=5},
    [10]={addr=0x1FF9C5,bit=0},[11]={addr=0x1FF9C5,bit=1},
    [13]={addr=0x1FF9C5,bit=2},[14]={addr=0x1FF9C5,bit=3},
}

function make_text(bytes, len)
    local r={}
    for i=1,len do
        if i<=#bytes then r[i]=bytes[i]
        elseif i==#bytes+1 then r[i]=0x00
        else r[i]=0x20 end
    end
    return r
end
local TEXT_LENGTH=280
local TEXT_AP_ITEM=make_text({0x63,0x6F,0x6E,0x67,0x72,0x61,0x74,0x75,0x6C,0x61,0x74,0x69,0x6F,0x6E,0x73,0x20,0x6F,0x6E,0x20,0x66,0x69,0x6E,0x64,0x69,0x6E,0x67,0x20,0x6D,0x65,0x20,0x62,0x75,0x7A,0x7A,0x21,0x20,0x68,0x61,0x76,0x65,0x20,0x61,0x6E,0x20,0x5E,0x61,0x70,0x20,0x69,0x74,0x65,0x6D,0x5E,0x21},TEXT_LENGTH)
local TEXT_SORRY=make_text({0x73,0x6F,0x72,0x72,0x79,0x20,0x62,0x75,0x7A,0x7A,0x2C,0x20,0x74,0x68,0x61,0x74,0x20,0x77,0x61,0x73,0x20,0x61,0x6C,0x6C,0x20,0x69,0x20,0x68,0x61,0x64,0x21,0x20,0x20,0x20,0x20,0x20,0x66,0x69,0x6E,0x64,0x20,0x6D,0x65,0x20,0x69,0x6E,0x20,0x61,0x6E,0x6F,0x74,0x68,0x65,0x72,0x20,0x6C,0x65,0x76,0x65,0x6C,0x21},TEXT_LENGTH)
local TEXT_BUSY=make_text({0x62,0x75,0x7A,0x7A,0x20,0x63,0x61,0x6E,0x27,0x74,0x20,0x79,0x6F,0x75,0x20,0x73,0x65,0x65,0x20,0x69,0x27,0x6D,0x20,0x62,0x75,0x73,0x79,0x20,0x73,0x74,0x61,0x6E,0x64,0x69,0x6E,0x67,0x61,0x72,0x6F,0x75,0x6E,0x64,0x20,0x73,0x68,0x6F,0x75,0x74,0x69,0x6E,0x67,0x20,0x61,0x74,0x20,0x79,0x6F,0x75,0x21,0x20,0x67,0x6F,0x20,0x62,0x6F,0x74,0x68,0x65,0x72,0x20,0x20,0x20,0x5E,0x68,0x61,0x6D,0x6D,0x5E,0x20,0x6F,0x72,0x20,0x73,0x6F,0x6D,0x65,0x74,0x68,0x69,0x6E,0x67,0x2E,0x2E,0x2E},TEXT_LENGTH)
local TEXT_BKD=make_text({0x62,0x75,0x7A,0x7A,0x20,0x61,0x72,0x65,0x20,0x79,0x6F,0x75,0x20,0x5E,0x62,0x6B,0x27,0x64,0x5E,0x3F,0x20,0x69,0x73,0x20,0x74,0x68,0x61,0x74,0x20,0x77,0x68,0x79,0x20,0x79,0x6F,0x75,0x20,0x20,0x6B,0x65,0x65,0x70,0x20,0x74,0x61,0x6C,0x6B,0x69,0x6E,0x67,0x20,0x74,0x6F,0x20,0x6D,0x65,0x3F},TEXT_LENGTH)
local TEXT_DOTS=make_text({0x2E,0x2E,0x2E},TEXT_LENGTH)
local EVERY_TOKEN_SIG={0x68,0x65,0x79,0x21,0x20,0x79,0x6F,0x75,0x20,0x68}
local LEVEL_SIGNATURES = {
    [1]={{0x5E,0x62,0x6F,0x20,0x70,0x65,0x65,0x70,0x5E,0x20},{0x5E,0x72,0x2E,0x63,0x2E,0x20,0x63,0x61,0x72,0x5E},{0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x6D,0x6F},{0x74,0x68,0x65,0x20,0x5E,0x74,0x69,0x6E,0x20,0x72},{0x5E,0x68,0x61,0x6D,0x6D,0x5E,0x20,0x69,0x73,0x20}},
    [2]={{0x5E,0x73,0x61,0x72,0x67,0x65,0x5E,0x20,0x68,0x61},{0x5E,0x72,0x2E,0x63,0x2E,0x20,0x63,0x61,0x72,0x5E},{0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x69,0x6E},{0x74,0x68,0x65,0x20,0x5E,0x6B,0x69,0x74,0x65,0x20},{0x5E,0x68,0x61,0x6D,0x6D,0x5E,0x20,0x69,0x73,0x20}},
    [4]={{0x69,0x20,0x74,0x68,0x69,0x6E,0x6B,0x20,0x69,0x20},{0x74,0x68,0x65,0x20,0x5E,0x66,0x6F,0x72,0x65,0x6D},{0x5E,0x73,0x6C,0x69,0x6E,0x6B,0x79,0x5E,0x20,0x69},{0x74,0x68,0x65,0x72,0x65,0x20,0x69,0x73,0x20,0x61},{0x74,0x68,0x65,0x20,0x5E,0x6A,0x61,0x63,0x6B,0x68}},
    [5]={{0x74,0x68,0x65,0x72,0x65,0x20,0x69,0x73,0x20,0x61},{0x74,0x68,0x65,0x20,0x5E,0x63,0x6C,0x6F,0x77,0x6E},{0x69,0x20,0x73,0x61,0x77,0x20,0x5E,0x68,0x61,0x6D},{0x74,0x68,0x65,0x20,0x5E,0x6D,0x6F,0x74,0x68,0x65},{0x5E,0x73,0x6C,0x69,0x6E,0x6B,0x79,0x5E,0x20,0x68}},
    [7]={{0x74,0x68,0x65,0x20,0x5E,0x72,0x6F,0x6F,0x73,0x74},{0x74,0x68,0x65,0x72,0x65,0x20,0x69,0x73,0x20,0x61},{0x74,0x68,0x65,0x20,0x5E,0x64,0x69,0x6E,0x6F,0x73},{0x69,0x20,0x73,0x61,0x77,0x20,0x5E,0x68,0x61,0x6D},{0x74,0x68,0x65,0x20,0x5E,0x63,0x68,0x69,0x63,0x6B}},
    [8]={{0x74,0x68,0x65,0x72,0x65,0x20,0x69,0x73,0x20,0x61},{0x74,0x68,0x65,0x20,0x5E,0x62,0x75,0x7A,0x7A,0x20},{0x69,0x20,0x73,0x61,0x77,0x20,0x5E,0x68,0x61,0x6D},{0x74,0x68,0x65,0x20,0x5E,0x6D,0x6F,0x74,0x68,0x65},{0x74,0x68,0x65,0x72,0x65,0x20,0x69,0x73,0x20,0x61}},
    [10]={{0x5E,0x6D,0x6F,0x74,0x68,0x65,0x72,0x20,0x6D,0x6F},{0x5E,0x66,0x61,0x74,0x68,0x65,0x72,0x20,0x6D,0x6F},{0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x61,0x63},{0x74,0x68,0x65,0x20,0x5E,0x73,0x70,0x69,0x64,0x65},{0x5E,0x68,0x61,0x6D,0x6D,0x5E,0x20,0x69,0x73,0x20}},
    [11]={{0x5E,0x62,0x75,0x6C,0x6C,0x73,0x65,0x79,0x65,0x5E},{0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x67,0x65},{0x74,0x68,0x65,0x20,0x5E,0x67,0x75,0x6E,0x73,0x6C},{0x5E,0x68,0x61,0x6D,0x6D,0x5E,0x20,0x69,0x73,0x20},{0x5E,0x6A,0x65,0x73,0x73,0x65,0x5E,0x20,0x68,0x61}},
    [13]={{0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x67,0x65},{0x74,0x68,0x65,0x20,0x5E,0x70,0x72,0x6F,0x73,0x70},{0x5E,0x68,0x61,0x6D,0x6D,0x5E,0x20,0x69,0x73,0x20},{0x74,0x68,0x65,0x20,0x5E,0x6C,0x69,0x74,0x74,0x6C},{0x5E,0x72,0x6F,0x63,0x6B,0x79,0x20,0x67,0x69,0x6C}},
    [14]={{0x74,0x68,0x65,0x72,0x65,0x20,0x69,0x73,0x20,0x61},{0x74,0x68,0x65,0x20,0x5E,0x62,0x6C,0x61,0x63,0x6B},{0x69,0x20,0x74,0x68,0x69,0x6E,0x6B,0x20,0x69,0x20},{0x74,0x68,0x65,0x20,0x5E,0x61,0x69,0x72,0x70,0x6F},{0x5E,0x73,0x6C,0x69,0x6E,0x6B,0x79,0x5E,0x20,0x68}},
}
for lid,_ in pairs(LEVEL_SIGNATURES) do rex_state[lid]=0 end

-- ============================================================
-- HINT BLOCK SANITY
-- ============================================================
-- Hint blocks work exactly like Rex: when the player touches one, the game opens
-- a dialog (same buffer as Rex, A.REX_TEXT). We match the block's unique text
-- signature, send its check, and rewrite the dialog with our own text including a
-- running per-level found counter. They do NOT despawn — re-touching shows the
-- "already found" dialog. Signatures are 28 bytes (10 was not enough; two blocks
-- in a level can share a long prefix, e.g. Al's Penthouse Bathtub/Train Bed).
-- Current-level scoped shared bytes (1 byte each, like the despawn seeds):
--   HINT_MASK_ADDR : Lua -> client (u16). Bit i set = block i of the CURRENT
--                    level was touched this session. The client maps bits to the
--                    current level's hint locations and sends the checks, deduped
--                    against its checked_locations. u16 because Andy's House has 9
--                    blocks (bit 8 would be truncated by a byte). Kept in the safe
--                    Lua-managed 0x1FF9xx region (the only region the Lua zeroes on
--                    init/entry; an address above the feed buffer held game garbage
--                    on load and fired phantom checks).
-- No separate server "seed" feeds the published mask. The client dedups hint
-- sends against checked_locations, so re-touching an already-checked block can't
-- double-send. A read-only SEED (client -> Lua, published every tick from
-- checked_locations) is used ONLY for the dialog wording and the found counter so
-- they stay correct across resets. Because the seed never feeds the published
-- mask, a stale/garbage read of it can never cause a phantom check (worst case is
-- briefly-wrong dialog text, which the client's per-tick rewrite corrects).
HINT_MASK_ADDR = 0x1FF9C2
HINT_SEED_ADDR = 0x1FFA83
HINT_BLOCKS = {
    [1] = {
        {name="Andy's Room Bookshelf", sig={0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x73,0x65,0x65,0x20,0x74,0x68,0x65,0x20,0x5E,0x70,0x75,0x73,0x68,0x5E,0x20,0x69,0x63,0x6F,0x6E,0x20,0x79}},
        {name="Andy's Room Bed", sig={0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x70,0x72,0x65,0x73,0x73,0x20,0x74,0x68,0x65,0x20,0x6A,0x75,0x6D,0x70,0x20,0x62,0x75,0x74,0x74,0x6F,0x6E}},
        {name="Andy's Room Dresser Shelf", sig={0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x6A,0x75,0x6D,0x70,0x20,0x6F,0x6E,0x74,0x6F,0x20,0x7A,0x69,0x70,0x20,0x6C,0x69,0x6E,0x65,0x73,0x20}},
        {name="Andy's Room Crib", sig={0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x74,0x61,0x72,0x67,0x65,0x74,0x20,0x79,0x6F,0x75,0x72,0x20,0x6C,0x61,0x73,0x65,0x72,0x20,0x62,0x79}},
        {name="Top of Stairs", sig={0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x67,0x72,0x61,0x62,0x20,0x6F,0x6E,0x74,0x6F,0x20,0x70,0x6F,0x6C,0x65,0x73,0x2E,0x20,0x77,0x68,0x65}},
        {name="Attic", sig={0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x70,0x72,0x65,0x73,0x73,0x20,0x74,0x68,0x65,0x20,0x66,0x69,0x72,0x65,0x20,0x62,0x75,0x74,0x74,0x6F,0x6E}},
        {name="Bottom of Stairs", sig={0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x63,0x68,0x61,0x6E,0x67,0x65,0x20,0x63,0x61,0x6D,0x65,0x72,0x61,0x20,0x6D,0x6F,0x64,0x65,0x20,0x75}},
        {name="Top of Garage", sig={0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x6A,0x75,0x6D,0x70,0x20,0x61,0x74,0x20,0x61,0x20,0x68,0x6F,0x72,0x69,0x7A,0x6F,0x6E,0x74,0x61,0x6C,0x20}},
        {name="Living Room Recliner", sig={0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x66,0x6F,0x6F,0x74,0x20,0x5E,0x73,0x74,0x6F,0x6D,0x70,0x5E,0x20,0x77,0x68,0x65,0x72,0x65,0x20,0x79}},
    },
    [2] = {
        {name="Lawnmower Yard", sig={0x74,0x68,0x65,0x20,0x73,0x6F,0x6C,0x64,0x69,0x65,0x72,0x20,0x77,0x69,0x6C,0x6C,0x20,0x73,0x75,0x72,0x72,0x65,0x6E,0x64,0x65,0x72,0x20,0x69}},
    },
    [4] = {
        {name="Paint Can Room", sig={0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x63,0x61,0x6E,0x20,0x6D,0x69,0x78,0x20,0x74,0x68,0x65,0x20,0x74,0x68,0x65,0x20,0x70,0x61,0x69,0x6E,0x74}},
    },
    [7] = {
        {name="Hay Bale Ride", sig={0x74,0x68,0x65,0x20,0x5E,0x68,0x61,0x79,0x20,0x62,0x61,0x6C,0x65,0x20,0x72,0x69,0x64,0x65,0x5E,0x20,0x77,0x69,0x6C,0x6C,0x20,0x62,0x75,0x63}},
    },
    [10] = {
        {name="East Shortcut Fan", sig={0x74,0x68,0x65,0x20,0x73,0x77,0x69,0x74,0x63,0x68,0x20,0x61,0x74,0x20,0x74,0x68,0x65,0x20,0x74,0x6F,0x70,0x20,0x6F,0x66,0x20,0x74,0x68,0x65}},
        {name="West Shortcut Fan", sig={0x74,0x68,0x65,0x20,0x73,0x77,0x69,0x74,0x63,0x68,0x20,0x69,0x6E,0x20,0x74,0x68,0x65,0x20,0x63,0x6F,0x6E,0x74,0x72,0x6F,0x6C,0x20,0x72,0x6F}},
        {name="Control Room", sig={0x69,0x66,0x20,0x79,0x6F,0x75,0x20,0x6C,0x69,0x6E,0x65,0x20,0x75,0x70,0x20,0x74,0x68,0x65,0x20,0x5E,0x77,0x69,0x72,0x65,0x5E,0x20,0x79,0x6F}},
    },
    [11] = {
        {name="Bathtub", sig={0x5E,0x73,0x74,0x6F,0x6D,0x70,0x5E,0x20,0x74,0x68,0x65,0x20,0x62,0x75,0x74,0x74,0x6F,0x6E,0x73,0x20,0x74,0x6F,0x20,0x72,0x61,0x69,0x73,0x65}},
        {name="Train Bed", sig={0x5E,0x73,0x74,0x6F,0x6D,0x70,0x5E,0x20,0x74,0x68,0x65,0x20,0x62,0x75,0x74,0x74,0x6F,0x6E,0x73,0x20,0x74,0x6F,0x20,0x63,0x68,0x61,0x6E,0x67}},
    },
    [14] = {
        {name="Light Puzzle", sig={0x75,0x73,0x65,0x20,0x74,0x68,0x65,0x20,0x5E,0x62,0x75,0x74,0x74,0x6F,0x6E,0x73,0x5E,0x20,0x74,0x6F,0x20,0x63,0x68,0x61,0x6E,0x67,0x65,0x20}},
    },
}
-- In-session per-level found mask (bit i-1 = block i touched). Reset on init.
hint_lua_mask = {}
hint_triggered = false
was_hint_dialog_open = false

-- ============================================================
-- LEVEL LOCKING DATA
-- ============================================================
local LEVEL_NAME_DATA = {
    [7]={start=0x0E272C,original={0x61,0x6E,0x64,0x79,0x27,0x73,0x20,0x68,0x6F,0x75,0x73,0x65},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00}},
    [8]={start=0x0E273C,original={0x61,0x6E,0x64,0x79,0x27,0x73,0x20,0x6E,0x65,0x69,0x67,0x68,0x62,0x6F,0x72,0x68,0x6F,0x6F,0x64},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [9]={start=0x0E2750,original={0x62,0x6F,0x6D,0x62,0x73,0x20,0x61,0x77,0x61,0x79},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00}},
    [10]={start=0x0E275C,original={0x63,0x6F,0x6E,0x73,0x74,0x72,0x75,0x63,0x74,0x69,0x6F,0x6E,0x20,0x79,0x61,0x72,0x64},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [11]={start=0x0E2770,original={0x61,0x6C,0x6C,0x65,0x79,0x73,0x20,0x61,0x6E,0x64,0x20,0x67,0x75,0x6C,0x6C,0x69,0x65,0x73},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [12]={start=0x0E2784,original={0x73,0x6C,0x69,0x6D,0x65,0x20,0x74,0x69,0x6D,0x65},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00}},
    [13]={start=0x0E2790,original={0x61,0x6C,0x27,0x73,0x20,0x74,0x6F,0x79,0x20,0x62,0x61,0x72,0x6E},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [14]={start=0x0E27A0,original={0x61,0x6C,0x27,0x73,0x20,0x73,0x70,0x61,0x63,0x65,0x20,0x6C,0x61,0x6E,0x64},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [15]={start=0x0E27B0,original={0x74,0x6F,0x79,0x20,0x62,0x61,0x72,0x6E,0x20,0x65,0x6E,0x63,0x6F,0x75,0x6E,0x74,0x65,0x72},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [16]={start=0x0E27C4,original={0x65,0x6C,0x65,0x76,0x61,0x74,0x6F,0x72,0x20,0x68,0x6F,0x70},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00}},
    [17]={start=0x0E27D4,original={0x61,0x6C,0x27,0x73,0x20,0x70,0x65,0x6E,0x74,0x68,0x6F,0x75,0x73,0x65},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [18]={start=0x0E27E4,original={0x74,0x68,0x65,0x20,0x65,0x76,0x69,0x6C,0x20,0x65,0x6D,0x70,0x65,0x72,0x6F,0x72,0x20,0x7A,0x75,0x72,0x67},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [19]={start=0x0E27FC,original={0x61,0x69,0x72,0x70,0x6F,0x72,0x74,0x20,0x69,0x6E,0x66,0x69,0x6C,0x74,0x72,0x61,0x74,0x69,0x6F,0x6E},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [20]={start=0x0E2814,original={0x74,0x61,0x72,0x6D,0x61,0x63,0x20,0x74,0x72,0x6F,0x75,0x62,0x6C,0x65},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
    [21]={start=0x0E2824,original={0x66,0x69,0x6E,0x61,0x6C,0x20,0x73,0x68,0x6F,0x77,0x64,0x6F,0x77,0x6E,0x00,0x00},locked={0x6C,0x6F,0x63,0x6B,0x45,0x64,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}},
}
local TEXT_YOU_NEED_TOKENS={[0x0E2834]=0x79,[0x0E2835]=0x6F,[0x0E2836]=0x75,[0x0E2837]=0x20,[0x0E2838]=0x6E,[0x0E2839]=0x65,[0x0E283A]=0x65,[0x0E283B]=0x64,[0x0E283C]=0x20,[0x0E283D]=0x6D,[0x0E283E]=0x6F,[0x0E283F]=0x72,[0x0E2840]=0x65,[0x0E2841]=0x20,[0x0E2842]=0x74,[0x0E2843]=0x6F,[0x0E2844]=0x6B,[0x0E2845]=0x65,[0x0E2846]=0x6E,[0x0E2847]=0x73,[0x0E2848]=0x00,[0x0E2849]=0x00,[0x0E284A]=0x00}
local TEXT_MISSING_UNLOCK={[0x0E2834]=0x6D,[0x0E2835]=0x69,[0x0E2836]=0x73,[0x0E2837]=0x73,[0x0E2838]=0x69,[0x0E2839]=0x6E,[0x0E283A]=0x67,[0x0E283B]=0x20,[0x0E283C]=0x6C,[0x0E283D]=0x65,[0x0E283E]=0x76,[0x0E283F]=0x65,[0x0E2840]=0x6C,[0x0E2841]=0x20,[0x0E2842]=0x75,[0x0E2843]=0x6E,[0x0E2844]=0x6C,[0x0E2845]=0x6F,[0x0E2846]=0x63,[0x0E2847]=0x6B,[0x0E2848]=0x00,[0x0E2849]=0x00,[0x0E284A]=0x00}
local TEXT_MISSING_GOAL={[0x0E2834]=0x6D,[0x0E2835]=0x69,[0x0E2836]=0x73,[0x0E2837]=0x73,[0x0E2838]=0x69,[0x0E2839]=0x6E,[0x0E283A]=0x67,[0x0E283B]=0x20,[0x0E283C]=0x67,[0x0E283D]=0x6F,[0x0E283E]=0x61,[0x0E283F]=0x6C,[0x0E2840]=0x20,[0x0E2841]=0x63,[0x0E2842]=0x6F,[0x0E2843]=0x6E,[0x0E2844]=0x64,[0x0E2845]=0x69,[0x0E2846]=0x74,[0x0E2847]=0x69,[0x0E2848]=0x6F,[0x0E2849]=0x6E,[0x0E284A]=0x73}

-- Linear mode area definitions
local AREA_LEVELS = {
    [0]={regular={7,8},boss={9},locked={10,11,12,13,14,15,16,17,18,19,20,21}},
    [1]={regular={7,8,10,11},boss={12},special={9},locked={13,14,15,16,17,18,19,20,21}},
    [2]={regular={7,8,10,11,13,14},boss={9,12,15},keep_zero={15},locked={16,17,18,19,20,21}},
    [3]={regular={7,8,10,11,13,14,16,17},boss={9,12,15,18},keep_zero={18},locked={19,20,21}},
    [4]={regular={7,8,10,11,13,14,16,17,19,20},boss={9,12,15,18},locked={}},
}
local AREA_UNLOCKED = {
    [0]={7,8},[1]={7,8,10,11},[2]={7,8,10,11,13,14},
    [3]={7,8,10,11,13,14,16,17},[4]={7,8,10,11,13,14,16,17,19,20},
}
local BOSS_GATE = {[9]=1,[12]=2,[15]=3,[18]=4,[21]=5}
local BOSS_HOVER_GATE = {[9]=SHARED_GATE_1,[12]=SHARED_GATE_2,[15]=SHARED_GATE_3,[18]=SHARED_GATE_4}
local BIT_TO_NAME = {[1]="Hamm's 50 Coins Token",[2]="Missing Toys Token",[4]="Race Token",[8]="Hidden Token",[16]="Boss Token"}

-- ============================================================
-- HELPER FUNCTIONS
-- ============================================================

function write_gadget(gadget)
    for _,c in ipairs(gadget.containers) do mainmemory.write_u8(c.addr,c.uncollected) end
    for _,h in ipairs(gadget.hitboxes)   do mainmemory.write_u8(h.addr,h.uncollected) end
    for _,s in ipairs(gadget.sizes)      do mainmemory.write_u8(s.addr,16) end
    for _,u in ipairs(gadget.usability)  do mainmemory.write_u8(u,0) end
end

function unlock_gadget(gadget)
    for _,c in ipairs(gadget.containers) do mainmemory.write_u8(c.addr,c.collected or 0) end
    for _,h in ipairs(gadget.hitboxes)   do mainmemory.write_u8(h.addr,0) end
    for _,s in ipairs(gadget.sizes)      do mainmemory.write_u8(s.addr,s.collected) end
    for _,u in ipairs(gadget.usability)  do mainmemory.write_u8(u,159) end
end

-- Re-assert ONLY the usability byte(s) to 159. The game resets gadget usability
-- to locked when a level loads, and our ownership-change cache wouldn't re-write
-- it (it already thinks the gadget is owned), so an owned gadget could show up
-- but be unusable. Writing usability every frame is safe — it was the container
-- and hitbox writes that corrupted Hamm's room, NOT these usability addresses.
function assert_gadget_usable(gadget)
    for _,u in ipairs(gadget.usability) do mainmemory.write_u8(u,159) end
end

-- Inverse of assert_gadget_usable: force a gadget you do NOT own to stay locked.
-- Re-asserting the usability byte(s) to 0 EVERY frame stops the game from
-- re-enabling a gadget after our one-time entry lock -- e.g. Al's Toy Barn's
-- native Potato-Head gadget (Rocket Boots) being re-opened by the Potato flow
-- once you've received that level's Missing part item. Usability-only writes are
-- safe every frame (it was the container/hitbox writes that corrupted Hamm's
-- room, never these).
function assert_gadget_unusable(gadget)
    for _,u in ipairs(gadget.usability) do mainmemory.write_u8(u,0) end
end

function restore_part(level)
    local part=PARTS[level]; if not part then return end
    for _,h in ipairs(part.hitbox)   do mainmemory.write_u8(h.addr,h.uncollected) end
    for _,o in ipairs(part.objects)  do mainmemory.write_u8(o.addr,o.uncollected) end
end

-- Keep an ALREADY-COLLECTED part hidden. restore_part writes the "present in
-- world" (uncollected) values which RE-SPAWNS the pickup; to hide a collected
-- part we write the collected/gone state the game uses when you pick it up
-- (hitbox byte 0). Objects are left at their uncollected values (harmless; the
-- hitbox==0 is what makes the pickup non-interactable/gone).
function hide_part(level)
    local part=PARTS[level]; if not part then return end
    for _,h in ipairs(part.hitbox) do mainmemory.write_u8(h.addr,0) end
end

function is_part_collected(level)
    local part=PARTS[level]; if not part then return false end
    for _,h in ipairs(part.hitbox) do if mainmemory.read_u8(h.addr)==0 then return true end end
    return false
end

function update_model(level)
    local addrs=MODEL_ADDRS[level]; if not addrs then return end
    for _,e in ipairs(addrs) do mainmemory.write_u8(e.addr,e.val) end
end

function write_toys(level)
    local toys=TOYS[level]; if not toys then return end
    local count=toy_received_counts[level] or 0
    local mask=toy_collected_masks[level] or 0
    mainmemory.write_u8(A.TOY_UI,count)
    -- Only re-hide toys we've ALREADY collected (write 0). Do NOT write
    -- 'uncollected' to toys we haven't collected — doing so every frame forced
    -- them to respawn and clobbered the game's own "picked up" write (addr==0)
    -- before our collection detection could see it, so no check ever fired.
    for i,toy in ipairs(toys) do
        local bit=2^(i-1)
        if (mask & bit)~=0 then mainmemory.write_u8(toy.addr,0) end
    end
end

function read_dialog_bytes(n)
    local b={}
    for i=0,n-1 do b[i+1]=mainmemory.read_u8(A.DIALOG+i) end
    return b
end

function match_sig(bytes,sig)
    for i,v in ipairs(sig) do if v~=0x00 and bytes[i]~=v then return false end end
    return true
end

function write_dialog(text)
    for i=1,#text do mainmemory.write_u8(A.DIALOG+i-1,string.byte(text,i)) end
    mainmemory.write_u8(A.DIALOG+#text,0x00)
end

function is_rex_checked(level_id)
    local e=REX_LEVEL_TO_BIT[level_id]; if not e then return false end
    -- Check our own Lua-side mask OR a confirmed bit the client wrote. We do NOT
    -- trust raw garbage bits: the client only ever writes server-confirmed rex
    -- bits, and our mask holds in-session talks.
    local m = (e.addr==SHARED_REX_LOW) and rex_lua_mask.lo or rex_lua_mask.hi
    return (m & (1<<e.bit))~=0
end

function set_rex_checked(level_id)
    local e=REX_LEVEL_TO_BIT[level_id]; if not e then return end
    if e.addr==SHARED_REX_LOW then
        rex_lua_mask.lo = rex_lua_mask.lo | (1<<e.bit)
    else
        rex_lua_mask.hi = rex_lua_mask.hi | (1<<e.bit)
    end
    mainmemory.write_u8(e.addr, mainmemory.read_u8(e.addr)|(1<<e.bit))
end

function read_rex_bytes()
    local b={}
    for i=0,9 do b[i+1]=mainmemory.read_u8(A.REX_TEXT+i) end
    return b
end

function write_rex_text(t)
    for i,v in ipairs(t) do mainmemory.write_u8(A.REX_TEXT+i-1,v) end
end

function is_rex_talking(level,bytes)
    local function ms(b,s) for i,v in ipairs(s) do if b[i]~=v then return false end end return true end
    if ms(bytes,EVERY_TOKEN_SIG) then return true end
    local sigs=LEVEL_SIGNATURES[level]; if not sigs then return false end
    for _,sig in ipairs(sigs) do if ms(bytes,sig) then return true end end
    return false
end

function get_rex_replacement(level_id)
    if not is_rex_checked(level_id) then return TEXT_AP_ITEM end
    local s=rex_state[level_id] or 1
    if s<=1 then return TEXT_SORRY      -- first collected line (0 normalises here too)
    elseif s==2 then return TEXT_BUSY
    elseif s==3 then return TEXT_BKD
    else return TEXT_DOTS end
end

function write_level_name(hover_id,use_locked)
    local d=LEVEL_NAME_DATA[hover_id]; if not d then return end
    -- OPEN mode: the final-showdown (hover 21) name shows the goal-condition
    -- shorthand whenever the GOAL is unmet, independent of whether the level is
    -- enterable. In open mode 21 can be unlocked (a received Final Showdown Unlock
    -- item, or a satisfied level-condition) while tokens/bosses are still
    -- outstanding -- gating this on use_locked left the name unchanged in that case.
    -- goal_label_text() returns nil once the goal is fully met, so we then fall
    -- through to the normal name.
    --
    -- The goal shorthand can be long enough to spill out of the 16-byte name field
    -- (0x0E2824) into the SHARED flash-message buffer (0x0E2834). So while a flash is
    -- playing we do NOT paint the shorthand -- we fall through to the short "locked"
    -- name, leaving the message buffer to the popup. start_lock_flash repaints to
    -- "locked"; the flash-end repaint restores the shorthand.
    if hover_id==21 and get_game_mode()==0 and not lock_flash then
        local g=goal_label_text()
        if g then write_label(hover_id, g); return end
    end
    if use_locked then
        -- Linear boss gates show "have/need tokens".
        if get_game_mode()==1 and LINEAR_GATE_NUM[hover_id] then
            write_label(hover_id, boss_gate_label(hover_id)); return
        end
    end
    local bytes=use_locked and d.locked or d.original
    -- Restore the real name, clearing the FULL label width so a previously shown
    -- "##/## tokens" / goal label leaves no stale tail (e.g. "Slime Time" picking up
    -- the trailing 's' from "tokens" -> "Slime Times"). For the boss/goal gates the
    -- prior label may be longer than the name, so we zero-pad up to that label's cap.
    -- Hover 21 is capped at its 16-byte name field so we never wipe the abutting
    -- flash-message buffer (0x0E2834).
    local clearw = #bytes
    if hover_id==21 then
        clearw = 16
    elseif LINEAR_GATE_NUM[hover_id] then
        clearw = math.max(#bytes, LABEL_CAP[hover_id] or #bytes)
    end
    for i=1,clearw do mainmemory.write_u8(d.start+i-1, bytes[i] or 0x00) end
end

function write_all_level_names()
    for hover_id,_ in pairs(LEVEL_NAME_DATA) do
        write_level_name(hover_id, not is_level_unlocked(hover_id))
    end
end

function write_lock_text(t)
    for addr,val in pairs(t) do mainmemory.write_u8(addr,val) end
end

function get_lock_msg_type(hover_id)
    if get_game_mode()==1 and LINEAR_GATE_NUM[hover_id] then return "tokens" end
    if hover_id==21 then return "goal" end
    return "unlock"
end

function get_active_lock_text(msg_type)
    if msg_type=="goal" then return TEXT_MISSING_GOAL
    elseif msg_type=="tokens" then return TEXT_YOU_NEED_TOKENS
    else return TEXT_MISSING_UNLOCK end
end

-- ============================================================
-- #12  DYNAMIC LOCKED-GATE / MISSING-GOAL MESSAGES
-- ============================================================
-- The locked-gate popup renders the 23-byte buffer at LOCK_BUF. We no longer write
-- 200 once and let the game animate; instead we write 193 (LOCK_MSG_SHOW) every
-- frame the text should be visible and 0 every frame it should be blank, driving
-- the flash ourselves. Numbers (token/boss counts) are built live, so these are
-- functions writing ASCII, not the old fixed byte tables.
LOCK_BUF, LOCK_BUF_LEN = 0x0E2834, 23
LOCK_MSG_SHOW = 193

-- Goal breakdown published by the Python client (it owns goal_conditions + boss
-- tracking). Bitmask: b0 = tokens unmet, b1 = bosses unmet, b2 = level-unlock unmet.
-- Goal breakdown published by the Python client (it owns goal_conditions + boss
-- tracking). Bitmask: b0 = tokens unmet, b1 = bosses unmet, b2 = level-unlock unmet.
-- These live in the SAFE low-shared region (with the game-mode mirror). They were
-- at 0x1FFFF3-F6, past the validated shared map (ends 0x1FFFF2) in the top-of-RAM
-- the game corrupts -- so they read 0 in-game and the goal label/popup fell back to
-- "locked" / "missing goal conditions".
GOAL_FLAGS_ADDR    = 0x1FF96C
GOAL_BOSS_DEF_ADDR = 0x1FF96D   -- bosses defeated
GOAL_BOSS_REQ_ADDR = 0x1FF96E   -- bosses required
GOAL_TOK_REQ_ADDR  = 0x1FF96F   -- tokens required for the goal

-- hover_id -> linear boss-gate number (1..5). 21 = linear final showdown (gate 5),
-- which in LINEAR mode is a plain token gate; in OPEN mode 21 is the goal gate.
LINEAR_GATE_NUM = {[9]=1,[12]=2,[15]=3,[18]=4,[21]=5}

-- Max bytes we may write into each special label (string + a null terminator). 21
-- sits just before the message buffer (0x0E2834); the goal shorthand may use the
-- full 21 chars and spill into that buffer, so we allow 22 (21 + a terminating 0)
-- on hover. While a flash plays, write_level_name paints the short "locked" name
-- instead, so the popup owns the buffer; the flash-end repaint restores the label.
LABEL_CAP = {[9]=12,[12]=12,[15]=20,[18]=24,[21]=22}

function lock_char_byte(ch)
    local b = string.byte(ch)
    if b >= 65 and b <= 90 then b = b + 32 end   -- A-Z -> a-z (UI font is lowercase)
    return b
end

-- Write ASCII s into `len` bytes at addr, zero-padding the remainder (clears any
-- longer text previously there). Truncates s to len.
function write_ascii(addr, s, len)
    s = string.sub(s, 1, len)
    for i = 0, len - 1 do
        local b = (i < #s) and lock_char_byte(string.sub(s, i+1, i+1)) or 0x00
        mainmemory.write_u8(addr + i, b)
    end
end
function write_lock_string(s) write_ascii(LOCK_BUF, s, LOCK_BUF_LEN) end
function write_label(hover_id, s)
    local d = LEVEL_NAME_DATA[hover_id]; if not d then return end
    local cap = LABEL_CAP[hover_id] or #d.original
    -- Clear one byte PAST the text (#s + 1) so the game's null-terminated name render
    -- stops at our string. Without this a label as long as (or longer than) the
    -- original name left no terminator and the render ran on into stale/adjacent
    -- buffer bytes -- e.g. the goal shorthand showing a garbage tail.
    local clr = math.max(#s + 1, #d.original); if clr > cap then clr = cap end
    write_ascii(d.start, s, clr)
end

-- "have/need tokens" for a linear boss gate (live token count vs that gate).
function boss_gate_label(hover_id)
    local gn = LINEAR_GATE_NUM[hover_id]; if not gn then return nil end
    return get_ap_tokens() .. "/" .. get_gate(gn) .. " tokens"
end

-- Goal-condition shorthand for the goal level's label (hover 21), or nil if met.
function goal_label_text()
    local f = mainmemory.read_u8(GOAL_FLAGS_ADDR)
    local t,b,l = (f&1)~=0, (f&2)~=0, (f&4)~=0
    if not (t or b or l) then return nil end
    if t and b and l then return "req tokens/bosses/lvl" end
    if t and b then return "req tokens/bosses" end
    if t and l then return "req tokens/level" end
    if b and l then return "req bosses/level" end
    if t then return "req tokens" end
    if b then return "req bosses" end
    return "req level"
end

-- Ordered list of popup messages for a locked gate.
function build_lock_msgs(hover_id, kind)
    if kind == "tokens" then
        local gn = LINEAR_GATE_NUM[hover_id] or 5
        local miss = get_gate(gn) - get_ap_tokens(); if miss < 0 then miss = 0 end
        return { "missing " .. miss .. " tokens" }
    elseif kind == "goal" then
        local f = mainmemory.read_u8(GOAL_FLAGS_ADDR)
        local m = {}
        if (f&1)~=0 then
            local miss = mainmemory.read_u8(GOAL_TOK_REQ_ADDR) - get_ap_tokens()
            if miss < 0 then miss = 0 end
            m[#m+1] = "missing " .. miss .. " tokens"
        end
        if (f&2)~=0 then
            m[#m+1] = mainmemory.read_u8(GOAL_BOSS_DEF_ADDR) .. " of "
                   .. mainmemory.read_u8(GOAL_BOSS_REQ_ADDR) .. " bosses defeated"
        end
        if (f&4)~=0 then m[#m+1] = "missing level unlock" end
        if #m == 0 then m[1] = "missing goal conditions" end
        return m
    end
    return { "missing level unlock" }
end

-- Flash state machine. Single-message kinds (unlock/tokens) show 100 frames then
-- blank+stop; the goal kind cycles 75-show / 10-blank through every message once.
SHOW_SINGLE, SHOW_CYCLE, BLANK_CYCLE = 100, 75, 10
lock_flash = nil   -- {kind, msgs, idx, phase, timer}
function start_lock_flash(hover_id, kind)
    lock_flash = { kind=kind, msgs=build_lock_msgs(hover_id, kind), idx=1, phase="show", timer=0 }
end
function tick_lock_flash()
    local lf = lock_flash; if not lf then return end
    if lf.phase == "show" then
        write_lock_string(lf.msgs[lf.idx] or "")
        mainmemory.write_u8(A.LOCKED_MSG, LOCK_MSG_SHOW)
        lf.timer = lf.timer + 1
        local dur = (lf.kind == "goal") and SHOW_CYCLE or SHOW_SINGLE
        if lf.timer >= dur then
            if lf.kind == "goal" and lf.idx < #lf.msgs then
                lf.phase = "blank"; lf.timer = 0
            else
                mainmemory.write_u8(A.LOCKED_MSG, 0); lock_flash = nil
            end
        end
    else
        mainmemory.write_u8(A.LOCKED_MSG, 0)
        lf.timer = lf.timer + 1
        if lf.timer >= BLANK_CYCLE then lf.idx = lf.idx + 1; lf.phase = "show"; lf.timer = 0 end
    end
end

function is_x_pressed(input)
    -- X (cross) is bit 6 (0x40), active-low: pressed when the bit is CLEAR.
    return (input & 0x40) == 0
end

function block_x(input)
    -- Release X by setting bit 6 back to 1, leaving all other bits intact.
    mainmemory.write_u8(A.INPUT, input | 0x40)
end

function dj_pad_x()
    -- Read the REAL controller, not A.INPUT. A.INPUT is the byte we overwrite to
    -- block the jump, so detecting the press edge from it would see our own
    -- writes and a second tap would never look "new". Core-agnostic scan, the
    -- same approach select_is_pressed() uses. Falls back to the RAM byte if the
    -- joypad table is unavailable.
    local ok, pad = pcall(joypad.get)
    if ok and type(pad) == "table" then
        for name, val in pairs(pad) do
            if type(name) == "string" and name:find("Cross") then
                return val and true or false
            end
        end
    end
    return is_x_pressed(mainmemory.read_u8(A.INPUT))
end

function check_token_collection(level_id,hover_id)
    local addr=TOKEN_ADDR[hover_id]; if not addr then return end
    local value=mainmemory.read_u8(addr); if value==0 then return end
    if not token_checks_sent[level_id] then token_checks_sent[level_id]=0 end
    for bit_val,_ in pairs(BIT_TO_NAME) do
        if bit_val~=16 then
            local already=(token_checks_sent[level_id] & bit_val)~=0
            local collected=(value & bit_val)~=0
            if collected and not already then
                token_checks_sent[level_id]=token_checks_sent[level_id]|bit_val
            end
        end
    end
    -- Publish collected token bits to shared memory so the client can send the
    -- corresponding location checks. We ACCUMULATE (OR) the bits into the shared
    -- byte so they survive re-zeroing the in-game token byte below.
    local sa=SHARED_TOKENS_COLLECTED[hover_id]
    if sa then mainmemory.write_u8(sa, mainmemory.read_u8(sa) | (value & 0x1F)) end
    -- Immediately re-zero the in-game token byte (it was zeroed on level entry).
    -- Leaving it set after an in-level pickup can pop the game's "Save Screen",
    -- which has softlocked players on coin levels. The check is preserved in the
    -- shared byte above; per-level dedup lives in token_checks_sent. The map
    -- restores the byte to 1 on return for Open-mode access control. Boss hovers
    -- are left alone (their byte drives separate boss/unlock logic).
    if not BOSS_HOVER_IDS[hover_id] then
        mainmemory.write_u8(addr, 0)
    end
end

function set_all_token_addresses()
    for hover_id,addr in pairs(TOKEN_ADDR) do
        mainmemory.write_u8(addr, BOSS_HOVER_IDS[hover_id] and 128 or 1)
    end
end

function check_prospector_unlock()
    -- The client computes whether the player's chosen GOAL CONDITIONS are met
    -- (tokens / bosses / level unlocks / combos) and writes the result here. We
    -- just honor it, instead of hard-requiring tokens AND tickets regardless of
    -- the selected goal (which left non-token/boss goals never unlocking).
    set_level_unlocked(21, mainmemory.read_u8(SHARED_PROSP_ITEM)==1)
end

function apply_linear_area(tickets)
    local area=math.min(tickets,4)
    local data=AREA_LEVELS[area]
    local tokens=get_ap_tokens()
    if not data then return end
    for _,h in ipairs(data.regular or {}) do
        local a=TOKEN_ADDR[h]; if a then mainmemory.write_u8(a,1) end
    end
    for _,h in ipairs(data.boss or {}) do
        local a=TOKEN_ADDR[h]; if a then mainmemory.write_u8(a,128) end
    end
    for _,h in ipairs(data.keep_zero or {}) do
        local a=TOKEN_ADDR[h]; if a then mainmemory.write_u8(a,0) end
    end
    for _,h in ipairs(data.special or {}) do
        local a=TOKEN_ADDR[h]; if a then mainmemory.write_u8(a,0) end
    end
    for _,h in ipairs(data.locked or {}) do
        local a=TOKEN_ADDR[h]; if a then mainmemory.write_u8(a,0) end
    end
    mainmemory.write_u8(SHARED_UNLOCKS_LOW,0)
    mainmemory.write_u8(SHARED_UNLOCKS_HIGH,0)
    for _,h in ipairs(AREA_UNLOCKED[area] or {}) do set_level_unlocked(h,true) end
    -- Already-beaten bosses (special) keep their TOKEN_ADDR at 0 for the area
    -- unlock quirk, but should stay ENTERABLE — force them unlocked in the bitmask
    -- so a defeated boss like Bombs Away doesn't re-lock after you advance to the
    -- next area. (keep_zero bosses are the CURRENT area's boss and stay gated by
    -- the token check below, so they are NOT force-unlocked here.)
    for _,h in ipairs(data.special or {}) do set_level_unlocked(h,true) end
    for _,h in ipairs(data.boss or {}) do
        local gn=BOSS_GATE[h]
        if gn and tokens>=get_gate(gn) then set_level_unlocked(h,true) end
    end
    local final_gate=get_gate(5)
    if tokens>=final_gate and tickets>=4 then set_level_unlocked(21,true) end
end

-- Per-level last-known-good bundle count + a short debounce counter, so a brief
-- 0 written by the client during item-sync doesn't drop the spendable coins, but
-- a SUSTAINED 0 (genuinely no bundles) is honored. NOT a monotonic latch (that
-- permanently locked any high garbage read as max coins).
coin_items_good = {}   -- last valid nonzero count seen
coin_items_zero = {}   -- consecutive frames we've read 0 while good was nonzero
COIN_ZERO_DEBOUNCE = 15
function get_coin_ap_amount(level_id)
    local addr=SHARED_COIN_ITEMS[level_id]; if not addr then return 0 end
    local items_raw=mainmemory.read_u8(addr)
    local maxc=COIN_MAX[level_id]
    local recv=get_recv_bundle_size()
    local max_bundles = maxc and math.ceil(maxc/recv) or 255

    local good = coin_items_good[level_id] or 0
    local items

    if items_raw > max_bundles then
        -- Impossible-real (more bundles than the level holds) => RAM garbage in the
        -- load window. Use the last known-good value, never promote to max.
        items = good
    elseif items_raw == 0 then
        -- Could be the client's sync-blip (transient) or a real 0. Hold the last
        -- nonzero value for a few frames; if 0 persists past the debounce, accept it.
        local z = (coin_items_zero[level_id] or 0) + 1
        coin_items_zero[level_id] = z
        if good > 0 and z <= COIN_ZERO_DEBOUNCE then
            items = good            -- transient blip: keep the known-good amount
        else
            items = 0               -- sustained 0: genuinely no bundles
            coin_items_good[level_id] = 0
        end
    else
        -- Valid nonzero read: trust it directly and record as known-good.
        items = items_raw
        coin_items_good[level_id] = items_raw
        coin_items_zero[level_id] = 0
    end

    if maxc then
        local amount=items*recv
        if amount>maxc then amount=maxc end
        return amount
    end
    return items*recv
end

function get_coin_next_threshold(level_id)
    local checked=coins_checked[level_id] or 0
    local maxc=COIN_MAX[level_id]; if not maxc then return nil end
    local bundle=get_checks_bundle_size()
    if bundle==0 then
        -- ALL: a single check for the whole level's coins.
        if checked<1 then return maxc end
        return nil
    end
    local next_t=(checked+1)*bundle
    if next_t>maxc then
        if checked*bundle<maxc then return maxc end
        return nil
    end
    return next_t
end

function write_sanity_items(level)
    if is_batterysanity() and BATTERIES[level] then
        local mask=battery_masks[level] or 0
        for i,item in ipairs(BATTERIES[level]) do
            local bit=2^(i-1)
            mainmemory.write_u8(item.addr,(mask&bit)~=0 and 5 or item.uncollected)
        end
    end
    if is_lifesanity() and LIVES[level] then
        local mask=life_masks[level] or 0
        for i,item in ipairs(LIVES[level]) do
            local bit=2^(i-1)
            mainmemory.write_u8(item.addr,(mask&bit)~=0 and 5 or item.uncollected)
        end
    end
    if is_lasersanity() and LASERS_SANITY[level] then
        local mask=laser_masks[level] or 0
        for i,item in ipairs(LASERS_SANITY[level]) do
            local bit=2^(i-1)
            -- Only enforce the COLLECTED state (write 5). For uncollected lasers we
            -- leave the address alone: forcing it to `uncollected` (73 = "present")
            -- made phase-gated lasers (e.g. Slime Time's, which only spawns in the
            -- last phase and reads 5 until then) appear/read as present on load,
            -- which both revealed it early and falsely tripped the "seen present"
            -- detection gate. Letting the game own spawn/presence avoids both.
            if (mask&bit)~=0 then
                mainmemory.write_u8(item.addr,5)
            end
        end
    end
end

function check_sanity_pickups(level)
    -- Detection is only reached after the level-ready gate, so load transients
    -- are excluded. A pickup is collected when its address reads EXACTLY 5. We
    -- also AUTHORITATIVELY write each shared mask every frame (from our own mask,
    -- not the game's memory) so that game RAM garbage at the shared addresses can
    -- never leak through to the client as a phantom collected pickup.
    --
    -- DESPAWN SEEDS: the client publishes the current level's server-confirmed
    -- collected mask (derived from checked_locations) to the SHARED_DESPAWN_*
    -- bytes every tick. We OR those into our local mask so anything the server
    -- already has checked is hidden — surviving resets/reconnects. This is safe
    -- (no phantom checks) because the client only WRITES these seeds and never
    -- reads them back; they are pure server->Lua truth.
    if is_batterysanity() and BATTERIES[level] then
        local mask=(battery_masks[level] or 0) | mainmemory.read_u8(SHARED_DESPAWN_BATTERY)
        for i,item in ipairs(BATTERIES[level]) do
            local bit=2^(i-1)
            if (mask&bit)==0 and mainmemory.read_u8(item.addr)==5 then
                mask=mask|bit
                mainmemory.write_u8(item.addr,item.uncollected)
            end
        end
        battery_masks[level]=mask
        mainmemory.write_u8(SHARED_BATTERY[level] or 0,mask)
    end
    if is_lifesanity() and LIVES[level] then
        local mask=(life_masks[level] or 0) | mainmemory.read_u8(SHARED_DESPAWN_LIFE)
        local cur_lives=mainmemory.read_u8(A.LIFE)
        for i,item in ipairs(LIVES[level]) do
            local bit=2^(i-1)
            if (mask&bit)==0 and mainmemory.read_u8(item.addr)==5 then
                mask=mask|bit
                mainmemory.write_u8(item.addr,item.uncollected)
                if cur_lives>last_life_count and last_life_count>=0 then
                    mainmemory.write_u8(A.LIFE,last_life_count)
                end
                mainmemory.write_u8(0x0CD400,0)
            end
        end
        life_masks[level]=mask
        mainmemory.write_u8(SHARED_LIFE[level] or 0,mask)
    end
    if is_lasersanity() and LASERS_SANITY[level] then
        local mask=(laser_masks[level] or 0) | mainmemory.read_u8(SHARED_DESPAWN_LASER)
        for i,item in ipairs(LASERS_SANITY[level]) do
            local bit=2^(i-1)
            local val=mainmemory.read_u8(item.addr)
            -- The laser address reads `uncollected` (e.g. 73) when the laser is
            -- PRESENT but not grabbed, and 5 once COLLECTED. But it ALSO reads 5
            -- before the laser has spawned (e.g. Slime Time, where it only appears
            -- in the last phase: 5 -> 73 -> 5). So 5 alone can't distinguish
            -- "collected" from "never spawned" and was firing the check on load.
            -- Gate: only accept 5 as collected once we've SEEN the laser present
            -- (== uncollected value) this entry.
            local key=level*16+i
            if val==item.uncollected then laser_seen_present[key]=true end
            if (mask&bit)==0 and laser_seen_present[key] and val==5 then
                mask=mask|bit
                mainmemory.write_u8(item.addr,item.uncollected)
            end
        end
        laser_masks[level]=mask
        mainmemory.write_u8(SHARED_LASER_SANITY[level] or 0,mask)
    end
end

-- ============================================================
-- SUBSYSTEM FUNCTIONS
-- ============================================================

function update_moves()
    local input=mainmemory.read_u8(A.INPUT)
    local LASER_LEVEL=get_laser_level()
    local HAS_SPIN    =is_move_unlocked(BITS.SPIN)
    local HAS_STOMP   =is_move_unlocked(BITS.STOMP)
    local HAS_DBL_JUMP=is_move_unlocked(BITS.DBL_JUMP)
    local HAS_VISOR   =is_move_unlocked(BITS.VISOR)
    local HAS_LEDGE   =is_move_unlocked(BITS.LEDGE)
    local HAS_POLE    =is_move_unlocked(BITS.POLE)
    local HAS_VAULT   =is_move_unlocked(BITS.VAULT)
    local HAS_PUSH    =is_move_unlocked(BITS.PUSH)
    local HAS_ROPE    =is_move_unlocked(BITS.ROPE,true)
    local jump=mainmemory.read_u8(A.JUMP)
    local stomp=mainmemory.read_u8(A.STOMP)

    if not HAS_SPIN  then spin_restored=false end
    if not HAS_POLE  then pole_restored=false end
    if not HAS_VAULT then vault_restored=false end
    if not HAS_PUSH  then push_restored=false end
    if not HAS_ROPE  then rope_restored=false end

    -- Laser
    if LASER_LEVEL==0 then
        local disc_ammo=mainmemory.read_u8(0x0A15C4)
        local visor_1=mainmemory.read_u8(0x0A11F4)
        local visor_2=mainmemory.read_u8(0x0A1368)
        local hook_ready=mainmemory.read_u8(0x0BEA20)
        local using_hook=visor_1~=0 and visor_2~=0 and hook_ready~=255
        if not (disc_ammo>0 or using_hook) then
            if (255-input)&LZ.SQUARE_BIT~=0 then
                mainmemory.write_u8(A.INPUT,input+LZ.SQUARE_BIT)
            end
            mainmemory.write_u32_le(A.LASER_PROG,LZ.PROG_DEFAULT)
            mainmemory.write_u32_le(A.LASER_SUPER,0)
            mainmemory.write_u8(0x0A10E0,0)
            if mainmemory.read_u8(0x0A1368)==0 then
                mainmemory.write_u8(0x0C2AD1,0)
            end
        end
        local visor_active=mainmemory.read_u8(0x0A11F4)
        -- 0x06D610 is shared with the invincibility TRAP (update_traps). Both want
        -- the NOP (0x00000000 = damage-immune) while their effect is on, and the
        -- real opcode (0xA602007A) otherwise. Writing based only on visor state
        -- here would yank the patch back to the real opcode while the trap is still
        -- active, leaving 0x06D610 flickering frame-to-frame. So restore the real
        -- opcode only when NEITHER the visor is open NOR the trap is active.
        mainmemory.write_u32_le(0x06D610,
            (visor_active~=0 or invince_active) and 0x00000000 or 0xA602007A)
    elseif LASER_LEVEL==1 then
        mainmemory.write_u32_le(A.LASER_PROG,LZ.PROG_DEFAULT)
    elseif LASER_LEVEL==2 then
        mainmemory.write_u32_le(A.LASER_PROG,LZ.PROG_VAL)
    elseif LASER_LEVEL==3 then
        mainmemory.write_u32_le(A.LASER_PROG,0)
        mainmemory.write_u32_le(A.LASER_SUPER,LZ.SUPER_VAL)
        -- Laser 3 is the Disc Launcher: show the laser UI while the player has
        -- discs (the count rises on pickup), and hide it again once it hits 0.
        -- The Grappling Hook shares this same UI element, so hooks must keep it
        -- visible too -- otherwise picking up a hook at Laser 3 left the count
        -- hidden. A.GRAPPLE is a global 1-byte count that reads 0 in levels
        -- without the hook, so the zero-check alone covers the "only grappling-
        -- hook levels" case and no per-level gate is needed. (The LASER_LEVEL==0
        -- branch above already applies the same rule.)
        if mainmemory.read_u8(A.DISC)==0 and mainmemory.read_u8(A.GRAPPLE)==0 then
            mainmemory.write_u8(A.LASER_UI,0)
        end
    end

    -- Re-read input after potential laser modification
    input=mainmemory.read_u8(A.INPUT)

    -- ── Progressive Spin ──────────────────────────────────
    -- L1 = base spin (move bit). L2 writes 0 to 0x04AD22 (exclusive). L3 = "super
    -- spin": HOLD O to toggle FFFFFED2 -> 0x0A139C. Native spin is suppressed without
    -- the move, at L3 (super spin replaces it), and while super spin is on. The Dizzy
    -- Buzz trap (update_traps) drives the same address and OUTRANKS the spin: once a
    -- dizzy is live we hand off until the game itself zeroes 0x0A139C.
    local SPIN_LEVEL = get_spin_level()

    -- Native spin enable (A.SPIN): blocked w/o the move, at L3, or while super on.
    if (not HAS_SPIN) or SPIN_LEVEL>=3 or spin3_on then
        mainmemory.write_u32_le(A.SPIN, 0xFFFFFFFF); spin_restored=false
    elseif not spin_restored then
        mainmemory.write_u32_le(A.SPIN, 0x00000000); spin_restored=true
    end

    -- L2 only: write 0 to 0x04AD22 each frame.
    if SPIN_LEVEL==2 then mainmemory.write_u8(0x04AD22, 0) end

    -- L3: HOLD O to flip the super-spin toggle (noise-tolerant streak).
    if SPIN_LEVEL>=3 then
        local circle_down = (input & 0x20) == 0   -- O/circle bit 0x20, active-low
        if circle_down then spin_streak = math.min(spin_streak+1, SPIN_HOLD_FRAMES)
        else spin_streak = math.max(spin_streak-1, 0) end
        if spin_streak>=SPIN_HOLD_FRAMES and not spin_consumed then
            if spin3_on then spin3_on=false
            -- Only ACTIVATE super spin while grounded (0x0B2214 == 0). It can be
            -- toggled off anytime, and once on it keeps running in the air (see the
            -- write block below) -- you just can't start it mid-jump.
            elseif mainmemory.read_u32_le(0x0A139C) ~= SPIN_DIZZY
                   and mainmemory.read_u8(0x0B2214) == 0 then spin3_on=true end
            spin_consumed = true
        end
        if spin_streak==0 then spin_consumed=false end
    else
        spin_streak=0; spin_consumed=false
    end

    -- Address ownership: dizzy sequence -> dizzy hands-off -> normal spin driving.
    if dizzy_seq>0 then
        if dizzy_seq>1 then mainmemory.write_u32_le(0x0A139C, 0)
        else mainmemory.write_u32_le(0x0A139C, SPIN_DIZZY); dizzy_active=true end
        dizzy_seq = dizzy_seq-1
    elseif dizzy_active then
        if mainmemory.read_u32_le(0x0A139C)==0 then dizzy_active=false end
    else
        -- Super spin runs whenever the toggle is on -- in the air too. Activation is
        -- gated to the ground in the toggle block above, so this only ever continues
        -- a ground-started spin; it never starts one mid-air. While the toggle is off
        -- at L3 the value is held at 0 so airborne Stomp isn't overridden.
        if spin3_on then
            mainmemory.write_u32_le(0x0A139C, SPIN_SUPER)
        elseif SPIN_LEVEL>=3 then
            mainmemory.write_u32_le(0x0A139C, 0)
        end
    end

    -- Spin UI: hidden when the player has no spin. A dizzy pops it and the UI
    -- lingers ~3s past the animation, so re-assert the learned hidden value while a
    -- dizzy is live AND for SPIN_UI_HOLD frames after it clears.
    if not HAS_SPIN then
        if dizzy_active or dizzy_seq>0 then
            spin_ui_hold = SPIN_UI_HOLD                         -- top up the tail
            if spin_ui_hidden ~= nil then mainmemory.write_u8(SPIN_UI_ADDR, spin_ui_hidden) end
        elseif spin_ui_hold > 0 then
            spin_ui_hold = spin_ui_hold - 1                     -- drain the 3s tail
            if spin_ui_hidden ~= nil then mainmemory.write_u8(SPIN_UI_ADDR, spin_ui_hidden) end
        else
            spin_ui_hidden = mainmemory.read_u8(SPIN_UI_ADDR)   -- learn hidden value
        end
    end

    -- Double jump
    --
    -- 0x049A04 is `lh $v0, 0x8E($s0)` -- a LOAD, not a branch. NOPing it (the old
    -- approach) disabled nothing; it just left a stale value in $v0, so whatever
    -- test followed ran on leftovers. That worked most of the time and leaked
    -- whenever timing or a different code path left a different value there,
    -- which is why mashing the jump button, or jumping near angled geometry,
    -- still produced a second jump. The instruction is now left intact.
    --
    -- The move is blocked at the INPUT instead, and only for a jump press that
    -- BEGINS in mid-air. That matters on three counts:
    --   * a press carried over from the ground is never touched, so the normal
    --     variable-height jump is unaffected. Holding X released for the whole
    --     airborne period reads as "player let go" and gives a short hop.
    --   * the jump state is never forced. Writing 0x0B2214 back to 0 was the
    --     original approach and it also cancelled Stomp's mid-air launch.
    --   * while the pause menu is open nothing is suppressed, so menu input works
    --     normally. A press made INSIDE the menu is then swallowed on resume,
    --     because by then it is only "held" and has no rising edge left to catch.
    if not HAS_DBL_JUMP then
        local dj_air = jump ~= 0
        local dj_pad = dj_pad_x()

        -- Debounced airborne latch. The raw jump state can flick back to 0 for a
        -- frame on sloped ground, which was one of the ways a second jump slipped
        -- through; the latch only clears after DJ_GROUND_HOLD consecutive
        -- grounded frames, so a one-frame flicker cannot reopen the window.
        if dj_air then DJ_GROUND_RUN = 0 else DJ_GROUND_RUN = DJ_GROUND_RUN + 1 end
        if dj_air then DJ_LATCHED = true
        elseif DJ_GROUND_RUN >= DJ_GROUND_HOLD then DJ_LATCHED = false end

        if mainmemory.read_u8(A.PAUSE) ~= 0 then
            -- Paused. Record whether X was ALREADY held when the menu opened, so
            -- a press carried in from before the pause is not mistaken for a menu
            -- press on resume. Let all menu input through untouched.
            if not DJ_PREV_PAUSED then DJ_X_AT_PAUSE = dj_pad end
            DJ_SUPPRESSING = false
            DJ_PREV_PAUSED = true
        else
            if DJ_PREV_PAUSED and dj_pad and (not DJ_X_AT_PAUSE)
               and (dj_air or DJ_LATCHED) then
                DJ_SUPPRESSING = true      -- X pressed in the menu, still held
            end
            DJ_PREV_PAUSED = false
            if dj_pad and (not DJ_PAD_PREV) and (dj_air or DJ_LATCHED) then
                DJ_SUPPRESSING = true      -- fresh press that began in mid-air
            end
            if not dj_pad then DJ_SUPPRESSING = false end
            if DJ_SUPPRESSING then
                -- Re-read: earlier blocks this frame may have written A.INPUT.
                local dj_in = mainmemory.read_u8(A.INPUT)
                if (dj_in & 0x40) == 0 then
                    mainmemory.write_u8(A.INPUT, dj_in | 0x40)
                end
            end
        end
        DJ_PAD_PREV = dj_pad
    else
        DJ_SUPPRESSING = false; DJ_PAD_PREV = false; DJ_LATCHED = false
        DJ_GROUND_RUN = 0; DJ_PREV_PAUSED = false; DJ_X_AT_PAUSE = false
    end

    -- The old NOP is gone, so make sure the real instruction is in place. This
    -- also repairs it if an older build of this script NOPed it earlier in the
    -- same session.
    if not dbljump_restored then
        mainmemory.write_u32_le(0x049A04,0x8602008E)
        dbljump_restored=true
    end

    -- Stomp
    if not HAS_STOMP then
        if jump~=0 and stomp>0 then mainmemory.write_u8(A.STOMP,0) end
    else
        if input~=223 then circle_was_up=true end
        if jump==0 then stomp_nudged=false end
        if jump~=0 and input==223 and circle_was_up and not stomp_nudged then
            mainmemory.write_u8(A.STOMP,1); stomp_nudged=true; circle_was_up=false
        end
    end

    -- Visor
    if not HAS_VISOR then
        if (255-input)&LZ.VISOR_L1_BIT~=0 then
            mainmemory.write_u8(A.INPUT,input+LZ.VISOR_L1_BIT)
        end
        -- Patch out the Visor ability instruction entirely (NOP). This not only
        -- blocks the visor from opening but also kills the L1 mid-air double jump,
        -- which only exists while the Visor is functional. 0x04CD00: locked=NOP,
        -- unlocked=0x00831824.
        mainmemory.write_u32_le(0x04CD00,0x00000000)
        visor_restored=false
    elseif not visor_restored then
        mainmemory.write_u32_le(0x04CD00,0x00831824)
        visor_restored=true
    end

    -- Ledge grab
    if not HAS_LEDGE then
        mainmemory.write_u32_le(A.LEDGE,MV.LEDGE_LOCKED)
        mainmemory.write_u32_le(0x04C31C,0x00000000)
        mainmemory.write_u32_le(0x04C308,0x00000000)
        mainmemory.write_u32_le(0x04C324,0x00000000)
    else
        mainmemory.write_u32_le(A.LEDGE,MV.LEDGE_UNLOCKED)
        mainmemory.write_u32_le(0x04C31C,0x02421023)
        mainmemory.write_u32_le(0x04C308,0x00431023)
        mainmemory.write_u32_le(0x04C324,0x0C01852F)
    end

    -- Pole climb
    if not HAS_POLE then mainmemory.write_u32_le(A.POLE,MV.POLE_LOCKED)
    elseif not pole_restored then mainmemory.write_u32_le(A.POLE,MV.POLE_UNLOCKED); pole_restored=true end

    -- Pole vault
    if not HAS_VAULT then
        mainmemory.write_u32_le(A.VAULT,MV.VAULT_LOCKED)
        mainmemory.write_u32_le(0x04AFF4,0x00000000)
    elseif not vault_restored then
        mainmemory.write_u32_le(A.VAULT,MV.VAULT_UNLOCKED)
        mainmemory.write_u32_le(0x04AFF4,0x8E420008)
        vault_restored=true
    end

    -- Push
    if not HAS_PUSH then mainmemory.write_u32_le(A.PUSH,MV.PUSH_LOCKED)
    elseif not push_restored then mainmemory.write_u32_le(A.PUSH,MV.PUSH_UNLOCKED); push_restored=true end

    -- Rope sliding
    if not HAS_ROPE then mainmemory.write_u32_le(A.ROPE,MV.ROPE_LOCKED)
    elseif not rope_restored then mainmemory.write_u32_le(A.ROPE,MV.ROPE_UNLOCKED); rope_restored=true end
end

-- ── CUTSCENE TRAP (faithful port of ts2_traps.lua state machine) ──────────
function cs_save_states()
    CS.saved = {}
    for _,addr in ipairs(CUTSCENE_ADDRS) do
        CS.saved[addr] = mainmemory.read_u8(addr)
    end
end

function cs_restore_states()
    for _,addr in ipairs(CUTSCENE_ADDRS) do
        local orig = CS.saved[addr]
        if orig ~= nil then mainmemory.write_u8(addr, orig) end
    end
    if mainmemory.read_u8(SHARED_TRAP_CUTSCENE)==0 and not CS.pending then
        CS.saved = {}
    end
end

function cs_reset_flags()
    CS.active=false; CS.phase=0; CS.saw_boss_defeat=false; CS.zurg_saw_64=false
    CS.zurg_first_done=false; CS.cycles=0; CS.post_pending=false; CS.post_timer=0
    CS.armed_on_map=false; CS.entered_level=nil
    cs_unlock_speed()   -- restore the player's emulator speed
end

function cs_complete()
    cs_restore_states()
    cs_reset_flags()
    -- Dequeue the next pending cutscene trap (if any) so they chain.
    local q=mainmemory.read_u8(SHARED_TRAP_CUTSCENE)
    if q>0 then mainmemory.write_u8(SHARED_TRAP_CUTSCENE,q-1); CS.pending=true end
end

function cs_trigger()
    cs_save_states()
    for _,addr in ipairs(CUTSCENE_ADDRS) do mainmemory.write_u8(addr,0) end
    CS.phase=1; CS.active=true; CS.trigger_timer=CUTSCENE_TRIGGER_WAIT
    CS.saw_boss_defeat=false; CS.zurg_saw_64=false; CS.zurg_first_done=false
    CS.cycles=0; CS.post_pending=false; CS.post_timer=0
end

function cs_freeze_input()
    mainmemory.write_u8(A.INPUT,255)
    mainmemory.write_u8(CS_START_ADDR,255)
end

-- ── CUTSCENE SPEED LOCK (Option C) ──────────────────────────────────────────
-- During a cutscene, hold the emulator at 100% speed. We only call
-- client.speedmode(100) when the speed is NOT already 100, so BizHawk's
-- "Speed: 100%" OSD message appears only if the player actually tries to change
-- it mid-cutscene — not every frame (which would spam the message on screen).
-- Reading the current speed isn't guaranteed across BizHawk versions, so the read
-- is defensive: if it fails, we fall back to setting 100% once per cutscene.
cs_speed_locked   = false   -- have we engaged the lock this cutscene?
cs_speed_prev     = nil     -- player's speed before the cutscene (to restore)
cs_speed_readable = nil     -- nil=unknown, true/false once probed

function cs_read_speed()
    -- Returns the current speed percent, or nil if it can't be read.
    local ok, cfg = pcall(client.getconfig)
    if ok and cfg ~= nil then
        local v = cfg.SpeedPercent
        if type(v)=="number" then return v end
    end
    return nil
end

function cs_lock_speed()
    if not cs_speed_locked then
        -- First frame of the lock: remember the player's speed so we can restore it.
        cs_speed_prev = cs_read_speed()
        cs_speed_readable = (cs_speed_prev ~= nil)
        cs_speed_locked = true
        if not cs_speed_readable then
            -- Speed isn't readable on this build: set 100% ONCE and don't re-assert
            -- (avoids OSD spam). Degrades to "set once" behaviour.
            pcall(client.speedmode, 100)
            return
        end
    end
    if cs_speed_readable then
        -- Only correct when it's drifted off 100 — keeps the OSD message away unless
        -- the player tries to change speed.
        local cur = cs_read_speed()
        if cur ~= nil and cur ~= 100 then
            pcall(client.speedmode, 100)
        end
    end
end

function cs_unlock_speed()
    if not cs_speed_locked then return end
    -- Restore the player's pre-cutscene speed if we know it and it wasn't 100.
    if cs_speed_readable and cs_speed_prev and cs_speed_prev ~= 100 then
        pcall(client.speedmode, cs_speed_prev)
    end
    cs_speed_locked = false
    cs_speed_prev = nil
end

-- Force A.LEVEL to the correct "cutscene level" value during a cutscene, per the
-- user's spec, so the game doesn't redirect the post-cutscene load to a wrong
-- level. Keyed by CS.entered_level (the real level captured at cutscene start).
--   Coin level        -> 0
--   Bomb's Away  (6)   -> 6   (boss, cutscene after fight)
--   Slime Time   (3)   -> 3   (boss, cutscene after fight)
--   Toy Barn Enc (9)   -> 9   (boss, cutscene after fight)
--   Zurg        (12)   -> 0 pre-fight, 12 post-fight (after saw_boss_defeat)
CUTSCENE_FORCE_BOSS = {
    [6] = 6,   -- Bomb's Away
    [3] = 3,   -- Slime Time
    [9] = 9,   -- Toy Barn Encounter
}
function cs_force_level()
    local el = CS.entered_level
    if el == nil then return end
    local forced
    if el == 12 then
        -- Zurg: 0 during the pre-fight cutscene, 12 during the post-fight cutscene.
        forced = CS.saw_boss_defeat and 12 or 0
    elseif CUTSCENE_FORCE_BOSS[el] then
        forced = CUTSCENE_FORCE_BOSS[el]   -- a boss (cutscene after fight)
    elseif COIN_LEVEL_IDS[el] then
        forced = 0                          -- coin level (cutscene before)
    end
    if forced ~= nil then
        mainmemory.write_u8(A.LEVEL, forced)
    end
end

-- Called on every level change (level is the NEW level id).
function cs_on_level_change(level)
    if BOSS_DEFEAT_SCREENS[level] and CS.active then
        CS.saw_boss_defeat = true
    end
    -- Once a real gameplay level loads, the trap is no longer "waiting on the map"
    -- — clear the guard so the normal map-cancel behaviour resumes afterward. Also
    -- zero the trigger_timer: it's a post-trigger settle for IN-LEVEL triggering,
    -- but a map-armed trap's cutscene plays right on entry, so we must be ready to
    -- detect cs_state immediately instead of ignoring it for up to 3 seconds.
    if CS.active and level>=1 and level<=15 then
        if CS.armed_on_map then CS.trigger_timer=0 end
        CS.armed_on_map = false
        -- Record the real entered level for cs_force_level. Captured here (on the
        -- level-change into a real 1-15 level) rather than at cutscene-start,
        -- because Zurg's pre-fight cutscene plays right at entry when A.LEVEL may
        -- still read the 0 transition value — which made the capture miss Zurg.
        CS.entered_level = level
    end
    if CS.active then
        local hover = mainmemory.read_u8(A.HOVER) or 0
        if CS.trigger_timer>0 then
            -- Still loading — don't run the cancellation checks.
        elseif level==MAP_LEVEL_ID and CS.saw_boss_defeat then
            CS.level_changed = true  -- keep trap alive across the defeat screen
        elseif level==MAP_LEVEL_ID and hover>=7 and CS.zurg_first_done and not CS.saw_boss_defeat then
            cs_restore_states(); cs_reset_flags()  -- left Zurg after pre-fight cs
        elseif level==MAP_LEVEL_ID and hover>=7 then
            if CS.pending then
                CS.pending=false; cs_reset_flags(); CS.saved={}
                mainmemory.write_u8(SHARED_TRAP_CUTSCENE,0)
            elseif CS.phase==1 or CS.phase==2 then
                cs_restore_states(); cs_reset_flags()  -- exited mid-cutscene
            end
        end
    end
end

-- Per-frame cutscene processing.
function update_cutscene(level)
    -- Publish whether a cutscene is ACTIVELY PLAYING (phases 1-2: input frozen,
    -- player watching) so both the client and the Lua's own detection pause.
    -- Earlier this also flagged the pending/queued state, which paused checks too
    -- broadly (checks stopped even when no cutscene was on screen). It is the
    -- Publish whether a cutscene is ACTUALLY ON SCREEN so the client (and our own
    -- collectible detection) pause only during real playback. This must be gated
    -- on the GAME's cutscene-state byte (0x00E065 reads 32 or 64 while a cutscene
    -- plays, 0 otherwise) — NOT on our phase machine. Phase 1 is the "waiting for
    -- a cutscene to start" state (input isn't even frozen yet), so flagging it
    -- paused all client code for the entire, possibly indefinite, wait — which is
    -- what froze checks/coinsanity/Rex the instant a cutscene trap was received.
    local cs_now = mainmemory.read_u8(CUTSCENE_STATE_ADDR)
    CS_PLAYING = CS.active and (cs_now==32 or cs_now==64)
    mainmemory.write_u8(0x1FF97E, CS_PLAYING and 1 or 0)

    -- Decrement the load-settle trigger timer.
    if CS.trigger_timer>0 then CS.trigger_timer=CS.trigger_timer-1 end

    -- Post-cutscene level-ID check timer.
    if CS.post_pending then
        if CS.post_timer>0 then
            CS.post_timer=CS.post_timer-1
        else
            CS.post_pending=false
            -- Only Zurg pre-fight reaches here now. Mark it done and wait for the
            -- post-fight cutscene (which fires after saw_boss_defeat). Re-zero the
            -- flags so the post-fight cutscene's seen-flag is 0 when the game checks
            -- it — otherwise the second Zurg cutscene is treated as already-seen and
            -- skipped.
            if CS.entered_level==12 then
                CS.zurg_first_done=true
                for _,addr in ipairs(CUTSCENE_ADDRS) do mainmemory.write_u8(addr,0) end
            else
                cs_complete()
            end
        end
    end

    if not CS.active then
        local q=mainmemory.read_u8(SHARED_TRAP_CUTSCENE)
        if CS.pending or q>0 then
            -- Fire only on the map (16) AND once the cursor is settled on a real
            -- level (hover>=7). In-level firing, or firing at hover==0 on map
            -- arrival, both warp. cs_trigger zeros only the selected level's flag.
            if level==MAP_LEVEL_ID and (mainmemory.read_u8(A.HOVER) or 0) >= 7 then
                if not CS.pending and q>0 then mainmemory.write_u8(SHARED_TRAP_CUTSCENE,q-1) end
                CS.pending=false
                cs_trigger()
            end
        end
    else
        local cs_state=mainmemory.read_u8(CUTSCENE_STATE_ADDR)
        if CS.phase==1 then
            -- Zurg inter-cutscene window: after the pre-fight cutscene (zurg_first_done)
            -- and before the post-fight one (saw_boss_defeat), keep the seen-flags
            -- zeroed so the post-fight cutscene isn't treated as already-seen. A
            -- one-shot zero can be clobbered by the game re-setting the flag, so
            -- re-assert every frame. zurg_first_done is set only in the Zurg path.
            -- Guarded to NOT run on the map (level 16) — zeroing flags on the map
            -- warps; if the player leaves Zurg to the map, the cancel branch handles it.
            if CS.zurg_first_done and not CS.saw_boss_defeat and level~=MAP_LEVEL_ID then
                for _,addr in ipairs(CUTSCENE_ADDRS) do mainmemory.write_u8(addr,0) end
            end
            if CS.trigger_timer==0 and (cs_state==32 or cs_state==64) then
                cs_freeze_input(); CS.phase=2
            end
        elseif CS.phase==2 then
            cs_freeze_input()
            cs_lock_speed()   -- hold emulator at 100% during the cutscene (Option C)
            -- Force the level ID to the correct value DURING the cutscene so the
            -- game doesn't redirect the post-cutscene load to the wrong level.
            cs_force_level()
            if CS.level_changed then
                CS.level_changed=false
            else
                if cs_state==64 then CS.zurg_saw_64=true end
                if cs_state==0 and CS.zurg_saw_64 then
                    CS.zurg_saw_64=false
                    CS.cycles=CS.cycles+1
                    if CS.saw_boss_defeat then
                        -- Boss cutscene (after defeat): complete.
                        cs_complete()
                    elseif CS.entered_level==12 and CS.cycles==1 then
                        -- Zurg pre-fight (first of two cutscenes): wait for the
                        -- second via post_pending. Only Zurg legitimately has a
                        -- two-cutscene sequence with a level transition between.
                        -- (Use entered_level, not level — level is forced during
                        -- the cutscene.)
                        CS.post_pending=true; CS.post_timer=POST_CS_WAIT; CS.phase=1
                    else
                        -- Normal/coin-level single cutscene: complete IMMEDIATELY.
                        cs_complete()
                    end
                end
            end
        end
    end
end

function update_traps(level)
    -- Narrow vision
    local narrow_q=mainmemory.read_u8(SHARED_TRAP_NARROW)
    if narrow_q>0 and not narrow_active then
        mainmemory.write_u8(SHARED_TRAP_NARROW,narrow_q-1)
        narrow_active=true; narrow_frames=NARROW_DURATION
    end
    if narrow_active then
        -- Write the narrow-vision (letterbox) value EVERY frame, not just once.
        -- The game reuses this same letterbox when talking to NPCs (e.g. Rex),
        -- which would otherwise reset it and cancel the trap early. Re-asserting
        -- it each frame keeps the trap going through any dialog until its timer
        -- expires.
        mainmemory.write_u8(A.NARROW_VIS,115)
        narrow_frames=narrow_frames-1
        if narrow_frames<=0 then narrow_active=false end
    end

    -- Freeze buzz
    local freeze_q=mainmemory.read_u8(SHARED_TRAP_FREEZE)
    if freeze_q>0 and not freeze_active then
        mainmemory.write_u8(SHARED_TRAP_FREEZE,freeze_q-1)
        freeze_active=true; freeze_frames=FREEZE_DURATION
    end
    if freeze_active then
        -- Re-assert the freeze value EVERY frame (the original trap module does
        -- this too). Writing once let the game clear it and unfreeze early. Also
        -- freeze the controller input (255 = no buttons) like the original, so the
        -- player genuinely can't act during the freeze.
        mainmemory.write_u8(A.FREEZE,2)
        mainmemory.write_u8(A.INPUT,255)
        freeze_frames=freeze_frames-1
        if freeze_frames<=0 then mainmemory.write_u8(A.FREEZE,0); freeze_active=false end
    end

    -- Invincible enemies
    local invince_q=mainmemory.read_u8(SHARED_TRAP_INVINCIBLE)
    if invince_q>0 and not invince_active then
        mainmemory.write_u8(SHARED_TRAP_INVINCIBLE,invince_q-1)
        mainmemory.write_u32_le(A.INVINCE,0x00000000)
        invince_active=true; invince_frames=INVINCE_DURATION
    end
    if invince_active then
        invince_frames=invince_frames-1
        if invince_frames<=0 then
            mainmemory.write_u32_le(A.INVINCE,0xA602007A)
            invince_active=false
        end
    end

    -- Damage Buzz trap
    local damage_q=mainmemory.read_u8(SHARED_TRAP_DAMAGE)
    if damage_q>0 then
        mainmemory.write_u8(SHARED_TRAP_DAMAGE,damage_q-1)
        local health=mainmemory.read_u8(A.BUZZ_HP)
        if health>1 then
            mainmemory.write_u8(A.BUZZ_HP,math.max(1,health-3))
            mainmemory.write_u8(A.BUZZ_IFRAME,0)
            mainmemory.write_u8(A.HEALTH_UI,88)
        end
    end

    -- Dizzy Buzz trap: cancel super spin, then run the clear-then-dizzy sequence
    -- (driven by the spin block in update_moves). Dizzy outranks spin level 3.
    -- Queue byte 0x1FFFD2 (SHARED_TRAP_DIZZY); client pushes, we consume here.
    local dizzy_q = mainmemory.read_u8(0x1FFFD2)
    if dizzy_q > 0 then
        mainmemory.write_u8(0x1FFFD2, dizzy_q - 1)
        spin3_on = false
        spin_consumed = true
        dizzy_seq = SPIN_DIZZY_CLEAR + 1
    end

    -- Cutscene trap state machine runs every frame in the main loop (it must run
    -- on the map and boss-defeat screens too), not here.

    -- Death link RECEIVE only. The client detects our own death by reading
    -- Buzz's health directly and sends the Bounce; it writes SHARED_DEATH_LINK
    -- only when ANOTHER player dies. The Lua must NOT write this address on our
    -- own death — doing so created a self-kill loop. We only consume incoming
    -- deaths here.
    local dl_q = mainmemory.read_u8(SHARED_DEATH_LINK)
    if dl_q>0 and is_death_link() and DEATH_PHASE==0 and level>=1 and level<=15 then
        -- Kill Buzz: HP(0x0B221E)=255, state(0x0A155C)=255, death-anim(0x0A136E)=2.
        -- Gated to a playable level so a death arriving on the map/Level Select
        -- stays queued and applies once the player is back in gameplay.
        mainmemory.write_u8(SHARED_DEATH_LINK, dl_q-1)
        -- If Never Game Over is on and Buzz is out of lives, a normal kill here
        -- would force a Game Over (death link bypassing the QOL). Instead run the
        -- NGO rescue: boot to the map (0x0A135E=1) with 5 lives + full health and
        -- write 5 to the result byte 0x0A136E. No death-freeze is needed since
        -- Buzz isn't actually dying.
        if is_never_game_over() and mainmemory.read_u8(A.BUZZ_LIVES)==0 then
            mainmemory.write_u8(0x0A135E, 1)
            mainmemory.write_u8(0x0A136E, 5)
            mainmemory.write_u8(A.BUZZ_LIVES, 5)
            mainmemory.write_u8(A.BUZZ_HP, 14)
        else
            mainmemory.write_u8(0x0B221E, 255)
            mainmemory.write_u8(0x0A155C, 255)
            mainmemory.write_u8(0x0A136E, 2)
            DEATH_PHASE    = 1
            DEATH_A_FRAMES = 0
        end
    end

    -- Death sequence. While the death animation plays (0x0A136E==2) we freeze Buzz
    -- (freeze flag + movement input 0x0A3DDA) and hold his i-frame timer (0x0B221C)
    -- at 255 so nothing can damage him mid-death. The instant he comes back
    -- (0x0A136E returns to 0) we release the freeze and write the i-frame timer to
    -- 90 once, then let the game decay it naturally. Freeze writes are gated to
    -- playable levels so we never block input on the map or a loading screen; the
    -- backstop bails out if the anim byte somehow never clears.
    if DEATH_PHASE==1 then
        if mainmemory.read_u8(0x0A136E)==0 then
            mainmemory.write_u8(A.FREEZE, 0)
            mainmemory.write_u8(0x0B221C, 90)
            DEATH_PHASE = 0
        else
            if level>=1 and level<=15 then
                mainmemory.write_u8(A.FREEZE, 2)
                mainmemory.write_u8(0x0A3DDA, 255)
                mainmemory.write_u8(0x0B221C, 255)
            end
            DEATH_A_FRAMES = DEATH_A_FRAMES + 1
            if DEATH_A_FRAMES >= 600 then
                mainmemory.write_u8(A.FREEZE, 0)
                DEATH_PHASE = 0
            end
        end
    end

    -- Filler: Invincible Buzz (15 seconds of i-frames). Only ticks inside a
    -- playable level. Death link takes PRIORITY: if a death is being processed
    -- (DEATH_PHASE~=0) or an incoming death-link is queued, cancel invincibility
    -- so the death lands.
    if level>=1 and level<=15 then
        local dl_incoming = is_death_link() and mainmemory.read_u8(SHARED_DEATH_LINK) > 0
        if DEATH_PHASE~=0 or dl_incoming then
            buzz_invince_frames = 0
        else
            if buzz_invince_frames<=0 then
                local q = mainmemory.read_u8(SHARED_INVINCIBLE_BUZZ)
                if q>0 then
                    mainmemory.write_u8(SHARED_INVINCIBLE_BUZZ, q-1)
                    buzz_invince_frames = INVINCE_BUZZ_FRAMES
                end
            end
            if buzz_invince_frames>0 then
                mainmemory.write_u8(A.BUZZ_IFRAME, 10)
                buzz_invince_frames = buzz_invince_frames - 1
            end
        end
    else
        buzz_invince_frames = 0
    end

    -- QOL: Start every level with full health. on_level_change arms a short
    -- window (full_health_frames); we assert HP=14 across it so the write lands
    -- AFTER the level finishes loading (a single write on the change frame is
    -- overwritten by the load). Yields to a death-link death so it can't revive.
    if full_health_frames>0 then
        if level>=1 and level<=15 then
            full_health_frames = full_health_frames - 1
            if is_start_full_health() and DEATH_PHASE==0 then
                mainmemory.write_u8(A.BUZZ_HP, 14)
            end
        else
            full_health_frames = 0
        end
    end

    -- QOL: Never Game Over. In a playable level, if Buzz is out of lives and his
    -- health hits 0, boot him to the map (0x0A135E=1) with 5 lives and full
    -- health instead of a game over. One-shot per drain (re-armed when HP>0).
    if is_never_game_over() and level>=1 and level<=15 then
        local ngo_lives  = mainmemory.read_u8(A.BUZZ_LIVES)
        local ngo_health = mainmemory.read_u8(A.BUZZ_HP)
        if ngo_lives==0 and ngo_health==0 then
            if ngo_armed then
                ngo_armed = false
                mainmemory.write_u8(0x0A135E, 1)
                -- Write 5 (not 1) to the result byte: 5 is safe in every level
                -- type incl. bosses and coin levels, whereas 1 made a boss fight
                -- register as WON.
                mainmemory.write_u8(0x0A136E, 5)
                mainmemory.write_u8(A.BUZZ_LIVES, 5)
                mainmemory.write_u8(A.BUZZ_HP, 14)
            end
        else
            ngo_armed = true
        end
    end

    -- Filler: Extra life
    local life_q=mainmemory.read_u8(SHARED_EXTRA_LIFE)
    if life_q>0 then
        mainmemory.write_u8(SHARED_EXTRA_LIFE,life_q-1)
        local lives=mainmemory.read_u8(A.BUZZ_LIVES)
        mainmemory.write_u8(A.BUZZ_LIVES,math.min(9,lives+1))
        mainmemory.write_u8(A.LIVES_UI,88)
    end

    -- Filler: Health up
    local hp_q=mainmemory.read_u8(SHARED_HEALTH_UP)
    if hp_q>0 then
        mainmemory.write_u8(SHARED_HEALTH_UP,hp_q-1)
        local health=mainmemory.read_u8(A.BUZZ_HP)
        if health<14 then
            mainmemory.write_u8(A.BUZZ_HP,math.min(14,health+4))
            mainmemory.write_u8(A.BUZZ_IFRAME,30)
            mainmemory.write_u8(A.HEALTH_UI,88)
        end
    end
end

function update_boss(level)
    local hp=mainmemory.read_u8(A.BOSS_HP)
    local defeats=mainmemory.read_u8(SHARED_BOSS_DEFEATS)
    if level==6 then
        -- Bombs Away. Like the other bosses, require having SEEN THE BOSS ALIVE
        -- (hp>0) at least once this entry before accepting hp==0 as a defeat.
        -- Without this gate, the transient hp==0 the game shows during the
        -- level-load window (before the boss object initializes) fired the defeat
        -- the instant the level loaded. The other boss branches gate on their exact
        -- spawn HP (99/26/29); Bombs Away's spawn value isn't known, so "seen alive"
        -- is the robust equivalent.
        if (defeats&(1<<0))==0 then
            if hp>0 then boss_started.bombs=true end
            if boss_started.bombs and hp==0 and not boss_defeated then
                boss_defeated=true
                mainmemory.write_u8(SHARED_BOSS_DEFEATS, defeats|(1<<0))
            end
        end
    elseif level==3 then
        -- Slime Time: arm on a CONFIDENT-alive reading AND only once the level has
        -- actually started (buzz_moved). Slime's HP jumps straight 99 -> 0, and the
        -- game shows HP transients during the load before Buzz spawns; requiring
        -- buzz_moved (real gameplay) plus a clearly-high value (>=50) keeps a
        -- load-window transient from arming and firing a false early defeat.
        if (defeats&(1<<1))==0 and buzz_moved then
            if hp>=50 then boss_started.slime=true end
            if boss_started.slime and hp==0 and not boss_defeated then
                boss_defeated=true
                mainmemory.write_u8(SHARED_BOSS_DEFEATS, defeats|(1<<1))
            end
        end
    elseif level==9 then
        -- Toy Barn Encounter: "seen alive" gate, but ONLY once the level has
        -- actually started (buzz_moved). During the load the HP byte reads garbage
        -- transients (e.g. 26 -> 0 -> 26 before Buzz spawns), which previously armed
        -- and fired a false early defeat. Requiring buzz_moved gates out the load
        -- window so only the real fight counts.
        if (defeats&(1<<2))==0 and buzz_moved then
            if hp>0 then boss_started.toybarn=true end
            if boss_started.toybarn and hp==0 and not boss_defeated then
                boss_defeated=true
                mainmemory.write_u8(SHARED_BOSS_DEFEATS, defeats|(1<<2))
            end
        end
    elseif level==12 then
        -- Evil Emperor Zurg: defeat is hp<=9 (not hp==0). Arm via the level-load
        -- system (buzz_moved) rather than an HP reading: Zurg's HP always reaches
        -- <=9 before the post-fight cutscene, and arming on a clean hp>9 frame was
        -- unreliable around the entry/cutscene window (the 'missed first time' bug).
        -- buzz_moved means the load finished and gameplay started, so the load-window
        -- HP garbage is over and Zurg reads his real HP (starts at 29); from then on
        -- any hp<=9 is the real defeat.
        if (defeats&(1<<3))==0 then
            if buzz_moved then boss_started.zurg=true end
            if boss_started.zurg and hp<=9 and not boss_defeated then
                boss_defeated=true
                mainmemory.write_u8(SHARED_BOSS_DEFEATS, defeats|(1<<3))
            end
        end
    elseif level==15 then
        local hp2=mainmemory.read_u8(A.PROSP2)
        local hp3=mainmemory.read_u8(A.PROSP3)
        if not boss_defeated then
            if hp<=28 and hp>0 and hp2<=28 and hp2>0 and hp3<=28 and hp3>0 then
                prosp_loading=true
            end
            if prosp_loading and hp<=9 and hp2<=9 and hp3<=9 then
                boss_defeated=true
            end
        end
    end
end

function update_potato(level)
    if buzz_moved and not gadgets_written then
        gadgets_written=true
        if PARTS[level] then
            part_watched=true
        end
    end

    -- Apply gadget state only when its ownership CHANGES (not every frame).
    -- Writing the gadget container/hitbox addresses every single frame corrupted
    -- game memory when Hamm's room in Al's Toy Barn loaded (those addresses get
    -- reused there) and crashed the game. Applying on entry and again only when
    -- the client flips the "you own this" flag gives the same result (usability
    -- written when the item arrives) without the constant writes.
    if buzz_moved then
        for shared_addr,gadget in pairs(GADGETS) do
            if gadget.level==level then
                local owned = mainmemory.read_u8(shared_addr)==1 and 1 or 0
                if buzz_spawn.gadget_applied[shared_addr] ~= owned then
                    buzz_spawn.gadget_applied[shared_addr] = owned
                    if owned==1 then unlock_gadget(gadget) else write_gadget(gadget) end
                end
                -- Re-assert usability EVERY frame: owned gadgets stay usable
                -- (the game resets usability on level load), and UN-owned gadgets
                -- stay locked (the game can re-open a level's native Potato-Head
                -- gadget after entry -- our one-time entry lock isn't enough).
                if owned==1 then assert_gadget_usable(gadget)
                else assert_gadget_unusable(gadget) end
            end
        end
    end

    -- Potato Head UI: show the "give me my part" prompt ONLY when the player
    -- actually HAS the part (received it) AND hasn't given it back yet
    -- (exchanged). Otherwise force it off. We read the persistent flags every
    -- frame so it's correct on entry, on receipt, and after exchanging — and so
    -- a stale UI the game turns on gets cleared when we don't have the part or
    -- already turned it in.
    if buzz_moved and PARTS[level] then
        local part=PARTS[level]
        -- KEEP THE MISSING-PART PICKUP COLLECTABLE: giving Potato Head a part makes
        -- the game mark his level's gadget unlocked (bit in 0x0A1154) and tear down
        -- the world pickup. The "Missing X" pickup is a SEPARATE AP check, so while
        -- it hasn't been collected yet we clear that gadget's unlock bit, which
        -- makes the game re-spawn the pickup. "Collected" is read from the server
        -- seed (survives resets) OR our session latch — never the garbage-prone
        -- collected_flag. Once the Missing check is done we leave the bit alone.
        local gbit = PART_GADGET_BIT[level]
        if gbit then
            local seed = mainmemory.read_u8(SHARED_DESPAWN_PART)
            local missing_done = ((seed & (PART_SEED_BIT[level] or 0)) ~= 0)
                or potato_collected_latch[level]
            local own_addr = NATIVE_GADGET_OWN[level]
            local own_native = own_addr and mainmemory.read_u8(own_addr)==1
            -- Clear the native gadget-unlock bit UNLESS you both own this level's
            -- gadget item AND have collected its Missing pickup. Keeps the Missing
            -- pickup spawnable AND stops the game natively granting the gadget when
            -- you don't own the item (the Rocket-Boots-in-Toy-Barn leak). Owned
            -- gadgets stay usable via the apply loop regardless of this bit.
            if not (own_native and missing_done) then
                local cur = mainmemory.read_u8(GADGET_UNLOCK_ADDR)
                if (cur & gbit) ~= 0 then
                    mainmemory.write_u8(GADGET_UNLOCK_ADDR, cur & (~gbit & 0xFF))
                end
            end
        end
        local received  = mainmemory.read_u8(part.received_flag)==1
        local seedbit_e = PART_SEED_BIT[level] or 0
        local exchanged = part_exchanged or potato_exchanged_latch[level]
            or (mainmemory.read_u8(SHARED_DESPAWN_PART_EXCH) & seedbit_e) ~= 0
        -- Latch the exchanged state for the session once seen, so a corrupted
        -- read on a later frame can't turn the prompt back on.
        if exchanged then potato_exchanged_latch[level]=true end
        -- "Collected" comes from our session latch OR the server seed (both
        -- reliable) — NOT the garbage-prone collected_flag. When collected, keep
        -- the pickup hidden AND re-assert collected_flag=1 every frame so the
        -- client reliably reads it (game RAM can overwrite that byte with garbage).
        local seedbit2 = PART_SEED_BIT[level] or 0
        local is_collected = potato_collected_latch[level]
            or (mainmemory.read_u8(SHARED_DESPAWN_PART) & seedbit2) ~= 0
        if is_collected then
            mainmemory.write_u8(part.collected_flag,1)
            hide_part(level)
        end
        if received and not exchanged then
            mainmemory.write_u8(A.POTATO_UI,255)
        else
            mainmemory.write_u8(A.POTATO_UI,0)
        end
    end

    -- Toy COLLECTION detection FIRST (before write_toys re-hides anything): when
    -- the player picks up a toy the game sets its addr to 0; we latch that into
    -- our mask and write the shared collected mask so the client sends the check.
    if buzz_moved and TOYS[level] then
        -- OR in the server's despawn seed (collected toys from checked_locations,
        -- published one-direction by the client) so prior-session toys stay hidden
        -- across resets. Safe: the client never reads this seed back.
        toy_collected_masks[level]=(toy_collected_masks[level] or 0)
            | mainmemory.read_u8(SHARED_DESPAWN_TOY)
        for i,toy in ipairs(TOYS[level]) do
            local bit=2^(i-1)
            local already=(toy_collected_masks[level]&bit)~=0
            if not already and mainmemory.read_u8(toy.addr)==0 then
                toy_collected_masks[level]=toy_collected_masks[level]|bit
                mainmemory.write_u8(SHARED_TOY_COLLECTED[level],toy_collected_masks[level])
            end
        end
    end

    if buzz_moved and TOYS[level] and SHARED_TOY_RECEIVED[level] then
        -- Refresh the received-toy count EVERY frame (not once on entry): the
        -- client may write it after we enter, or you may receive a toy while
        -- already standing in the level. Clamp obvious garbage (a received count
        -- can't exceed the level's toy count).
        local rc=mainmemory.read_u8(SHARED_TOY_RECEIVED[level])
        if rc>#TOYS[level] then rc=0 end
        toy_received_counts[level]=rc
        if not toys_written then toys_written=true end
        write_toys(level)
    end

    if part_watched and buzz_moved and PARTS[level] and not potato_collected_latch[level]
       and sanity_load_timer >= SANITY_LOAD_WAIT then
        local part=PARTS[level]
        -- Already collected per the SERVER (survives resets)? Then never re-detect.
        local seedbit = PART_SEED_BIT[level] or 0
        local server_collected = (mainmemory.read_u8(SHARED_DESPAWN_PART) & seedbit) ~= 0
        -- A genuine physical-pickup collection happens during FREE MOVEMENT, never
        -- while a dialog is open. Giving Potato Head the part happens inside his
        -- dialog; the dialog guard keeps that from being seen as a pickup.
        local dialog_now = mainmemory.read_u32_le(A.DIALOG_OPEN)~=0
        -- SEEN-PRESENT guard: only believe a "collected" (hitbox==0) reading if we
        -- first observed the part actually PRESENT (a hitbox byte non-zero) this
        -- visit, so a hitbox that merely reads 0 (not spawned / reused addr) can't
        -- false-fire a phantom check.
        if not part_seen_present[level] then
            for _,h in ipairs(part.hitbox) do
                if mainmemory.read_u8(h.addr)~=0 then part_seen_present[level]=true break end
            end
        end
        -- NOTE: we deliberately do NOT gate on part.collected_flag / exchanged_flag
        -- here — those RAM addresses read garbage (128/255), which was BLOCKING
        -- legitimate collection. Reliable signals only: seen-present, not in a
        -- dialog, not already collected (server seed), and the hitbox going to 0.
        -- Debounce so a transient 0 during load can't fire.
        if part_seen_present[level] and not dialog_now and not server_collected
           and is_part_collected(level) then
            potato_collect_streak[level]=(potato_collect_streak[level] or 0)+1
        else
            potato_collect_streak[level]=0
        end
        if (potato_collect_streak[level] or 0) >= POTATO_COLLECT_HOLD then
            mainmemory.write_u8(part.collected_flag,1)
            potato_collected_latch[level]=true
            mainmemory.write_u8(A.POTATO_UI,0)
            hide_part(level)
        end
    end


    local dialog_open2=mainmemory.read_u32_le(A.DIALOG_OPEN)~=0
    if dialog_open2 and not dialog_was_open then
        local bytes=read_dialog_bytes(40)
        -- Is this part already turned in? Trust the session latch and the
        -- server-restored exchanged flag (the client rewrites it from checked
        -- "Give Potato Head His X" locations on connect), NOT the game's own
        -- state — the game forgets the exchange on reload and would re-show the
        -- "find my missing part" offer.
        local already_given = PARTS[level] and (potato_exchanged_latch[level] or
            ((mainmemory.read_u8(SHARED_DESPAWN_PART_EXCH) & (PART_SEED_BIT[level] or 0)) ~= 0))
        if PARTS[level] then
            local sig=DIALOG_SIGNATURES.potato_uncollected[level]
            if sig and match_sig(bytes,sig) then
                if already_given then
                    -- Already gave him the part: show the post-gift dialog instead
                    -- of re-offering. Mark the latch so it stays consistent.
                    potato_exchanged_latch[level]=true
                    local idx=potato_collected2_idx[level]
                    write_dialog(NEW_DIALOG.potato_collected2[idx])
                    update_model(level)
                    mainmemory.write_u8(A.POTATO_UI,0)
                else
                    write_dialog(NEW_DIALOG.potato_uncollected[level])
                end
            end
        end
        if PARTS[level] and match_sig(bytes,DIALOG_SIGNATURES.potato_collected1) then
            write_dialog(NEW_DIALOG.potato_collected1[level])
            update_model(level)
            part_exchanged=true
            -- Mark this part as turned in so the client sends the
            -- "Give Potato Head His X" check.
            if PARTS[level].exchanged_flag then
                mainmemory.write_u8(PARTS[level].exchanged_flag, 1)
            end
            for shared_addr,gadget in pairs(GADGETS) do
                if gadget.level==level then
                    if mainmemory.read_u8(shared_addr)==1 then unlock_gadget(gadget)
                    else write_gadget(gadget) end
                end
            end
            mainmemory.write_u8(A.POTATO_UI,0)
        end
        if PARTS[level] then
            local sig2=DIALOG_SIGNATURES.potato_collected2[level]
            if sig2 and match_sig(bytes,sig2) then
                local idx=potato_collected2_idx[level]
                write_dialog(NEW_DIALOG.potato_collected2[idx])
                if idx<#NEW_DIALOG.potato_collected2 then
                    potato_collected2_idx[level]=idx+1
                end
            end
        end
        if match_sig(bytes,DIALOG_SIGNATURES.hamm_uncollected) then
            write_dialog(hamm_uncollected_idx==1 and NEW_DIALOG.hamm_uncollected1 or NEW_DIALOG.hamm_uncollected2)
            hamm_uncollected_idx=(hamm_uncollected_idx%2)+1
        end
        if match_sig(bytes,DIALOG_SIGNATURES.hamm_collected) then
            write_dialog(NEW_DIALOG.hamm_collected)
        end
    end
    dialog_was_open=dialog_open2
end

function update_sanity(level)
    -- Wait for the level to settle after load before reading pickup state.
    -- During the load animation the pickup addresses can transiently read as
    -- collected (value 5), which would fire phantom life/battery/laser checks.
    if sanity_load_timer < SANITY_LOAD_WAIT then
        sanity_load_timer = sanity_load_timer + 1
        return
    end
    if buzz_moved then
        -- Detection (which merges the server despawn-seed into the local mask)
        -- runs every frame. Re-apply the despawn write whenever the merged mask
        -- CHANGES (a server-restored collection arrived, or a fresh pickup was
        -- detected) — and once on entry. Running write_sanity_items unconditionally
        -- every frame would clobber the game's "just collected" (==5) marker before
        -- detection sees it, so we only write when the mask changed.
        local before = (battery_masks[level] or 0)..","..(life_masks[level] or 0)..","..(laser_masks[level] or 0)
        check_sanity_pickups(level)
        local after = (battery_masks[level] or 0)..","..(life_masks[level] or 0)..","..(laser_masks[level] or 0)
        if not items_written or before~=after then
            write_sanity_items(level)
            items_written=true
        end
        last_life_count=mainmemory.read_u8(A.LIFE)
    end
end

-- ============================================================
-- AUTO COIN COLLECTOR (QOL)
-- Enemy-dropped coins live in the object block COIN_BLOCK_LO..HI. A coin's marker
-- byte reads 0x10; the reliable fingerprint (from hex-editor analysis) is:
--   marker==0x10, byte[-6]==byte[-4] (nonzero, the matching "identity" pair),
--   byte[-5]==0 (between the pair), byte[-3]==0 (just after it).
-- To collect: zero a wide window (-16..+2) around the marker (the proven despawn),
-- and bump the raw coin counter by 1. The increment then flows through the normal
-- coin handling:
--   * Coinsanity ON  -> update_coins() CASE 2 sees the raw rise this same frame,
--     converts it to bundle progress, and SUPPRESSES the pickup UI (coins are
--     checks, so they must not show as spendable). We do NOT write the UI here.
--   * Coinsanity OFF -> the +1 stands as a real spendable coin; we write 0x88 to
--     A.COIN_ANIM (0x0CD404) once so the pickup UI shows, matching a normal grab.
-- Gated on is_autocoins() + a settle wait so we never act on load-window garbage.
COIN_BLOCK_LO   = 0x0CE150
COIN_BLOCK_HI   = 0x0CF0EF
COIN_MARKER     = 0x10
COIN_DESPAWN_LO = -16
COIN_DESPAWN_HI = 2
COIN_UI_VALUE   = 0x88   -- written to A.COIN_ANIM on collect (non-coinsanity)
autocoin_load_timer = 0
AUTOCOIN_LOAD_WAIT  = 120

function ac_is_coin(m)
    if mainmemory.read_u8(m) ~= COIN_MARKER then return false end
    if m-6 < 0 then return false end
    local b6 = mainmemory.read_u8(m-6)
    if b6 == 0 then return false end
    if b6 ~= mainmemory.read_u8(m-4) then return false end   -- identity pair equal
    if mainmemory.read_u8(m-5) ~= 0 then return false end     -- zero between pair
    if mainmemory.read_u8(m-3) ~= 0 then return false end     -- zero after pair
    return true
end

function update_auto_coins(level)
    if not is_autocoins() then return end
    -- Coin levels ONLY. The scan-and-wide-zero below operates on 0x0CE150-0x0CF0EF,
    -- which on BOSS levels holds boss/projectile object data — zeroing it there
    -- corrupted the Bombs Away fight and crashed the game on defeat. Coins only
    -- exist on coin levels anyway, so gating here costs nothing. (Mirrors the
    -- COIN_LEVEL_IDS guard in update_coins.)
    if not COIN_LEVEL_IDS[level] then return end
    -- Settle gate: don't scan/collect during the load window (object RAM there is
    -- uninitialised on entry; acting on it could despawn/garbage-collect wrongly).
    if not buzz_moved then autocoin_load_timer = 0; return end
    if autocoin_load_timer < AUTOCOIN_LOAD_WAIT then
        autocoin_load_timer = autocoin_load_timer + 1
        return
    end

    local collected = 0
    for a = COIN_BLOCK_LO, COIN_BLOCK_HI do
        if ac_is_coin(a) then
            -- Despawn: wide zero around the marker (proven to remove the coin).
            for o = COIN_DESPAWN_LO, COIN_DESPAWN_HI do
                local x = a + o
                if x >= 0 then mainmemory.write_u8(x, 0) end
            end
            -- Bump the raw coin counter by 1 (u8 ceiling guard).
            local c = mainmemory.read_u8(A.COIN)
            if c < 255 then mainmemory.write_u8(A.COIN, c + 1) end
            collected = collected + 1
        end
    end

    -- Non-coinsanity: show the pickup UI for the coins we just grabbed. In
    -- coinsanity, update_coins() handles (and suppresses) the UI instead.
    if collected > 0 and not is_coinsanity() then
        mainmemory.write_u8(A.COIN_ANIM, COIN_UI_VALUE)
    end
end

function update_coins(level)
    if not is_coinsanity() or not COIN_LEVEL_IDS[level] then return end
    coin_load_timer=coin_load_timer+1
    if coin_load_timer<COIN_LOAD_WAIT then return end

    -- ADOPT SERVER BASELINE — the client's _restore_from_server writes the highest
    -- Coin Bundle already checked on the server into SHARED_COINS[level] on (re)connect.
    -- coins_checked only inits to 0 at Lua load, so after a BizHawk/Lua reload a return
    -- visit would re-derive bundles from 1 as the player re-collects, overwrite the
    -- restored value with a lower count, and re-send (auto-release) bundles already
    -- checked. Seed coins_checked from the restored count (raise only, capped at the
    -- level's real bundle count so RAM garbage can't seed) so re-collection starts
    -- ABOVE the baseline and checked bundles can never re-fire.
    do
        local sc_addr = SHARED_COINS[level]
        if sc_addr then
            local cb   = get_checks_bundle_size()
            local maxc = COIN_MAX[level]
            local maxb = (cb and cb > 0 and maxc) and math.ceil(maxc / cb) or 255
            local server_checked = mainmemory.read_u8(sc_addr)
            if server_checked > (coins_checked[level] or 0) and server_checked <= maxb then
                coins_checked[level] = server_checked
            end
        end
    end

    -- BASELINE — force the in-game coin counter to the AP-granted spendable amount
    -- as soon as the level has settled. This is SAFE to do before the player has
    -- moved: it only WRITES the correct amount, it doesn't read coin gains, so it
    -- can't fire a phantom check. Gating this on buzz_moved was the "coin maximum
    -- not set on load (fixed by leaving and coming back)" bug — when buzz_moved
    -- failed to arm on first entry, the spendable coins were never set this visit.
    if not coin_baseline_set then
        local ap0=get_coin_ap_amount(level)
        mainmemory.write_u8(A.COIN, ap0)
        last_ap_coins[level]=ap0
        coin_baseline_set=true
        coin_reassert=COIN_REASSERT_FRAMES   -- keep re-asserting through the game's post-load counter reset
        return
    end

    -- Baseline re-assert window: for a short time after the baseline, the game can
    -- still reset the coin counter to 0 as the level finishes loading. On a RE-ENTRY
    -- buzz_moved is already true, so the not-buzz_moved hold branch below is skipped
    -- and that reset would stick (counter stuck at 0). Re-assert ap_coins every
    -- frame during this window to bridge the reset. (Only active right after entry,
    -- so it can't interfere with later coin spending.)
    if coin_reassert>0 then
        local apr=get_coin_ap_amount(level)
        mainmemory.write_u8(A.COIN, apr)
        last_ap_coins[level]=apr
        coins_this_visit[level]=0   -- ignore any 'gain' during the load window
        coin_reassert=coin_reassert-1
        return
    end

    -- Coin-GAIN / collection detection below DOES read the live counter, where a
    -- stale/garbage value on entry could look like a huge gain and fire every
    -- bundle at once. So keep this gated on genuine movement.
    if not buzz_moved then
        -- Hold the counter at the current AP-granted amount while we wait for
        -- movement, so any transient garbage in A.COIN can't be mistaken for a
        -- gain once we start reading it, the player sees the correct spendable
        -- amount, and a bundle received before moving still reflects immediately.
        -- Keep last_ap_coins synced so arming doesn't read a false gain.
        local ap_now=get_coin_ap_amount(level)
        mainmemory.write_u8(A.COIN, ap_now)
        last_ap_coins[level]=ap_now
        return
    end

    local ap_coins=get_coin_ap_amount(level)
    local raw_coins=mainmemory.read_u8(A.COIN)

    -- CASE 0 — the live counter is BELOW the AP-granted spendable amount. The game
    -- resets the coin counter (to 0) on level start, and on a RE-ENTRY it keeps
    -- doing so for a while after our baseline write. A value below ap is NEVER a
    -- collection (collecting raises raw ABOVE ap), so any shortfall is the game's
    -- reset — restore the counter to the spendable amount. This is the permanent
    -- floor that fixes "coins start at 0 on re-entry".
    if raw_coins < ap_coins then
        mainmemory.write_u8(A.COIN, ap_coins)
        last_ap_coins[level]=ap_coins
        return
    end

    -- CASE 1 — received a Coin Bundle ITEM while in the level: ap_coins (the
    -- AP-granted spendable amount) has increased since last frame. Let the
    -- counter rise to the new amount WITH its normal pickup animation, so the
    -- player actually receives spendable coins. We do NOT suppress the UI here.
    if ap_coins > (last_ap_coins[level] or 0) then
        mainmemory.write_u8(A.COIN, ap_coins)
        last_ap_coins[level]=ap_coins
        return
    end
    last_ap_coins[level]=ap_coins

    -- CASE 2 — player physically collected a coin in-level (raw climbed above
    -- ap_coins). Coins are CHECKS, not currency: accumulate the gain toward this
    -- visit's bundle thresholds, SUPPRESS the pickup UI, and reset the counter
    -- back to ap_coins so collected coins never show on the meter. Per-visit
    -- counting + persistent coins_checked means re-collecting on a return visit
    -- can't advance past bundles already checked.
    if raw_coins>ap_coins then
        local gained=raw_coins-ap_coins
        coins_this_visit[level]=(coins_this_visit[level] or 0)+gained
        local total=coins_this_visit[level]
        local next_t=get_coin_next_threshold(level)
        while next_t~=nil and total>=next_t do
            coins_checked[level]=coins_checked[level]+1
            local addr=SHARED_COINS[level]
            if addr then mainmemory.write_u8(addr,coins_checked[level]) end
            next_t=get_coin_next_threshold(level)
        end
        mainmemory.write_u8(A.COIN, ap_coins)
        suppress_coin_ui=180  -- suppress the pickup animation (matches original)
    end
    -- Keep the coin pickup UI suppressed for the duration. We do NOT try to let
    -- R1 reveal it: A.INPUT is unreliable in-level (idle/garbage reads with bit 3
    -- clear were cancelling the suppression and letting the UI flash back on).
    -- Suppress BOTH the coin counter UI and the coin pickup ANIMATION address;
    -- hiding only the counter still let the pickup animation play.
    if suppress_coin_ui>0 then
        mainmemory.write_u8(A.COIN_UI,0)
        mainmemory.write_u8(A.COIN_ANIM,0)
        suppress_coin_ui=suppress_coin_ui-1
    end

    -- Hamm "give 50 coins" UI suppression. The game re-shows the prompt whenever
    -- the player has >=50 coins, even after they've already done this level's
    -- "Hamm's 50 Coins Token" check. The client writes SHARED_HAMM_DONE for this
    -- level (1) authoritatively from AP's checked_locations, so this is correct
    -- across reconnects. When done AND the player has >=50 coins, suppress the prompt
    -- by writing 0xFFFF over the 2-byte UI field at 0x0C2ADA (cleaner than zeroing
    -- the single byte at 0x0C2ADB, which made the UI jitter).
    local hamm_addr = SHARED_HAMM_DONE[level]
    if hamm_addr and mainmemory.read_u8(hamm_addr)~=0 and mainmemory.read_u8(A.COIN)>=50 then
        mainmemory.write_u16_le(0x0C2ADA, 0xFFFF)
    end
end

function update_rex(level)
    if not is_rexsanity() or not LEVEL_SIGNATURES[level] then return end
    local dialog_val=mainmemory.read_u32_le(A.DIALOG_OPEN)
    local dialog_open=dialog_val~=0
    if dialog_open and not was_dialog_open then rex_triggered=false end
    if not dialog_open and was_dialog_open then rex_triggered=false end
    if dialog_open and not rex_triggered then
        local bytes=read_rex_bytes()
        if is_rex_talking(level,bytes) then
            local replacement=get_rex_replacement(level)
            write_rex_text(replacement)
            rex_triggered=true
            if not is_rex_checked(level) then
                set_rex_checked(level)
                rex_state[level]=1
            else
                if (rex_state[level] or 1)<4 then
                    rex_state[level]=(rex_state[level] or 1)+1
                end
            end
        end
    end
    was_dialog_open=dialog_open
end

-- Convert an ASCII string to the dialog byte array, padded to TEXT_LENGTH (same
-- format make_text produces: text, a 0x00 terminator, then 0x20 fill). The dialog
-- text is plain ASCII; '^' (0x5E) is the game's highlight toggle, used verbatim.
function hint_str_to_text(s)
    local b={}
    for i=1,#s do b[i]=string.byte(s,i) end
    return make_text(b, TEXT_LENGTH)
end

-- Read the first 28 bytes of the dialog buffer for hint-block signature matching
-- (10 bytes, as Rex uses, is not enough to tell some blocks apart).
function read_hint_bytes()
    local b={}
    for i=0,27 do b[i+1]=mainmemory.read_u8(A.REX_TEXT+i) end
    return b
end

-- Build the four hint-block dialog variants per spec. `remaining` is how many
-- blocks in this level are still unfound AFTER accounting for the current one.
function build_hint_text(is_new, remaining, total)
    if is_new then
        if remaining<=0 then
            -- Last one collecting
            return hint_str_to_text("you found me buzz! have an ^ap item^!")
        else
            local noun = (remaining==1) and "hint block" or "hint blocks"
            return hint_str_to_text(string.format(
                "you found me buzz! have an ^ap item^! only ^%d^ more %s to go!",
                remaining, noun))
        end
    else
        if remaining<=0 then
            -- Already collected AND all found in this level
            return hint_str_to_text("you've already found ^all^ of us in   ^this level^ buzz!")
        else
            local noun = (remaining==1) and "hint block" or "hint blocks"
            return hint_str_to_text(string.format(
                "you already found me buzz! you're   still missing ^%d^ %s.",
                remaining, noun))
        end
    end
end

-- Count set bits in n (number of blocks found this level).
function hint_popcount(n)
    local c=0
    while n>0 do c=c+(n&1); n=n>>1 end
    return c
end

function update_hints(level)
    local blocks = HINT_BLOCKS[level]
    if not is_hintsanity() or not blocks then return end
    -- Only act once the level has settled (same gate the sanity systems use), so
    -- the client never reads the mask address during the load window when game RAM
    -- there is uninitialised. Before settle we hold the published mask at our known
    -- session value (0 on a fresh entry), overwriting any load garbage.
    local session = hint_lua_mask[level] or 0   -- touched THIS session only
    mainmemory.write_u16_le(HINT_MASK_ADDR, session)
    if not buzz_moved or sanity_load_timer < SANITY_LOAD_WAIT then return end
    -- Read-only server seed (already-checked blocks) for dialog/counter accuracy
    -- across resets. NEVER written to HINT_MASK_ADDR, so it can't cause a send.
    local seed = mainmemory.read_u16_le(HINT_SEED_ADDR)

    local dialog_open = mainmemory.read_u32_le(A.DIALOG_OPEN)~=0
    if dialog_open and not was_hint_dialog_open then hint_triggered=false end
    if not dialog_open and was_hint_dialog_open then hint_triggered=false end
    if dialog_open and not hint_triggered then
        local bytes = read_hint_bytes()
        for i,blk in ipairs(blocks) do
            if match_sig(bytes, blk.sig) then
                hint_triggered = true
                local bit = 1 << (i-1)
                local total = #blocks
                -- Already found = touched this session OR already checked (seed).
                local already = ((session | seed) & bit) ~= 0
                if not already then
                    session = session | bit
                    hint_lua_mask[level] = session
                    mainmemory.write_u16_le(HINT_MASK_ADDR, session)
                end
                local found = hint_popcount(session | seed)
                local remaining = total - found
                write_rex_text(build_hint_text(not already, remaining, total))
                break
            end
        end
    end
    was_hint_dialog_open = dialog_open
end

function update_music()
    local input=mainmemory.read_u8(A.INPUT)
    if skip_song_enabled() and music_mode()~=3 then
        if input==237 and skip_r2_was_up then
            skip_r2_was_up=false
            local nt=(music_current+1)%22
            mainmemory.write_u8(A.MUSIC,nt); music_current=nt
            music_display_timer=MUSIC_DISPLAY_FRAMES
        elseif input~=237 then skip_r2_was_up=true end
        if input==238 and skip_l2_was_up then
            skip_l2_was_up=false
            local pt=music_current-1; if pt<0 then pt=21 end
            mainmemory.write_u8(A.MUSIC,pt); music_current=pt
            music_display_timer=MUSIC_DISPLAY_FRAMES
        elseif input~=238 then skip_l2_was_up=true end
    end
    if music_display_timer>0 then
        music_display_timer=music_display_timer-1
        gui.text(10,20,"Now Playing: "..(TRACK_NAMES[music_current] or "?"),"white","black")
    end
end

-- ============================================================
-- ON-SCREEN ITEM FEED
-- ============================================================
-- The client writes a sequence byte at 0x1FFA00 and a message at 0x1FFA01,
-- encoded as alternating text|color|text|color... segments separated by '|'.
-- Color codes: w=white, g=green(items), c=cyan(players), y=yellow(locations),
-- r=red. New messages STACK vertically and each fades out on its own timer
-- (newest at the bottom). Anchored to the BOTTOM-LEFT: left-anchored x (like the
-- "Now Playing" text) is the only position that stays put regardless of window
-- size / fullscreen, because right-edge coords depend on the render width.
local feed = {seq=-1, msgs={}, CHAR_W=10, LIFE=360}

-- Select-button mode cycle for the on-screen feed.
--
-- 0x0A3DDA is an ACTIVE-LOW button bitmask (the d-pad + Select/Start/L3/R3 half of
-- the pad word; its partner byte A.INPUT=0x0A3DDB holds the face/shoulder buttons,
-- where cross is bit6 active-low). "Active-low" means a button is PRESSED when its
-- bit is CLEAR; at rest the byte reads 0xFF (nothing pressed). The earlier code
-- treated byte==0xFF as "Select held", but that's actually "nothing pressed" — so
-- it fired on every d-pad RELEASE (the byte returning to 0xFF). Select is bit0
-- (0x01): pressed when (byte & 0x01)==0. We edge-detect the press.
--
-- cs_freeze_input writes 0xFF to this byte during a cutscene trap (all released),
-- so that can't look like a Select press; we still gate on not CS.active for safety.
--
-- The MODE lives in the Python client (it decides what messages to send). On each
-- press the Lua bumps a one-direction counter at FEED_CYCLE_ADDR; the client
-- watches it and advances the mode (announcing it on screen) when it changes.
-- NOTE: this counter must NOT share a byte with anything the game/Lua writes during
-- play, or that write looks like a Select press. It originally sat at 0x1FF9C3,
-- which is the HIGH BYTE of the u16 hint mask (0x1FF9C2): writing the hint mask on
-- Andy's House entry, and the Living Room Recliner block (bit 8 -> high byte),
-- spuriously cycled the feed. It now lives at 0x1FF970, clear of all other shared
-- bytes.
--
-- IMPORTANT: we read the Select button from joypad.get() (the emulated controller
-- state), NOT from game RAM. The pad-state RAM byte 0x0A3DDA gives garbage/idle
-- reads in-level (the same problem the codebase already documented for its partner
-- byte A.INPUT at update_coins: spurious bit-clear reads), which made bit0 flicker
-- and randomly cycled the feed during the Bombs Away boss fight. joypad.get reads
-- the actual host->emulator input, so it's stable everywhere.
FEED_CYCLE_ADDR = 0x1FF970
feed_select_was_down = false

function select_is_pressed()
    -- Core-agnostic: scan the joypad table for any "Select" key being true. Works
    -- whether the core reports "Select" or "P1 Select" etc. Returns false safely
    -- if joypad.get is unavailable or returns nothing.
    local ok, pad = pcall(joypad.get)
    if not ok or type(pad) ~= "table" then return false end
    for name, val in pairs(pad) do
        if val and type(name) == "string" and name:find("Select") then
            return true
        end
    end
    return false
end

function update_item_feed()
    -- Debounced Select press -> bump the cycle counter (skip during cutscene trap).
    local sel_down = select_is_pressed() and not CS.active
    if sel_down and not feed_select_was_down then
        local c = mainmemory.read_u8(FEED_CYCLE_ADDR)
        mainmemory.write_u8(FEED_CYCLE_ADDR, (c + 1) % 256)
    end
    feed_select_was_down = sel_down

    local seq = mainmemory.read_u8(0x1FFA00)
    if seq ~= feed.seq then
        feed.seq = seq
        local chars = {}
        for i = 0, 119 do
            local b = mainmemory.read_u8(0x1FFA01 + i)
            if b == 0 then break end
            chars[#chars+1] = string.char(b)
        end
        local text = table.concat(chars)
        if text ~= "" then
            local parts = {}
            for tok in (text.."|"):gmatch("(.-)|") do parts[#parts+1]=tok end
            local pairs_list = {}
            for i=1,#parts,2 do
                pairs_list[#pairs_list+1] = {seg=parts[i], col=parts[i+1] or "w"}
            end
            -- Newest at the bottom: append.
            feed.msgs[#feed.msgs+1] = {pairs=pairs_list, timer=feed.LIFE}
            while #feed.msgs > 5 do table.remove(feed.msgs, 1) end
        end
    end

    -- Tick timers / drop expired (front = oldest).
    local i = 1
    while i <= #feed.msgs do
        feed.msgs[i].timer = feed.msgs[i].timer - 1
        if feed.msgs[i].timer <= 0 then table.remove(feed.msgs, i)
        else i = i + 1 end
    end
    if #feed.msgs == 0 then return end

    -- Top-left anchor: left-anchored x and a small fixed y are the only reliably
    -- positioned coordinates (bottom/right depend on the render buffer size,
    -- which doesn't track the window). Newest lowest, stacking downward; placed
    -- below the "Now Playing" line so they don't overlap.
    local COLORS = {w="white", g="lime", c="cyan", y="yellow", r="red", p="magenta", b="aqua"}
    local n = #feed.msgs
    for idx = 1, n do
        local m = feed.msgs[idx]
        -- Oldest (idx 1) on top, newest (idx n) at the bottom of the stack.
        local y = 40 + (idx - 1) * 16
        local x = 10
        for _,p in ipairs(m.pairs) do
            gui.text(x, y, p.seg, COLORS[p.col] or "white", "black")
            x = x + #p.seg*feed.CHAR_W + 4
        end
    end
end


function on_init()
    -- Music map is built lazily on first level entry (music_mode isn't known yet
    -- at init — the client writes settings after the Lua's first frame).

    -- Zero out all our shared scratch memory so the Python client never reads
    -- uninitialised garbage as "collected" before real gameplay begins.
    -- On-screen item feed buffer (in the safe scratch region; the 0x1FFFxx top
    -- of RAM is used by the game stack during load and writing there crashed the
    -- game when the script loaded together with it).
    mainmemory.write_u8(0x1FFA00, 0)
    for i = 0, 127 do mainmemory.write_u8(0x1FFA01 + i, 0) end
    -- Feed mode cycle counter (Select button -> client advances mode)
    mainmemory.write_u8(FEED_CYCLE_ADDR, 0)
    -- Coin bundle counters
    for _,addr in pairs(SHARED_COINS) do mainmemory.write_u8(addr, 0) end
    for _,addr in pairs(SHARED_COIN_ITEMS) do mainmemory.write_u8(addr, 0) end
    for _,addr in pairs(SHARED_HAMM_DONE) do mainmemory.write_u8(addr, 0) end
    for _,addr in pairs(SHARED_TOKENS_COLLECTED) do mainmemory.write_u8(addr, 0) end
    -- Toy collected masks + received counts
    for _,addr in pairs(SHARED_TOY_COLLECTED) do mainmemory.write_u8(addr, 0) end
    for _,addr in pairs(SHARED_TOY_RECEIVED)  do mainmemory.write_u8(addr, 0) end
    -- Battery / life / laser sanity masks
    for _,addr in pairs(SHARED_BATTERY)      do mainmemory.write_u8(addr, 0) end
    for _,addr in pairs(SHARED_LIFE)         do mainmemory.write_u8(addr, 0) end
    for _,addr in pairs(SHARED_LASER_SANITY) do mainmemory.write_u8(addr, 0) end
    -- Despawn seeds (client re-publishes these every tick from checked_locations)
    mainmemory.write_u8(SHARED_DESPAWN_BATTERY, 0)
    mainmemory.write_u8(SHARED_DESPAWN_LIFE, 0)
    mainmemory.write_u8(SHARED_DESPAWN_LASER, 0)
    mainmemory.write_u8(SHARED_DESPAWN_TOY, 0)
    mainmemory.write_u8(SHARED_DESPAWN_PART, 0)
    mainmemory.write_u8(SHARED_DESPAWN_PART_EXCH, 0)
    -- Hint blocks
    mainmemory.write_u16_le(HINT_MASK_ADDR, 0)
    mainmemory.write_u16_le(HINT_SEED_ADDR, 0)
    hint_lua_mask = {}
    hint_triggered = false
    was_hint_dialog_open = false
    -- Parts collected / received
    mainmemory.write_u8(SHARED_EAR_COLLECTED, 0)
    mainmemory.write_u8(SHARED_EYE_COLLECTED, 0)
    mainmemory.write_u8(SHARED_ARM_COLLECTED, 0)
    mainmemory.write_u8(SHARED_FOOT_COLLECTED, 0)
    mainmemory.write_u8(SHARED_MOUTH_COLLECTED, 0)
    mainmemory.write_u8(SHARED_EAR_RECEIVED, 0)
    mainmemory.write_u8(SHARED_EYE_RECEIVED, 0)
    mainmemory.write_u8(SHARED_ARM_RECEIVED, 0)
    mainmemory.write_u8(SHARED_FOOT_RECEIVED, 0)
    mainmemory.write_u8(SHARED_MOUTH_RECEIVED, 0)
    -- Parts exchanged (turned in)
    mainmemory.write_u8(SHARED_EAR_EXCHANGED, 0)
    mainmemory.write_u8(SHARED_EYE_EXCHANGED, 0)
    mainmemory.write_u8(SHARED_ARM_EXCHANGED, 0)
    mainmemory.write_u8(SHARED_FOOT_EXCHANGED, 0)
    mainmemory.write_u8(SHARED_MOUTH_EXCHANGED, 0)
    -- Rex masks
    mainmemory.write_u8(SHARED_REX_LOW, 0)
    mainmemory.write_u8(SHARED_REX_HIGH, 0)
    mainmemory.write_u8(SHARED_CONN_GEN, 0)
    mainmemory.write_u8(0x1FF97B, 0)
    mainmemory.write_u8(0x1FF97C, 0)
    mainmemory.write_u8(0x1FF97D, 0)  -- game-mode mirror (client writes mode+1)
    mainmemory.write_u8(0x1FF97E, 0)  -- cutscene-active flag (pauses client checks)
    -- Boss defeats
    mainmemory.write_u8(SHARED_BOSS_DEFEATS, 0)
    -- Player progress state (unlocks, tokens, tickets, moves, laser).
    -- These accumulate from received items; the client ORs new bits onto the
    -- current value, so they MUST start at 0 or boot garbage unlocks levels.
    mainmemory.write_u8(SHARED_UNLOCKS_LOW, 0)
    mainmemory.write_u8(SHARED_UNLOCKS_HIGH, 0)
    mainmemory.write_u8(SHARED_MOVE_UNLOCKS_LOW, 0)
    mainmemory.write_u8(SHARED_MOVE_UNLOCKS_HIGH, 0)
    mainmemory.write_u8(SHARED_TOKENS, 0)
    mainmemory.write_u8(SHARED_TICKETS, 0)
    mainmemory.write_u8(SHARED_LASER_LEVEL, 0)
    -- Gadgets received (addresses 0x1FF993-0x1FF9A0)
    for addr=0x1FF993,0x1FF9A0 do mainmemory.write_u8(addr, 0) end

    -- Write sentinel LAST so the client only validates once everything is zeroed
    mainmemory.write_u8(0x1FFFD0, 0xAB)
end

-- ============================================================
-- ON LEVEL CHANGE
-- ============================================================
function on_level_change(new_level, prev_level)
    -- Cutscene trap: run its level-change state machine FIRST (it inspects the
    -- new level + hover to decide whether to cancel, keep alive, or chain).
    cs_on_level_change(new_level)

    -- QOL: arm the start-of-level full-health window (asserted in update_traps
    -- so it lands after the level finishes loading).
    if new_level>=1 and new_level<=15 then
        full_health_frames = 180
    else
        full_health_frames = 0
    end

    -- Moves
    buzz_moved=false; last_buzz_x=-1; last_buzz_y=-1
    buzz_baseline_set=false
    buzz_spawn.started=false; buzz_spawn.base=0; buzz_spawn.cand=-1; buzz_spawn.stable=0; buzz_spawn.disc=nil
    buzz_spawn.move_x=nil; buzz_spawn.move_y=nil; buzz_spawn.move_frames=0; buzz_spawn.lr_frames=0
    -- Progressive Spin level 3: clear the "super spin" state on every level change
    -- so it never carries across an exit/entry (the spec clears 0x0A139C-0x0A139F on
    -- exit). It only re-arms via an O press once back in a level at spin level 3.
    spin3_on = false
    spin_streak = 0
    spin_consumed = false
    dizzy_seq = 0
    dizzy_active = false
    spin_ui_hold = 0
    clear_spin3()
    -- Snapshot the free-running counter at a MAP(16) -> LEVEL(1..15) transition.
    -- (Only that transition; other entries use the movement/timeout fallbacks.)
    if prev_level==16 and new_level>=1 and new_level<=15 then
        buzz_spawn.lr_snapshot = mainmemory.read_u8(A.LEVEL_READY)
    else
        buzz_spawn.lr_snapshot = nil
    end
    if not is_move_unlocked(BITS.SPIN)  then spin_restored=false end
    if not is_move_unlocked(BITS.POLE)  then pole_restored=false end
    if not is_move_unlocked(BITS.VAULT) then vault_restored=false end
    if not is_move_unlocked(BITS.PUSH)  then push_restored=false end
    if not is_move_unlocked(BITS.ROPE,true) then rope_restored=false end
    if not is_move_unlocked(BITS.VISOR) then visor_restored=false end
    if not is_move_unlocked(BITS.DBL_JUMP) then dbljump_restored=false end

    -- Boss
    boss_defeated=false; boss_started.slime=false; boss_started.toybarn=false
    boss_started.bombs=false
    boss_started.zurg=false; prosp_loading=false

    -- Coin sanity
    coin_load_timer=0
    coin_baseline_set=false
    coin_reassert=0
    coins_this_visit[new_level]=0
    autocoin_load_timer=0
    sanity_load_timer=0
    -- Authoritatively write the sanity shared masks from our own masks on entry,
    -- so any game RAM garbage at those shared addresses is cleared before the
    -- client can read it (otherwise a phantom life/battery/laser check can fire
    -- on load, before the detection gate even arms).
    if SHARED_BATTERY[new_level] then mainmemory.write_u8(SHARED_BATTERY[new_level], battery_masks[new_level] or 0) end
    if SHARED_LIFE[new_level] then mainmemory.write_u8(SHARED_LIFE[new_level], life_masks[new_level] or 0) end
    if SHARED_LASER_SANITY[new_level] then mainmemory.write_u8(SHARED_LASER_SANITY[new_level], laser_masks[new_level] or 0) end

    -- Pizza Planet tokens: the map sets every token byte to 1 (boss=128) for
    -- Open-mode access control, but that makes the Hamm bit read as "collected"
    -- the instant a level loads. Zero the incoming level's token byte (and our
    -- published shared byte + per-level sent tracking) so detection only fires
    -- on genuine in-level collection. The map restores the byte to 1 on return.
    if new_level>=1 and new_level<=15 then
        local hv=LEVEL_TO_HOVER[new_level]
        if hv then
            local ta=TOKEN_ADDR[hv]
            if ta then mainmemory.write_u8(ta,0) end
            local sa=SHARED_TOKENS_COLLECTED[hv]
            if sa then mainmemory.write_u8(sa,0) end
            token_checks_sent[new_level]=0
        end
    end

    -- Rex
    was_dialog_open=false; rex_triggered=false
    if LEVEL_SIGNATURES[new_level] then
        rex_state[new_level]=is_rex_checked(new_level) and 1 or 0
    end

    -- Hint blocks: reset the dialog trigger and publish the NEW level's current
    -- in-session found mask (so the client's current-level byte is correct on
    -- entry, not the previous level's bits). The client also re-derives the seed.
    was_hint_dialog_open=false; hint_triggered=false
    mainmemory.write_u16_le(HINT_MASK_ADDR, hint_lua_mask[new_level] or 0)

    -- Potato/gadgets
    gadgets_written=false; part_watched=false; part_exchanged=false; toys_written=false
    potato_collect_streak={}
    buzz_spawn.gadget_applied={}
    part_seen_present={}
    life_seen_present={}
    battery_seen_present={}
    laser_seen_present={}

    -- Sanity
    items_written=false
    last_life_count=mainmemory.read_u8(A.LIFE)

    -- Dialog
    dialog_was_open=false

    -- Map state
    if new_level==MAP_LEVEL_ID then
        map_saved=false
    else
        on_map=false
    end

    -- (Collected parts are kept hidden by hide_part() in update_potato every
    -- frame based on the server seed / session latch; no exit-time re-spawn.)

    -- Restore toys on level exit
    if SHARED_TOY_COLLECTED[prev_level] and TOYS[prev_level] then
        local collected_count=mainmemory.read_u8(SHARED_TOY_COLLECTED[prev_level])
        if collected_count>0 then
            for _,toy in ipairs(TOYS[prev_level]) do
                mainmemory.write_u8(toy.addr,toy.uncollected)
            end
            mainmemory.write_u8(SHARED_TOY_COLLECTED[prev_level],0)
        end
    end

    -- Music
    if new_level>=1 and new_level<=15 then
        local raw=mainmemory.read_u8(A.MUSIC)
        if raw~=255 then music_natural=raw end
        local mm=music_mode()
        local mapped
        if mm==1 then
            -- Build the map lazily: music_mode isn't known at on_init (the
            -- client writes settings after the Lua's first frame), so the map
            -- would otherwise stay empty and no randomization would happen.
            -- Keep looking for the seed's shared map until it arrives, and
            -- adopt it even if we already fell back to a local shuffle. The
            -- local shuffle itself is only ever built ONCE, so music never
            -- re-rolls mid-session on old seeds.
            if not buzz_spawn.nmap_shared then
                if read_shared_music_map() then
                    buzz_spawn.nmap_shared=true; buzz_spawn.nmap=true
                elseif not buzz_spawn.nmap then
                    build_normal_map(); buzz_spawn.nmap=true
                end
            end
            mapped=normal_map[music_natural] or music_natural
        elseif mm==2 then mapped=CHAOS_POOL[math.random(#CHAOS_POOL)]
        elseif mm==3 then mapped=oops_track()
        else mapped=music_natural end
        if mapped then mainmemory.write_u8(A.MUSIC,mapped); music_current=mapped end
    else
        if music_natural~=-1 then
            mainmemory.write_u8(A.MUSIC,music_natural); music_current=music_natural
        end
    end
end

-- ============================================================
-- MAIN LOOP
-- ============================================================
function update_map(input, hovered)
    -- QOL: Auto Save
    if is_auto_save() and not map_saved then
        savestate.saveslot(10); map_saved=true
    end

    -- QOL: Skip cutscenes. Re-assert the "seen" flags EVERY frame on the map
    -- (not a one-shot), so that a Game Over — which resets every cutscene flag to
    -- "never seen" — doesn't make cutscenes start replaying when the player heads
    -- back in. We SKIP this while a Cutscene Trap is queued or actively playing,
    -- because the trap deliberately zeroes these flags to force a replay; writing
    -- them back to "seen" would cancel the trap.
    if is_skip_cutscenes() then
        local trap_busy = CS.active or CS.pending
            or mainmemory.read_u8(SHARED_TRAP_CUTSCENE) > 0
        if not trap_busy then
            for _,addr in ipairs(CUTSCENE_ADDRS) do mainmemory.write_u8(addr,1) end
        end
    end

    -- Token display
    local ap_tokens=get_ap_tokens()
    if mainmemory.read_u8(A.MAP_TOKEN)~=ap_tokens then
        mainmemory.write_u8(A.MAP_TOKEN,ap_tokens)
    end
    mainmemory.write_u8(0x1FFF20,0)

    -- Re-prime the level-name rewrite window on every map entry. Setting this
    -- only from the in-level branch missed the boss path (boss level -> defeated
    -- screen (level 0) -> map): the game rewrites the original level names after
    -- boss completion, after our window had already expired, so the custom names
    -- reverted. Detect the transition into the map here and restart the window.
    if not map_was_on then
        map_entry_timer=MAP_ENTRY_FRAMES
        map_was_on=true
    end

    -- Open / Linear mode
    if get_game_mode()==0 then
        if not on_map then set_all_token_addresses(); on_map=true end
        check_prospector_unlock()
    else
        local tickets=get_tickets()
        local tokens=get_ap_tokens()
        if not on_map or tickets~=last_tickets or tokens~=last_tokens_linear then
            apply_linear_area(tickets)
            last_tickets=tickets; last_tokens_linear=tokens; on_map=true
        end
    end

    -- Level locking / names
    if hovered>=7 then
        if map_entry_timer>0 then
            write_all_level_names(); map_entry_timer=map_entry_timer-1
        end
        local cur_low=mainmemory.read_u8(SHARED_UNLOCKS_LOW)
        local cur_high=mainmemory.read_u8(SHARED_UNLOCKS_HIGH)
        if cur_low~=last_unlocks_low or cur_high~=last_unlocks_high then
            last_unlocks_low=cur_low; last_unlocks_high=cur_high
            write_all_level_names()
        end
        local unlocked=is_level_unlocked(hovered)

        -- Keep the boss-gate "have/need tokens" labels current as the token count
        -- changes (receiving a token should tick the number on the gate).
        local tok_now=get_ap_tokens()
        if tok_now~=last_gate_tokens then last_gate_tokens=tok_now; write_all_level_names() end

        -- Open-mode goal label: refresh the final-showdown name when the client's
        -- published goal breakdown changes (e.g. a boss defeat that doesn't move the
        -- token count), so the shorthand on hover 21 stays current.
        if get_game_mode()==0 then
            local gf_now=mainmemory.read_u8(GOAL_FLAGS_ADDR)
            if gf_now~=last_goal_flags then last_goal_flags=gf_now; write_all_level_names() end
        end

        -- Block X if: (a) the hovered level is locked, OR (b) we just arrived on
        -- the map / just changed which level is hovered and haven't settled yet.
        -- This stops players from spamming X through the lock during the brief
        -- window before the lock state is evaluated. We require X to be released
        -- and re-pressed (edge detection) and the hover to be stable for a few
        -- frames before a press is honoured.
        if hovered ~= last_hovered then
            last_hovered = hovered
            map_select_settle = MAP_SELECT_SETTLE
            if lock_flash then
                -- A flash message was mid-play (player had pressed X). Moving to a
                -- different level must KILL it and zero the on-screen animation
                -- instantly -- not leave the last 'show' frame lingering until the
                -- next gate's flash overwrites it.
                lock_flash = nil
                mainmemory.write_u8(A.LOCKED_MSG, 0)
                write_all_level_names()   -- repaint labels so no popup tail remains
            end
        elseif map_select_settle > 0 then
            map_select_settle = map_select_settle - 1
        end

        local x_now = is_x_pressed(input)
        local fresh_press = x_now and not x_was_down
        x_was_down = x_now

        local must_block = (not unlocked) or (map_select_settle > 0) or (not fresh_press and x_now)

        if x_now and must_block then
            block_x(input)
            if (not unlocked) and not lock_flash then
                start_lock_flash(hovered, get_lock_msg_type(hovered))
                -- Repaint now that a flash is active: write_level_name suppresses the
                -- (possibly buffer-spilling) goal shorthand while lock_flash is set, so
                -- hover 21 reverts to the short "locked" name and the popup owns the
                -- shared message buffer. The flash-end repaint below restores it.
                write_all_level_names()
            end
        end
        -- Drive the flash: writes 193 (show) / 0 (blank) to LOCKED_MSG every frame.
        -- One-shot 100-frame show for unlock/tokens; a single 75/10 cycle through
        -- every unmet condition for the goal gate.
        local was_flashing = lock_flash ~= nil
        if lock_flash then tick_lock_flash() end
        -- The goal label can extend into the message buffer; once a flash finishes,
        -- repaint the labels so the popup text never leaves a stale tail on the gate.
        if was_flashing and not lock_flash then write_all_level_names() end
        if unlocked then lock_flash=nil; mainmemory.write_u8(A.LOCKED_MSG,0) end
    end

    -- Music skip on map
    update_music()
end

function ts2_main()
    -- No ROM loaded yet (script started before a game booted): do nothing. The
    -- bundled connector below waits for a ROM; touching mainmemory here would error.
    if emu.getsystemid() == "NULL" then return end
    if not script_initialized then
        on_init()
        script_initialized = true
    end
    -- Keep the shared-memory validation sentinel alive EVERY frame. The client's
    -- validate_rom() refuses to write settings until it reads 0x1FFFD0 == 0xAB.
    -- on_init wrote it once, but this byte is in the top-of-RAM region the game can
    -- corrupt; if it got clobbered before the client validated, the handshake stuck
    -- forever on "Waiting for Python client to write settings". Re-asserting it here
    -- makes validation reliable regardless of when the player connects.
    mainmemory.write_u8(0x1FFFD0, 0xAB)
    -- One-time positive confirmation that the client wrote settings (game-mode
    -- mirror is magic-tagged 0xA0/0xA1). Lets a player tell "settings never arrived"
    -- (client/slot_data problem) apart from "settings arrived fine".
    if not SETTINGS_SEEN then
        local _gm = mainmemory.read_u8(0x1FF97D)
        if _gm == 0xA0 or _gm == 0xA1 then
            SETTINGS_SEEN = true
            print("[TS2] Settings received from client — tracking active.  (connector v"..TS2_VERSION..")")
        end
    end
    local level   = mainmemory.read_u8(A.LEVEL)
    local input   = mainmemory.read_u8(A.INPUT)
    local buzz_x  = mainmemory.read_u8(A.BUZZ_X)
    local buzz_y  = mainmemory.read_u8(A.BUZZ_Y)
    local hovered = mainmemory.read_u8(A.HOVER)

    -- ── LEVEL CHANGE ─────────────────────────────────────
    if level~=last_level then
        on_level_change(level, last_level)
        last_level=level
    end

    -- Cutscene trap state machine: run EVERY frame regardless of level. It must
    -- keep ticking on the map (16) and boss-defeat screens (35/38/41/44) to track
    -- the 64->0 cutscene-state cycles, the post-cutscene timer, and Zurg's
    -- two-phase sequence. (Only fires when a cutscene trap is queued/active.)
    update_cutscene(level)

    -- Re-arm the map autosave whenever we are NOT on the map. This guarantees
    -- the save fires on every map entry, not just the first: relying on
    -- on_level_change to reset the flag missed cases where the transition into
    -- the map didn't cleanly register new_level==16 (the path is level -> 0 ->
    -- 16, and intermediate bounces could leave map_saved stuck true).
    if level~=MAP_LEVEL_ID then map_saved=false; map_was_on=false end

    update_item_feed()

    -- Rex: write the rex bytes authoritatively EVERY frame, regardless of which
    -- level value we are in. The game corrupts 0x1FF9C4/C5 during the load hitch
    -- on the way back to the map (level bounces through transition values), and
    -- the client reads those bytes every frame — so the rewrite must NOT be gated
    -- to the in-level branch or phantom rex checks fire during the transition.
    if is_rexsanity() then
        -- If the client reconnected (possibly to a different seed), wipe rex state
        -- so old-seed talks aren't re-asserted. The new seed's confirmed bits come
        -- back in via the seed addresses below; genuine new talks re-arm normally.
        local gen = mainmemory.read_u8(SHARED_CONN_GEN)
        local just_reconnected = false
        if conn_gen_seen == nil then
            conn_gen_seen = gen
        elseif gen ~= conn_gen_seen then
            conn_gen_seen = gen
            rex_lua_mask.lo = 0; rex_lua_mask.hi = 0
            for k,_ in pairs(rex_state) do rex_state[k]=0 end
            mainmemory.write_u8(SHARED_REX_LOW, 0)
            mainmemory.write_u8(SHARED_REX_HIGH, 0)
            just_reconnected = true
        end
        -- Skip the seed-OR on the reconnect frame: the seed bytes may still hold the
        -- old seed's value until the client's per-tick restore overwrites them next
        -- frame. Re-ORing them now would immediately re-poison the cleared mask.
        if not just_reconnected then
            rex_lua_mask.lo = rex_lua_mask.lo | mainmemory.read_u8(0x1FF97B)
            rex_lua_mask.hi = rex_lua_mask.hi | mainmemory.read_u8(0x1FF97C)
            mainmemory.write_u8(SHARED_REX_LOW, rex_lua_mask.lo)
            mainmemory.write_u8(SHARED_REX_HIGH, rex_lua_mask.hi)
        end
    end

    -- ── LEVEL READY GATE ─────────────────────────────────
    -- A.LEVEL_READY (0x0A1044) is a LOAD-PROGRESS counter (0..255, wraps). On a
    -- map->level entry it climbs exactly +6 from its value at the transition, then
    -- FREEZES at that value while the game waits for the player to press X; it does
    -- not move again until the next load. It is NOT a ready-state, so the old
    -- ">= 21" comparison was meaningless and broke whenever the counter happened to
    -- sit low after a wrap (the "checks won't send until reload" bug).
    --
    -- Arm collectible detection when the player is genuinely in control (so memory
    -- is real and we don't fire phantom checks):
    --   PRIMARY  : on a map->level entry, once the counter has reached snap+6 (load
    --              finished) AND Buzz has actually moved (player pressed X to start).
    --   FALLBACK : Buzz moves for a sustained window — covers entries that did NOT
    --              come from the map (death respawns, level->level), where there is
    --              no snapshot. NOT gated on the counter.
    --   TIMEOUT  : a wall-clock safety — if we have been in a valid level long
    --              enough, arm regardless, so detection can never get permanently
    --              stuck again.
    if not buzz_moved then
        local lr = mainmemory.read_u8(A.LEVEL_READY)
        local snap = buzz_spawn.lr_snapshot
        local load_done = true
        if snap ~= nil then
            -- Wrap-aware: loading finished once the counter climbed >= 6 from snap.
            load_done = ((lr - snap) % 256) >= 6
        end

        -- Track Buzz movement (used by both PRIMARY and FALLBACK).
        local bx = mainmemory.read_u8(A.BUZZ_X)
        local by = mainmemory.read_u8(A.BUZZ_Y)
        local moved_this_frame = false
        if buzz_spawn.move_x == nil then
            buzz_spawn.move_x, buzz_spawn.move_y = bx, by
        elseif bx ~= buzz_spawn.move_x or by ~= buzz_spawn.move_y then
            moved_this_frame = true
            buzz_spawn.move_frames = buzz_spawn.move_frames + 1
            buzz_spawn.move_x, buzz_spawn.move_y = bx, by
        end

        -- PRIMARY: map->level load finished and the player has started moving.
        if load_done and moved_this_frame then
            buzz_moved = true
        end

        -- FALLBACK (non-map entries): sustained movement, independent of the counter.
        if buzz_spawn.move_frames >= 30 then  -- ~0.5s of real movement
            buzz_moved = true
        end

        -- TIMEOUT safety: count frames since entry (wall clock, not the counter).
        buzz_spawn.lr_frames = buzz_spawn.lr_frames + 1
        if buzz_spawn.lr_frames >= 600 then  -- ~10s
            buzz_moved = true
        end
    end

    -- ══════════════════════════════════════════════════════
    -- MAP SCREEN
    -- ══════════════════════════════════════════════════════
    if level==MAP_LEVEL_ID then
        update_map(input, hovered)
        return

    -- ══════════════════════════════════════════════════════
    -- IN A LEVEL (1-15)
    -- ══════════════════════════════════════════════════════
    elseif level>=1 and level<=15 then

        -- Authoritatively re-assert the sanity shared masks EVERY frame from our
        -- own (clean) masks. The game corrupts these shared addresses during the
        -- load window, and the client reads them every frame — so without a
        -- constant rewrite a phantom life/battery/laser check fires on load,
        -- before the detection gate (buzz_moved) has even armed.
        if SHARED_BATTERY[level] and is_batterysanity() then
            mainmemory.write_u8(SHARED_BATTERY[level], battery_masks[level] or 0)
        end
        if SHARED_LIFE[level] and is_lifesanity() then
            mainmemory.write_u8(SHARED_LIFE[level], life_masks[level] or 0)
        end
        if SHARED_LASER_SANITY[level] and is_lasersanity() then
            mainmemory.write_u8(SHARED_LASER_SANITY[level], laser_masks[level] or 0)
        end
        if SHARED_TOY_COLLECTED[level] and TOYS[level] then
            mainmemory.write_u8(SHARED_TOY_COLLECTED[level], toy_collected_masks[level] or 0)
        end

        -- Handle map entry init
        if not on_map then
            map_entry_timer=MAP_ENTRY_FRAMES
            msg_playing=false; we_triggered_msg=false
            last_unlocks_low=-1; last_unlocks_high=-1
        end

        -- QOL: Disable fall animation
        if is_no_fall_anim() then mainmemory.write_u8(A.FALL_ANIM,0) end

        -- QOL: Disc Launcher pickups fill pockets. Only on the gadget/disc levels
        -- (Construction Yard=4, Alleys=5, Al's Toy Barn=7). When the disc count
        -- goes UP (a pickup), write it to 30 once and let the game cap it to the
        -- player's real maximum; we only act on an increase so we don't refill
        -- after the player spends discs.
        if is_disc_fill() and (level==4 or level==5 or level==7) then
            local disc=mainmemory.read_u8(A.DISC)
            if buzz_spawn.disc and disc>buzz_spawn.disc then
                mainmemory.write_u8(A.DISC,30)
            end
            buzz_spawn.disc=disc
        end

        -- Token collection detection. During the load-settle window keep the
        -- token byte forced to 0 (the game may write its own value as the level
        -- loads), then only start detecting genuine collections once settled.
        local hover_id=LEVEL_TO_HOVER[level]
        if hover_id and not BOSS_HOVER_IDS[hover_id] then
            if sanity_load_timer < SANITY_LOAD_WAIT then
                local ta=TOKEN_ADDR[hover_id]
                if ta then mainmemory.write_u8(ta,0) end
            elseif not CS_PLAYING then
                check_token_collection(level,hover_id)
            end
        end

        -- ── SUBSYSTEMS ────────────────────────────────────
        -- ── SUBSYSTEMS ────────────────────────────────────
        update_moves()
        update_traps(level)
        update_boss(level)
        -- Collectible DETECTION subsystems are skipped while a cutscene is actively
        -- playing: the forced cutscene corrupts collectible/token RAM, which would
        -- otherwise fire phantom checks. (Moves/traps/boss still run so the cutscene
        -- and traps behave correctly.)
        if not CS_PLAYING then
            update_potato(level)
            update_sanity(level)
            update_auto_coins(level)
            update_coins(level)
            update_rex(level)
            update_hints(level)
        end
        update_music()

    end -- end level 1-15
end

-- ============================================================
-- START
-- ============================================================
print("[TS2] Archipelago combined script loaded!  (connector v"..TS2_VERSION..")")
print("[TS2] Waiting for Python client to write settings...")
event.onframestart(ts2_main,"ts2")

end
-- === Part 2: Archipelago generic BizHawk connector (bundled, unmodified) ====
-- Source: Archipelago/data/lua/connector_bizhawk_generic.lua  (c) 2023 Zunawe, MIT
do
--[[
Copyright (c) 2023 Zunawe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

local SCRIPT_VERSION = 1

-- Set to log incoming requests
-- Will cause lag due to large console output
local DEBUG = false

--[[
This script expects to receive JSON and will send JSON back. A message should
be a list of 1 or more requests which will be executed in order. Each request
will have a corresponding response in the same order.

Every individual request and response is a JSON object with at minimum one
field `type`. The value of `type` determines what other fields may exist.

To get the script version, instead of JSON, send "VERSION" to get the script
version directly (e.g. "2").

#### Ex. 1

Request: `[{"type": "PING"}]`

Response: `[{"type": "PONG"}]`

---

#### Ex. 2

Request: `[{"type": "LOCK"}, {"type": "HASH"}]`

Response: `[{"type": "LOCKED"}, {"type": "HASH_RESPONSE", "value": "F7D18982"}]`

---

#### Ex. 3

Request:

```json
[
    {"type": "GUARD", "address": 100, "expected_data": "aGVsbG8=", "domain": "System Bus"},
    {"type": "READ", "address": 500, "size": 4, "domain": "ROM"}
]
```

Response:

```json
[
    {"type": "GUARD_RESPONSE", "address": 100, "value": true},
    {"type": "READ_RESPONSE", "value": "dGVzdA=="}
]
```

---

#### Ex. 4

Request:

```json
[
    {"type": "GUARD", "address": 100, "expected_data": "aGVsbG8=", "domain": "System Bus"},
    {"type": "READ", "address": 500, "size": 4, "domain": "ROM"}
]
```

Response:

```json
[
    {"type": "GUARD_RESPONSE", "address": 100, "value": false},
    {"type": "GUARD_RESPONSE", "address": 100, "value": false}
]
```

---

### Supported Request Types

- `PING`  
    Does nothing; resets timeout.

    Expected Response Type: `PONG`

- `SYSTEM`  
    Returns the system of the currently loaded ROM (N64, GBA, etc...).

    Expected Response Type: `SYSTEM_RESPONSE`

- `PREFERRED_CORES`  
    Returns the user's default cores for systems with multiple cores. If the
    current ROM's system has multiple cores, the one that is currently
    running is very probably the preferred core.

    Expected Response Type: `PREFERRED_CORES_RESPONSE`

- `HASH`  
    Returns the hash of the currently loaded ROM calculated by BizHawk.

    Expected Response Type: `HASH_RESPONSE`

- `MEMORY_SIZE`  
    Returns the size in bytes of the specified memory domain.

    Expected Response Type: `MEMORY_SIZE_RESPONSE`

    Additional Fields:
    - `domain` (`string`): The name of the memory domain to check

- `GUARD`  
    Checks a section of memory against `expected_data`. If the bytes starting
    at `address` do not match `expected_data`, the response will have `value`
    set to `false`, and all subsequent requests will not be executed and
    receive the same `GUARD_RESPONSE`.

    Expected Response Type: `GUARD_RESPONSE`

    Additional Fields:
    - `address` (`int`): The address of the memory to check
    - `expected_data` (string): A base64 string of contiguous data
    - `domain` (`string`): The name of the memory domain the address
    corresponds to

- `LOCK`  
    Halts emulation and blocks on incoming requests until an `UNLOCK` request
    is received or the client times out. All requests processed while locked
    will happen on the same frame.

    Expected Response Type: `LOCKED`

- `UNLOCK`  
    Resumes emulation after the current list of requests is done being
    executed.

    Expected Response Type: `UNLOCKED`

- `READ`  
    Reads an array of bytes at the provided address.

    Expected Response Type: `READ_RESPONSE`

    Additional Fields:
    - `address` (`int`): The address of the memory to read
    - `size` (`int`): The number of bytes to read
    - `domain` (`string`): The name of the memory domain the address
    corresponds to

- `WRITE`  
    Writes an array of bytes to the provided address.

    Expected Response Type: `WRITE_RESPONSE`

    Additional Fields:
    - `address` (`int`): The address of the memory to write to
    - `value` (`string`): A base64 string representing the data to write
    - `domain` (`string`): The name of the memory domain the address
    corresponds to

- `DISPLAY_MESSAGE`  
    Adds a message to the message queue which will be displayed using
    `gui.addmessage` according to the message interval.

    Expected Response Type: `DISPLAY_MESSAGE_RESPONSE`

    Additional Fields:
    - `message` (`string`): The string to display

- `SET_MESSAGE_INTERVAL`  
    Sets the minimum amount of time to wait between displaying messages.
    Potentially useful if you add many messages quickly but want players
    to be able to read each of them.

    Expected Response Type: `SET_MESSAGE_INTERVAL_RESPONSE`

    Additional Fields:
    - `value` (`number`): The number of seconds to set the interval to


### Response Types

- `PONG`  
    Acknowledges `PING`.

- `SYSTEM_RESPONSE`  
    Contains the name of the system for currently running ROM.

    Additional Fields:
    - `value` (`string`): The returned system name

- `PREFERRED_CORES_RESPONSE`  
    Contains the user's preferred cores for systems with multiple supported
    cores. Currently includes NES, SNES, GB, GBC, DGB, SGB, PCE, PCECD, and
    SGX.

    Additional Fields:
    - `value` (`{[string]: [string]}`): A dictionary map from system name to
    core name

- `HASH_RESPONSE`  
    Contains the hash of the currently loaded ROM calculated by BizHawk.

    Additional Fields:
    - `value` (`string`): The returned hash

- `MEMORY_SIZE_RESPONSE`  
    Contains the size in bytes of the specified memory domain.

    Additional Fields:
    - `value` (`number`): The size of the domain in bytes

- `GUARD_RESPONSE`  
    The result of an attempted `GUARD` request.

    Additional Fields:
    - `value` (`boolean`): true if the memory was validated, false if not
    - `address` (`int`): The address of the memory that was invalid (the same
    address provided by the `GUARD`, not the address of the individual invalid
    byte)

- `LOCKED`  
    Acknowledges `LOCK`.

- `UNLOCKED`  
    Acknowledges `UNLOCK`.

- `READ_RESPONSE`  
    Contains the result of a `READ` request.

    Additional Fields:
    - `value` (`string`): A base64 string representing the read data

- `WRITE_RESPONSE`  
    Acknowledges `WRITE`.

- `DISPLAY_MESSAGE_RESPONSE`  
    Acknowledges `DISPLAY_MESSAGE`.

- `SET_MESSAGE_INTERVAL_RESPONSE`  
    Acknowledges `SET_MESSAGE_INTERVAL`.

- `ERROR`  
    Signifies that something has gone wrong while processing a request.

    Additional Fields:
    - `err` (`string`): A description of the problem
]]

local bizhawk_version = client.getversion()
local bizhawk_major, bizhawk_minor, bizhawk_patch = bizhawk_version:match("(%d+)%.(%d+)%.?(%d*)")
bizhawk_major = tonumber(bizhawk_major)
bizhawk_minor = tonumber(bizhawk_minor)
if bizhawk_patch == "" then
    bizhawk_patch = 0
else
    bizhawk_patch = tonumber(bizhawk_patch)
end

local lua_major, lua_minor = _VERSION:match("Lua (%d+)%.(%d+)")
lua_major = tonumber(lua_major)
lua_minor = tonumber(lua_minor)

-- ============================================================
-- INLINED ARCHIPELAGO CONNECTOR HELPER MODULES
-- These normally live in Archipelago/data/lua/. They are inlined here via
-- package.preload so this all-in-one script can be loaded from ANY folder
-- (BizHawk's require() only searches the script's own directory). 'socket' is
-- provided by BizHawk itself and is still required normally below.
-- ============================================================
package.preload["lua_5_3_compat"] = function(...)
function bit.rshift(a, b)
  return a >> b
end
function bit.lshift(a, b)
  return a << b
end
function bit.bor(a, b)
  return a | b
end
function bit.band(a, b)
  return a & b
end
end
package.preload["base64"] = function(...)
-- This file originates from this repository: https://github.com/iskolbin/lbase64
-- It was modified to translate between base64 strings and lists of bytes instead of base64 strings and strings.

local base64 = {}

local extract = _G.bit32 and _G.bit32.extract -- Lua 5.2/Lua 5.3 in compatibility mode
if not extract then
    if _G._VERSION == "Lua 5.4" then
        extract = load[[return function( v, from, width )
            return ( v >> from ) & ((1 << width) - 1)
        end]]()
    elseif _G.bit then -- LuaJIT
        local shl, shr, band = _G.bit.lshift, _G.bit.rshift, _G.bit.band
        extract = function( v, from, width )
            return band( shr( v, from ), shl( 1, width ) - 1 )
        end
    elseif _G._VERSION == "Lua 5.1" then
        extract = function( v, from, width )
            local w = 0
            local flag = 2^from
            for i = 0, width-1 do
                local flag2 = flag + flag
                if v % flag2 >= flag then
                    w = w + 2^i
                end
                flag = flag2
            end
            return w
        end
    end
end


function base64.makeencoder( s62, s63, spad )
    local encoder = {}
    for b64code, char in pairs{[0]='A','B','C','D','E','F','G','H','I','J',
        'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y',
        'Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n',
        'o','p','q','r','s','t','u','v','w','x','y','z','0','1','2',
        '3','4','5','6','7','8','9',s62 or '+',s63 or'/',spad or'='} do
        encoder[b64code] = char:byte()
    end
    return encoder
end

function base64.makedecoder( s62, s63, spad )
    local decoder = {}
    for b64code, charcode in pairs( base64.makeencoder( s62, s63, spad )) do
        decoder[charcode] = b64code
    end
    return decoder
end

local DEFAULT_ENCODER = base64.makeencoder()
local DEFAULT_DECODER = base64.makedecoder()

local char, concat = string.char, table.concat

function base64.encode( arr, encoder )
    encoder = encoder or DEFAULT_ENCODER
    local t, k, n = {}, 1, #arr
    local lastn = n % 3
    for i = 1, n-lastn, 3 do
        local a, b, c = arr[i], arr[i + 1], arr[i + 2]
        local v = a*0x10000 + b*0x100 + c
        local s
        s = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])
        t[k] = s
        k = k + 1
    end
    if lastn == 2 then
        local a, b = arr[n-1], arr[n]
        local v = a*0x10000 + b*0x100
        t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[64])
    elseif lastn == 1 then
        local v = arr[n]*0x10000
        t[k] = char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[64], encoder[64])
    end
    return concat( t )
end

function base64.decode( b64, decoder )
    decoder = decoder or DEFAULT_DECODER
    local pattern = '[^%w%+%/%=]'
    if decoder then
        local s62, s63
        for charcode, b64code in pairs( decoder ) do
            if b64code == 62 then s62 = charcode
            elseif b64code == 63 then s63 = charcode
            end
        end
        pattern = ('[^%%w%%%s%%%s%%=]'):format( char(s62), char(s63) )
    end
    b64 = b64:gsub( pattern, '' )
    local t, k = {}, 1
    local n = #b64
    local padding = b64:sub(-2) == '==' and 2 or b64:sub(-1) == '=' and 1 or 0
    for i = 1, padding > 0 and n-4 or n, 4 do
        local a, b, c, d = b64:byte( i, i+3 )
        local s
        local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
        table.insert(t,extract(v,16,8))
        table.insert(t,extract(v,8,8))
        table.insert(t,extract(v,0,8))
    end
    if padding == 1 then
        local a, b, c = b64:byte( n-3, n-1 )
        local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40
        table.insert(t,extract(v,16,8))
        table.insert(t,extract(v,8,8))
    elseif padding == 2 then
        local a, b = b64:byte( n-3, n-2 )
        local v = decoder[a]*0x40000 + decoder[b]*0x1000
        table.insert(t,extract(v,16,8))
    end
    return t
end

return base64
end
package.preload["json"] = function(...)
--
-- json.lua
--
-- Copyright (c) 2015 rxi
--
-- This library is free software; you can redistribute it and/or modify it
-- under the terms of the MIT license. See LICENSE for details.
--

local json = { _version = "0.1.0" }

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
  [ "\\" ] = "\\\\",
  [ "\"" ] = "\\\"",
  [ "\b" ] = "\\b",
  [ "\f" ] = "\\f",
  [ "\n" ] = "\\n",
  [ "\r" ] = "\\r",
  [ "\t" ] = "\\t",
}

local escape_char_map_inv = { [ "\\/" ] = "/" }
for k, v in pairs(escape_char_map) do
  escape_char_map_inv[v] = k
end


local function escape_char(c)
  return escape_char_map[c] or string.format("\\u%04x", c:byte())
end


local function encode_nil(val)
  return "null"
end 


local function encode_table(val, stack)
  local res = {}
  stack = stack or {}

  -- Circular reference?
  if stack[val] then error("circular reference") end

  stack[val] = true

  if val[1] ~= nil or next(val) == nil then
    -- Treat as array -- check keys are valid and it is not sparse
    local n = 0
    for k in pairs(val) do
      if type(k) ~= "number" then
        error("invalid table: mixed or invalid key types")
      end
      n = n + 1
    end
    if n ~= #val then
      error("invalid table: sparse array")
    end
    -- Encode
    for i, v in ipairs(val) do
      table.insert(res, encode(v, stack))
    end
    stack[val] = nil
    return "[" .. table.concat(res, ",") .. "]"

  else
    -- Treat as an object
    for k, v in pairs(val) do
      if type(k) ~= "string" then
        error("invalid table: mixed or invalid key types")
      end
      table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
    end
    stack[val] = nil
    return "{" .. table.concat(res, ",") .. "}"
  end
end


local function encode_string(val)
  return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
end


local function encode_number(val)
  -- Check for NaN, -inf and inf
  if val ~= val or val <= -math.huge or val >= math.huge then
    error("unexpected number value '" .. tostring(val) .. "'")
  end
  return string.format("%.14g", val)
end


local type_func_map = {
  [ "nil"     ] = encode_nil,
  [ "table"   ] = encode_table,
  [ "string"  ] = encode_string,
  [ "number"  ] = encode_number,
  [ "boolean" ] = tostring,
}


encode = function(val, stack)
  local t = type(val)
  local f = type_func_map[t]
  if f then
    return f(val, stack)
  end
  error("unexpected type '" .. t .. "'")
end


function json.encode(val)
  return ( encode(val) )
end


-------------------------------------------------------------------------------
-- Decode
-------------------------------------------------------------------------------

local parse

local function create_set(...) 
  local res = {}
  for i = 1, select("#", ...) do
    res[ select(i, ...) ] = true
  end
  return res
end

local space_chars   = create_set(" ", "\t", "\r", "\n")
local delim_chars   = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
local escape_chars  = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
local literals      = create_set("true", "false", "null")

local literal_map = {
  [ "true"  ] = true,
  [ "false" ] = false,
  [ "null"  ] = nil,
}


local function next_char(str, idx, set, negate)
  for i = idx, #str do
    if set[str:sub(i, i)] ~= negate then
      return i
    end
  end
  return #str + 1
end


local function decode_error(str, idx, msg)
  --local line_count = 1
  --local col_count = 1
  --for i = 1, idx - 1 do
  --  col_count = col_count + 1
  --  if str:sub(i, i) == "\n" then
  --   line_count = line_count + 1
  --    col_count = 1
  --  end
  -- end
  -- emu.message( string.format("%s at line %d col %d", msg, line_count, col_count) )
end


local function codepoint_to_utf8(n)
  -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa
  local f = math.floor
  if n <= 0x7f then
    return string.char(n)
  elseif n <= 0x7ff then
    return string.char(f(n / 64) + 192, n % 64 + 128)
  elseif n <= 0xffff then
    return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
  elseif n <= 0x10ffff then
    return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,
                       f(n % 4096 / 64) + 128, n % 64 + 128)
  end
  error( string.format("invalid unicode codepoint '%x'", n) )
end


local function parse_unicode_escape(s)
  local n1 = tonumber( s:sub(3, 6),  16 )
  local n2 = tonumber( s:sub(9, 12), 16 )
  -- Surrogate pair?
  if n2 then
    return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
  else
    return codepoint_to_utf8(n1)
  end
end


local function parse_string(str, i)
  local has_unicode_escape = false
  local has_surrogate_escape = false
  local has_escape = false
  local last
  for j = i + 1, #str do
    local x = str:byte(j)

    if x < 32 then
      decode_error(str, j, "control character in string")
    end

    if last == 92 then -- "\\" (escape char)
      if x == 117 then -- "u" (unicode escape sequence)
        local hex = str:sub(j + 1, j + 5)
        if not hex:find("%x%x%x%x") then
          decode_error(str, j, "invalid unicode escape in string")
        end
        if hex:find("^[dD][89aAbB]") then
          has_surrogate_escape = true
        else
          has_unicode_escape = true
        end
      else
        local c = string.char(x)
        if not escape_chars[c] then
          decode_error(str, j, "invalid escape char '" .. c .. "' in string")
        end
        has_escape = true
      end
      last = nil

    elseif x == 34 then -- '"' (end of string)
      local s = str:sub(i + 1, j - 1)
      if has_surrogate_escape then 
        s = s:gsub("\\u[dD][89aAbB]..\\u....", parse_unicode_escape)
      end
      if has_unicode_escape then 
        s = s:gsub("\\u....", parse_unicode_escape)
      end
      if has_escape then
        s = s:gsub("\\.", escape_char_map_inv)
      end
      return s, j + 1
    
    else
      last = x
    end
  end
  decode_error(str, i, "expected closing quote for string")
end


local function parse_number(str, i)
  local x = next_char(str, i, delim_chars)
  local s = str:sub(i, x - 1)
  local n = tonumber(s)
  if not n then
    decode_error(str, i, "invalid number '" .. s .. "'")
  end
  return n, x
end


local function parse_literal(str, i)
  local x = next_char(str, i, delim_chars)
  local word = str:sub(i, x - 1)
  if not literals[word] then
    decode_error(str, i, "invalid literal '" .. word .. "'")
  end
  return literal_map[word], x
end


local function parse_array(str, i)
  local res = {}
  local n = 1
  i = i + 1
  while 1 do
    local x
    i = next_char(str, i, space_chars, true)
    -- Empty / end of array?
    if str:sub(i, i) == "]" then 
      i = i + 1
      break
    end
    -- Read token
    x, i = parse(str, i)
    res[n] = x
    n = n + 1
    -- Next token 
    i = next_char(str, i, space_chars, true)
    local chr = str:sub(i, i)
    i = i + 1
    if chr == "]" then break end
    if chr ~= "," then decode_error(str, i, "expected ']' or ','") end
  end
  return res, i
end


local function parse_object(str, i)
  local res = {}
  i = i + 1
  while 1 do
    local key, val
    i = next_char(str, i, space_chars, true)
    -- Empty / end of object?
    if str:sub(i, i) == "}" then 
      i = i + 1
      break
    end
    -- Read key
    if str:sub(i, i) ~= '"' then
      decode_error(str, i, "expected string for key")
    end
    key, i = parse(str, i)
    -- Read ':' delimiter
    i = next_char(str, i, space_chars, true)
    if str:sub(i, i) ~= ":" then
      decode_error(str, i, "expected ':' after key")
    end
    i = next_char(str, i + 1, space_chars, true)
    -- Read value
    val, i = parse(str, i)
    -- Set
    res[key] = val
    -- Next token
    i = next_char(str, i, space_chars, true)
    local chr = str:sub(i, i)
    i = i + 1
    if chr == "}" then break end
    if chr ~= "," then decode_error(str, i, "expected '}' or ','") end
  end
  return res, i
end


local char_func_map = {
  [ '"' ] = parse_string,
  [ "0" ] = parse_number,
  [ "1" ] = parse_number,
  [ "2" ] = parse_number,
  [ "3" ] = parse_number,
  [ "4" ] = parse_number,
  [ "5" ] = parse_number,
  [ "6" ] = parse_number,
  [ "7" ] = parse_number,
  [ "8" ] = parse_number,
  [ "9" ] = parse_number,
  [ "-" ] = parse_number,
  [ "t" ] = parse_literal,
  [ "f" ] = parse_literal,
  [ "n" ] = parse_literal,
  [ "[" ] = parse_array,
  [ "{" ] = parse_object,
}


parse = function(str, idx)
  local chr = str:sub(idx, idx)
  local f = char_func_map[chr]
  if f then
    return f(str, idx)
  end
  decode_error(str, idx, "unexpected character '" .. chr .. "'")
end


function json.decode(str)
  if type(str) ~= "string" then
    error("expected argument of type string, got " .. type(str))
  end
  return ( parse(str, next_char(str, 1, space_chars, true)) )
end


return json
end
-- ============================================================

if lua_major > 5 or (lua_major == 5 and lua_minor >= 3) then
    require("lua_5_3_compat")
end

local base64 = require("base64")
local socket = require("socket")
local json = require("json")

local SOCKET_PORT_FIRST = 43055
local SOCKET_PORT_RANGE_SIZE = 5
local SOCKET_PORT_LAST = SOCKET_PORT_FIRST + SOCKET_PORT_RANGE_SIZE

local STATE_NOT_CONNECTED = 0
local STATE_CONNECTED = 1

local server = nil
local client_socket = nil

local current_state = STATE_NOT_CONNECTED

local timeout_timer = 0
local message_timer = 0
local message_interval = 0
local prev_time = 0
local current_time = 0

local locked = false

local rom_hash = nil

function queue_push (self, value)
    self[self.right] = value
    self.right = self.right + 1
end

function queue_is_empty (self)
    return self.right == self.left
end

function queue_shift (self)
    value = self[self.left]
    self[self.left] = nil
    self.left = self.left + 1
    return value
end

function new_queue ()
    local queue = {left = 1, right = 1}
    return setmetatable(queue, {__index = {is_empty = queue_is_empty, push = queue_push, shift = queue_shift}})
end

local message_queue = new_queue()

function lock ()
    locked = true
    client_socket:settimeout(2)
end

function unlock ()
    locked = false
    client_socket:settimeout(0)
end

request_handlers = {
    ["PING"] = function (req)
        local res = {}

        res["type"] = "PONG"

        return res
    end,

    ["SYSTEM"] = function (req)
        local res = {}

        res["type"] = "SYSTEM_RESPONSE"
        res["value"] = emu.getsystemid()

        return res
    end,

    ["PREFERRED_CORES"] = function (req)
        local res = {}
        local preferred_cores = client.getconfig().PreferredCores
        local systems_enumerator = preferred_cores.Keys:GetEnumerator()

        res["type"] = "PREFERRED_CORES_RESPONSE"
        res["value"] = {}

        while systems_enumerator:MoveNext() do
            res["value"][systems_enumerator.Current] = preferred_cores[systems_enumerator.Current]
        end

        return res
    end,

    ["HASH"] = function (req)
        local res = {}

        res["type"] = "HASH_RESPONSE"
        res["value"] = rom_hash

        return res
    end,

    ["MEMORY_SIZE"] = function (req)
        local res = {}

        res["type"] = "MEMORY_SIZE_RESPONSE"
        res["value"] = memory.getmemorydomainsize(req["domain"])

        return res
    end,

    ["GUARD"] = function (req)
        local res = {}
        local expected_data = base64.decode(req["expected_data"])
        local actual_data = memory.read_bytes_as_array(req["address"], #expected_data, req["domain"])

        local data_is_validated = true
        for i, byte in ipairs(actual_data) do
            if byte ~= expected_data[i] then
                data_is_validated = false
                break
            end
        end

        res["type"] = "GUARD_RESPONSE"
        res["value"] = data_is_validated
        res["address"] = req["address"]

        return res
    end,

    ["LOCK"] = function (req)
        local res = {}

        res["type"] = "LOCKED"
        lock()

        return res
    end,

    ["UNLOCK"] = function (req)
        local res = {}

        res["type"] = "UNLOCKED"
        unlock()

        return res
    end,

    ["READ"] = function (req)
        local res = {}

        res["type"] = "READ_RESPONSE"
        res["value"] = base64.encode(memory.read_bytes_as_array(req["address"], req["size"], req["domain"]))

        return res
    end,

    ["WRITE"] = function (req)
        local res = {}

        res["type"] = "WRITE_RESPONSE"
        memory.write_bytes_as_array(req["address"], base64.decode(req["value"]), req["domain"])

        return res
    end,

    ["DISPLAY_MESSAGE"] = function (req)
        local res = {}

        res["type"] = "DISPLAY_MESSAGE_RESPONSE"
        message_queue:push(req["message"])

        return res
    end,

    ["SET_MESSAGE_INTERVAL"] = function (req)
        local res = {}

        res["type"] = "SET_MESSAGE_INTERVAL_RESPONSE"
        message_interval = req["value"]

        return res
    end,

    ["default"] = function (req)
        local res = {}

        res["type"] = "ERROR"
        res["err"] = "Unknown command: "..req["type"]

        return res
    end,
}

function process_request (req)
    if request_handlers[req["type"]] then
        return request_handlers[req["type"]](req)
    else
        return request_handlers["default"](req)
    end
end

-- Receive data from AP client and send message back
function send_receive ()
    local message, err = client_socket:receive()

    -- Handle errors
    if err == "closed" then
        if current_state == STATE_CONNECTED then
            print("Connection to client closed")
        end
        current_state = STATE_NOT_CONNECTED
        return
    elseif err == "timeout" then
        unlock()
        return
    elseif err ~= nil then
        print(err)
        current_state = STATE_NOT_CONNECTED
        unlock()
        return
    end

    -- Reset timeout timer
    timeout_timer = 5

    -- Process received data
    if DEBUG then
        print("Received Message ["..emu.framecount().."]: "..'"'..message..'"')
    end

    if message == "VERSION" then
        client_socket:send(tostring(SCRIPT_VERSION).."\n")
    else
        local res = {}
        local data = json.decode(message)
        local failed_guard_response = nil
        for i, req in ipairs(data) do
            if failed_guard_response ~= nil then
                res[i] = failed_guard_response
            else
                -- An error is more likely to cause an NLua exception than to return an error here
                local status, response = pcall(process_request, req)
                if status then
                    res[i] = response

                    -- If the GUARD validation failed, skip the remaining commands
                    if response["type"] == "GUARD_RESPONSE" and not response["value"] then
                        failed_guard_response = response
                    end
                else
                    if type(response) ~= "string" then response = "Unknown error" end
                    res[i] = {type = "ERROR", err = response}
                end
            end
        end

        client_socket:send(json.encode(res).."\n")
    end
end

function initialize_server ()
    local err
    local port = SOCKET_PORT_FIRST
    local res = nil

    server, err = socket.socket.tcp4()
    while res == nil and port <= SOCKET_PORT_LAST do
        res, err = server:bind("localhost", port)
        if res == nil and err ~= "address already in use" then
            print(err)
            return
        end

        if res == nil then
            port = port + 1
        end
    end

    if port > SOCKET_PORT_LAST then
        print("Too many instances of connector script already running. Exiting.")
        return
    end

    res, err = server:listen(0)

    if err ~= nil then
        print(err)
        return
    end

    server:settimeout(0)
end

function main ()
    while true do
        if server == nil then
            initialize_server()
        end

        current_time = socket.socket.gettime()
        timeout_timer = timeout_timer - (current_time - prev_time)
        message_timer = message_timer - (current_time - prev_time)
        prev_time = current_time

        if message_timer <= 0 and not message_queue:is_empty() then
            gui.addmessage(message_queue:shift())
            message_timer = message_interval
        end

        if current_state == STATE_NOT_CONNECTED then
            if emu.framecount() % 30 == 0 then
                print("Looking for client...")
                local client, timeout = server:accept()
                if timeout == nil then
                    print("Client connected")
                    current_state = STATE_CONNECTED
                    client_socket = client
                    server:close()
                    server = nil
                    client_socket:settimeout(0)
                end
            end
        else
            repeat
                send_receive()
            until not locked

            if timeout_timer <= 0 then
                print("Client timed out")
                current_state = STATE_NOT_CONNECTED
            end
        end

        coroutine.yield()
    end
end

event.onexit(function ()
    print("\n-- Restarting Script --\n")
    if server ~= nil then
        server:close()
    end
end)

if bizhawk_major < 2 or (bizhawk_major == 2 and bizhawk_minor < 7) then
    print("Must use BizHawk 2.7.0 or newer")
else
    if bizhawk_major > 2 or (bizhawk_major == 2 and bizhawk_minor > 10) then
        print("Warning: This version of BizHawk is newer than this script. If it doesn't work, consider downgrading to 2.10.")
    end

    if emu.getsystemid() == "NULL" then
        print("No ROM is loaded. Please load a ROM.")
        while emu.getsystemid() == "NULL" do
            emu.frameadvance()
        end
    end

    rom_hash = gameinfo.getromhash()

    print("Waiting for client to connect. This may take longer the more instances of this script you have open at once.\n")

    local co = coroutine.create(main)
    function tick ()
        local status, err = coroutine.resume(co)

        if not status and err ~= "cannot resume dead coroutine" then
            print("\nERROR: "..err)
            print("Consider reporting this crash.\n")
    
            if server ~= nil then
                server:close()
            end

            co = coroutine.create(main)
        end
    end

    -- Gambatte has a setting which can cause script execution to become
    -- misaligned, so for GB and GBC we explicitly set the callback on
    -- vblank instead.
    -- https://github.com/TASEmulators/BizHawk/issues/3711
    if emu.getsystemid() == "GB" or emu.getsystemid() == "GBC" or emu.getsystemid() == "SGB" then
        event.onmemoryexecute(tick, 0x40, "tick", "System Bus")
    else
        event.onframeend(tick)
    end

    while true do
        emu.frameadvance()
    end
end

end