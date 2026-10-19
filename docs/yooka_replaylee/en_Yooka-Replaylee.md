# Yooka-Replaylee

This APWorld currently randomizes the Yooka-Replaylee location list and movement abilities.

The current generation baseline uses a connected region graph with no entrance or individual location requirements yet. The final goal is represented by a generation-only `Victory` event in Galleon Galaxy.


## Triple Pagie Medal Goal

The `goal` option accepts a value from 1 to 10. Each of the five boss checks and each of the five `Grand Tome Ghosts` checks awards a `Triple Pagie Medal`. The completion condition is reaching the configured number of medals.


## Quillsanity

When enabled, the seed includes all 750 individual Quill checks. When disabled, those checks are omitted.
