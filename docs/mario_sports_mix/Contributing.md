# Contributing Guide
So, you wanna contribute to this project 'eh? Well, let me run you through the basics.

# Preparations

## Dolphin Memory Engine
First of all, before you do **aaanything** to do with the client, you need to know what you want to do and how to do it.
[Dolphin Memory Engine](https://github.com/aldelaro5/dolphin-memory-engine/releases) is a tool we use to analyse well,
the RAM (Random Access Memory) of Dolphin! This allows us to change maybe, the player's position! Or maybe the player's
held item! You get what I mean.

To start off with, figure out what you want to find. It'll most likely (NOT ALWAYS) be a byte so you can leave the type
to that, but make sure that under that it says 'Unknown Initial Value', then you can click 'First scan'. Now do
something to change the value, then you can select changed and hit 'Next scan'. Eventually using different techniques
you'll narrow it down to 2 or 3 addresses, then you can double-click one of them to add it to the list below. From there
you can give the address a name and double-click the value to manually change it to test (NOTE: The value only changes
**after** you press enter or click away from it)

## Pointers
Pointers are used when an address changes spots in the memory. I can't explain how to find them well, but you should watch
[this tutorial](https://www.youtube.com/watch?v=QwHTML0kRtI), it helped me :]

# Client

## Memory Addresses & Types
In DME, there are 11 memory types, which only around 6 are present in this project. If you take a look in
[memory_addresses_pal.py](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/mario_sports_mix_client/memory_addresses_pal.py)
there are addresses inside classes, these are used to distinguish what type of address they are alongside their variable
name. Each variable has the address in hex and the memory type commented out, some may have additional info beside them
to describe their behaviour. Let's take a look at 2 examples.

![The current stage variable and address](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/docs/contributing_resources/guide_images/current_stage_addr.png)

This is the variable for the current stage address. As you can see, it has 2 things, the hex address and a comment. This
comment refers to something that we'll cover in Cross-region Compatibility, but we can see that it tells us the address
is a **string**! Now let's take a look at something else.

![The special meter variable and address](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/docs/contributing_resources/guide_images/special_meter_addr.png)

This is the player's special meter address! Okay... We have the address, type and pointers! So we have a base address,
then pointer(s) to find the address we need! Pointers can be found in the Pointers class near the bottom of the file.
Woah woah woah, but Electro, what does 'In CAL' mean? Well I'm glad you asked!

### Common Address Library (CAL)
You'll see there is a file called [common_address_library.py](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/mario_sports_mix_client/common_address_library.py),
this file contains the class 'AddressLib'. The CAL is used for when I think there's addresses I will use many times and
I don't want to use the get_address() function 7000 times which we'll cover later. What this does is cache the value to
the address for use across the client and is called with "self.addresslib.{function_name}" inside MSMContext.

You'll also see there's a list of all the function names in strings, this is used for the /reset_cached command. If you
put an address in the CAL you **must** put the name of the function in the list.

### Cross-region Compatibility ( get_address() )
Oookayyy, let's get into this. The [get_address](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/mario_sports_mix_client/MSMFunctions.py#L102)
function is used for cross-region compatibility. You see, most addresses in MSM have a -0xF80 offset from PAL to NTSC-U.
The get_address function checks if the detected game version is either PAL or NTSC-U, if PAL, returns the normal
address, _however_ if it's NTSC-U, it returns the address minus that offset. There are a few exceptions, which brings us
to the function above get_address, is_exception! 

See, some addresses are the same for PAL and NTSC-U, so this is used
for those. is_exception checks if the variable passed through is in one of the classes in the exceptions tuple (usually
addresses to do with the save file), if so it returns true. This brings us back to get_address, where we say 'if
is_exception(address), return the normal address'.

If it's not an exception, we check the game region! If the region isn't NTSC-U, it just passes back the address given,
however if it is, we do a few more checks. Remember that current_stage variable? Remember how it said "Uses -0xF20
for NTSC-U"? Well, this is where we check if it's that address and if so, we return the correct address. However, if it
isn't we just return the address minus the default offset.

But hold on Electro, I only have the NTSC-U version! Well don't worry, for the sake of this project if you find an
address for NTSC-U, you can add it to the NTSCUAddresses class in the bottom of memory_addresses_pal, in which the
get_address function will automatically handle adding the offset if it's PAL!

## MSMInterface & Dolphin Connection
[MSMInterface](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/mario_sports_mix_client/MSMInterface.py) is the
file mainly used for well, interfacing with the game. This file handles making sure the context knows what's happening
and how it accesses the game. We'll explain more about the context file in a bit, but reading and writing is accessed by
self.dolphin_client.{function} in interface and self.game_interface.dolphin_client.{function} in context.
There's 3 types of functions, reading, writing and following pointers. MSMInterface only reads and follows pointers. Most
of the stuff is quite self-explanatory, so I won't go into it too much.

## MSMContext
This is the brains of the client, what handles everything from item unlocks to traps to optimisations! I can't possibly
explain everything, so I suggest you read through it and just ping me if you have any questions :]

Let's say you wanted to add your new function. If there isn't already a header which kind of describes what you want to
implement you can create your own one! Now, you'll most likely want your function to be asynchronous which means it can
run at the same time as everything else. Now, for the function name I want you to tell me what it does. For example, I
have a function called 'handle_received_deathlink', what do you think it does? If you said it handles received
deathlinks you'd be correct! Now, I can't tell you how exactly to make your function because I can't read your mind from
the past, but if you have any questions please feel free to ping me!

### Values
I've made a little helper doc for some values of some addresses :] [Value Guide](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/docs/contributing_resources/value_guide.md)