# Capabilities and Regional Conditions

To allow custom items to be recognized by access rules, apAdventure uses a tag system instead of hardcoding access rules to look for certain items.

Currently, this system employs two different types of tags, capabilities and regional conditions.

Capabilities tell the generator what an item is capabable of, while conditions tell it under which conditions these capabilities are available. For example, a shotgun may provide the StrongShortRange capabilitity under the Ammo_Buckshot condition.

Capabilities and conditions can be any arbitrary string. While you should use the ones documented here or suggested by the editor UI when appropriate to maximize compatibility with other custom content, you can add your own for your own purposes if you need to. Keep in mind that this also means that you won't receive any warnings if you accidentally make a typo though.

### Implied Capabilities

Since there are many cases where a certain capability would also imply that an item would be able to fulfill other capabilities, the generator will automatically add certain capabilities based on the ones it already has. The item index will show you what implied capabilities items are able to fulfill on top of their already assigned capabilities.

There is currently no way to make custom capabilities imply other capabilities.

### Note on Condition Placement

Access rules only see regional conditions of the region the access rule is placed on. For connections between two regions, it only sees the conditions of the source region.

Conditions function this way both because it is faster to check this way in code, but also because I feel that players should not be expected to run back to a previous map to grab ammo for the current one.

## Capabilities

### Damage Types

These tags indicate what damage the player is capable of dealing with this item. They are named after [the DMG Enums](https://wiki.facepunch.com/gmod/Enums/DMG), but with the word "Damage" appended and written in camelcase.

__CrushDamage, BulletDamage, SlashDamage, BurnDamage, VehicleDamage, FallDamage, BlastDamage, ClubDamage, ShockDamage, SonicDamage, EnergyBeamDamage, PreventPhysicsForceDamage, NeverGibDamage, AlwaysGibDamage, DrownDamage, ParalyzeDamage, NerveGasDamage, PoisonDamage, RadiationDamage, DrownRecoverDamage, AcidDamage, SlowburnDamage, RemoveNoRagdollDamage, PhysgunDamage, PlasmaDamage, AirboatDamage, DissolveDamage, BlastSurfaceDamage, DirectDamage, BuckshotDamage, SniperDamage, MissileDefenceDamage__

These should only be used to determine the damage type of an attack, BlastDamage items are not guaranteed to be able to cause explosions and BurnDamage items are not guaranteed to be able to set things on fire.

If you need to find out what damage something is capable of dealing, apAdventure provides a damage tester entity that prints the damage types of whatever attack hits it into the console, although this entity is somewhat limited as some attacks aren't capable of hitting it (AR2 balls bounce off of it for example), so I'll try to provide a better way of determining this in the future.

### Ranged Damage

These capabilities define how strong an item is at different ranges.

||Wimpy|Weak|Decent|Strong|
|-|-|-|-|-|
|__Melee__|WimpyMelee|WeakMelee|DecentMelee|StrongMelee|
|__ShortRange__|WimpyShortRange|WeakShortRange|DecentShortRange|StrongShortRange|
|__MidRange__|WimpyMidRange|WeakMidRange|DecentMidRange|StrongMidRange|
|__LongRange__|WimpyLongRange|WeakLongRange|DecentLongRange|StrongLongRange|

All ranged capabilities also fulfill their weaker counterparts at the same range, but they do not fulfill their shorter range counterparts.

The "Wimpy" capabilities should be used for items that are theoretically able to deal damage, but aren't reliable or strong enough for use in combat. For example, the gravity gun can do some very minor damage by punting enemies with its primary fire while not holding something, so it has WimpyShortRange, and the HL1 pistol is 100% accurate if the player fires it slowly, so it has WimpyLongRange.

For weapons whose ammunition is usually a lot more scarce, it's a good idea to only assign the capabilities for their favored ranges, as while the crossbow does still deal good damage at close range, it's usually a good idea to reserve its ammo for enemies at longer distances.

### Explosive

There are two types of tags for weapons causing explosions:
- __WimpyExplosion, WeakExplosion, MediumDamageExplosion and StrongExplosion__ to denote how much damage the explosion causes.
- __TinyExplosion, SmallExplosion, MediumSizeExplosion and LargeExplosion__ to denote how large the explosion is.

Unlike the ranged damage capabilities, these do not automatically imply their weaker/smaller counterparts, since there may be cases in which you specifically want an explosion to not be to large or damaging. These are named in the pattern of [size]Or[Weaker/Stronger]Explosion and [strength]Or[Smaller/Larger]Explosion (i.e. WeakOrStrongerExplosion, MediumDamageOrWeakerExplosion, SmallOrLargerExplosion, MediumSizeOrSmallerExplosion, ...).

### Other

- __HeliKiller__ - Good for destroying Helicopters, Combine Gunships, etc. (mainly used on the Half-Life RPGs)
- __Waterproof__ - Put this on a weapon to signify that it can be used underwater. Not necessary on melee weapons.
- __HitScan__ - For weapons that use hitscan. Does not automatically imply that it can pass grates.
- __GratePass__ - Is able to attack through or otherwise pass entities/brushes using the CONTENTS_GRATE contents flag (used by most grate materials and wire fence props). Should be combined with other tags. 
- __AntlionFriendly__ - Makes antlions friendly to you. You probably shouldn't use this on your custom items and just rely on the base bugbait.
- __AntlionControl__ - Allows antlions to be commanded. You probably shouldn't use this on your custom items and just rely on the base bugbait.
- __BugbaitTrigger__ - Triggers [`point_bugbait`](https://developer.valvesoftware.com/wiki/Point_bugbait) entities. You probably shouldn't use this on your custom items and just rely on the base bugbait.
- __GravityGun__ - Can do everything the gravity gun can. You probably shouldn't use this on your custom items and just rely on the base gravity gun.

## Conditions

### Ammo

__Ammo_AR2, Ammo_Buckshot, Ammo_SMG1, ...__

Ammo conditions signify that a certain ammo type is present. They're named with the pattern Ammo_[ammo name], with the name being taken from the ammo types [AmmoData](https://wiki.facepunch.com/gmod/Structures/AmmoData). The editor UI automatically generates these for every ammo type it can find.

Ideally you should only place these in regions that have enough ammo of that type to be present to be useful in fight. For example, don't put this condition on a region that contains a single revolver ammo pickup, as this may result in logic expecting the player to win a fight with just a revolver and 3 rounds of ammo.

You should also keep in mind that some ammo spawns in HL2 are dynamic, and may not always spawn the same ammo type. You can find out if a pickup was placed dynamically by using [Rubat's Easy Entity Inspector](https://steamcommunity.com/sharedfiles/filedetails/?id=195065185) and checking if it has a map creation ID that is not -1 or check if the Delete Marker Tool lets you delete it while in Creation ID deletion mode.

### Props

__Props, Props_Sharp, Props_Explosive__

Signifies that props usable by the gravity gun are available.

### Other

- __Antlions_Controllable__ - Signifies that antlions controllable by bugbait are present here.