# Nicktoons: Battle for Volcano Island Memory Map

## Purpose

### Plain English

This is the client-facing address reference for the USA GBA ROM. Addresses are read and written through BizHawk's `System Bus` domain.

### Engineering Notes

All values below are one-byte values unless otherwise stated. The client intentionally writes randomized progression every watcher tick so local save state cannot override the Archipelago item list.

## Core state

| Address | Name | Values / use |
| --- | --- | --- |
| `03000514` | Game state / current screen | `0x11` = stage complete; `0x00` returns to file select |
| `0300052E` | Actual current stage | `00` hub, `01` tutorial, `03`–`16` normal stages, `18`–`1A` secrets, `1B` final boss |
| `0300052F` | Stage variant | `01` distinguishes Final Boss 2; the client treats both final-boss variants as one goal |
| `03000564` | In-level health | Recorded in the notes; not used for checks |
| `03000565` | In-level Golden Hearts | Number earned in the current stage, capped at five by the client |
| `03000600` | Final-level eye/light | `00` not defeated, `01` defeated |
| `03000638` | Total Golden Heart counter | Authoritative randomized total |

## Characters and abilities

| Address | Name | Values |
| --- | --- | --- |
| `030005DE` | Character unlocks | `00` SpongeBob/Danny, `01` + Timmy, `02` + Patrick. The client also writes this byte for received Progressive Character Unlock items. |
| `030005D8` | Character ability unlocks | Base `0x20`; low four bits are Spongebob `01`, Radar `02`, Patrick `04`, Timmy `08`. The client also writes this byte for received ability items, so AP-forced transitions are filtered and the matching story completion event is used as a fallback. |

## Golden Heart save bytes

| Stage group | Addresses |
| --- | --- |
| Beach | `03000608`–`0300060B` |
| Jungle | `0300060D`–`03000610` |
| Cave | `03000612`–`03000615` |
| Desert | `03000617`–`0300061A` |
| Forest | `0300061C`–`0300061F` |
| Secrets | `03000622`–`03000624` |

Each byte is the saved Golden Heart/light value for the corresponding stage. The current client derives checks from the in-level count at completion and does not need to write these per-stage bytes.

## Rip Zipper bitfields

| Address | Bits |
| --- | --- |
| `030005E0` | bits 0–3 = Beach 1–4; bits 4–7 = Jungle 1–4 |
| `030005E1` | bits 0–3 = Cave 1–4; bits 4–7 = Desert 1–4 |
| `030005E2` | bits 0–3 = Forest 1–4; bits 5–7 = Secret 1–3 |

The client rebuilds these bytes from the set of received Rip Zipper Piece items. It deliberately leaves the unused bit 4 of `030005E2` clear.
