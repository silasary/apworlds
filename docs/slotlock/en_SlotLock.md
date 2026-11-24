# Slotlock Guide: How it works, and what it does.
(Disclaimer: This guide is not finished. Other sections will be added soon.)

SlotLock is a metagame apworld created by Sandra with the sole purpose of locking slots for Archipelago MultiWorlds. 
Its as simple as that! It locks slots, and requires players to collect slot unlock items for slots to be logically available!
## Q&A
### When I play with SlotLock, why can I still play a locked slot? 
SlotLock works on what is known as an honour system. What this means is that it relies on YOU to not invalidate it, which means not playing a slot before it's slot unlock item has been obtained. This is as close as we can get to truly locking slots, without replacing the archipelago server..
### How do I lock all slots except for one/ones I have listed?
To achieve this, your yaml must have `slots_whitelist` set to `false`, and then either set `random_unlocked_slots` to `1`, or put the name of the slot you want to have unlocked in the `slots_to_lock` field, as setting `slots_whitelist` to `false` will cause it to lock everything else.
### My generation is taking really long, whats happening?
A quirk of SlotLock is that it tends to create a very restrictive generation, causing it to take way longer than it would normally to get a successful seed, along with creating possible errors in generation. To remedy this, we either recommend running multiple generations using the Generate until Successful tool or the .bat file in the pins of the Slotlock thread. These allow for generations to just run without manual input, even if the generation fails, the tools will just restart the generation. Additionally, turning off progression balancing can help, so make sure to disable it on all slots if you think its needed. Another option is increasing the starting slots/`unlock_item_copies` to ensure a larger sphere 1, or just choosing a starting game with a large sphere 1 to begin with.
### I'm getting slot unlocks too often, how do i remedy this? 
To stop this from happening, you have to change the amount of `unlock_item_copies` to a lower amount. While it does help generation run quicker, don't forget that increasing the number of initially unlocked slots also helps.
### How do i know what slots are initially unlocked?
Open the SlotLock client (using the archipelago launcher), and log into the server to the SlotLock slot you created before using the /unlocked_slots command. Alternatively, you can check what slots are available by seeing what items the SlotLock slot has received.
### SlotLock has checks, but how do I send them out?
These checks are obtainable after collecting a slot unlock, and are sent by just having the SlotLock client open.  
### I'm receiving progression items from unlocking slots, how do i stop this from happening?
To do this, you need to put `Slot Rewards` into the `excluded_locations` section of your yaml (at the very bottom).