# Elden Ring Nightreign Log Files

All files live in your Archipelago install folder (by default `C:\ProgramData\Archipelago`). An easy way to get
there: open the Archipelago Launcher and click "Browse Files".

## Client Log
`logs\NightreignClient_<timestamp>.txt` - one file per client session, named by the time it started. This holds
everything the client printed, including errors. When reporting a bug, send the one from the session where it
happened (usually the newest).

## Run State
`nightreign\<seed>_<slot>.json` - one file per seed and slot. It records which locations were sent, wins, and
any unrecognized boss detections. Include it if the bug involves missing checks, items, or goal completion.
