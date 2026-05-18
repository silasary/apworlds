# Advanced Options for apAdventure

apAdventure features some YAML options that are structured differently from what players might be used to from other apworlds.

## Cherrypicking and Blacklisting

Maps and items in apAdventure are normally grouped together for organization, but these options may be used in cases where you only want to add certain maps or items from a group to your run. All of these options are structured similarly, so you can reference the defaults for the `config_blacklist` option to get an example.

Putting maps or items into the blacklist options that haven't actually been added in previous options will not cause any errors.

Here are a few more examples:

This will only give players the Gravity Gun and Bugbait from HL2, which could be useful when playing with a custom weapon set so maps requiring them are still beatable.
```
item_cherrypick:
    hl2weps:
        - Gravity Gun
        - Bugbait
```

This would remove the Crowbar from the item pool and replace it with the Stunstick from HL2DM.
```
item_cherrypick:
    hl2dmweps:
        - Stunstick

item_blacklist:
    hl2weps:
        - Crowbar
```




