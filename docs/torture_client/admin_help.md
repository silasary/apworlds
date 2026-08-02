# Torture Admin Client

Greetings, I assume you are here because you either typed /torture_help in the admin client, or just saw this document 
in the GitHub repo. Either way, here's a guide on how to use the client.

## Generating and connecting to a room
When using the Torture Admin Client, you will be required to place a yaml for the torture client in your players folder.
No locations or items will be generated for it, this just makes sure no one goes into random multiworlds using this.
Once generated and hosted, you connect like you would with any other client, type in the server address, port and the
admin client slot name.

Upon connecting, if you haven't already done so, you will see a prompt to either make a password or enter a password.
This password can be changed with /set_password

This client does require admin permissions to give out traps. You can set the server password in the console by doing /option
server_password {password}. Then in the client you can do !admin login {password}

***THE TORTURE ADMIN CLIENT DOES NOT GUARANTEE THAT A PLAYER CANNOT USE IT HOWEVER ANY SECURITY SUGGESTIONS WILL BE 
GREATLY APPRECIATED***

## Interfacing with the client
As usual, you have every feature the text client has, just a normal client. Or is it? Like UT, you'll see there is a new
tab in the top, "Torture Dashboard". It's recommended to have the client be larger than usual due to my poor kivy
skills... But anyway, on the left you will see server and player information. If you have any suggestions as to what should be
there, please do say.

### Coloured Names
If you quickly look below, you'll see that the names are coloured, here's what they mean:\
Red = Disconnected\
Green = Connected & Regular Client\
Blue = Connected & Torture User Client (Supports Special Features)\
Yellow = Goaled

### Link Sending
On the right you'll see a few boxes. Two buttons, one text input. The top button allows you to select between the
supported link types. Then the hint text in the text input box will update to what information you need to enter.

### Trap Sending
Below that there are the send traps options and the target player check boxes. This allows you to send traps to either
selected or random people. If you put a number without anyone selected, the client will select random people to send
traps to. If you have a number **and** selected people, it will pick [number]/[selected] people to send traps to. If you
have just selected people, it will send traps to them.

The trap sending may not be perfect, this checks the item_name_to_id in the datapackage for items that have the word
"Trap" (case-insensitive) in them.

### Log to Clients
Now below that you will see a Log to Clients subheading! This will log directly to the client whatever you type and 
send! However, this is a feature only supported by the Torture **User** Client, see
[here](https://github.com/ElectroStarz/Torture-AP-Client/blob/main/docs/integrating.md) to integrate it with your
client.

You can even use [colours](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/network%20protocol.md#JSONMessagePart)
with this! If you want a piece of text (or all) to be in colour, simply type {color: insert colour here, text:
insert text here} (Can be either way round)

But what can I do with this? Well, you didn't get this from me, but you can fake hints using this... Although they don't
appear in Hints tab (I'll try to do that if I can :P), you can also stalk and creep out your players, ah the joy...

Oh and by the way, if you have no one enabled, it'll send the message to everyone it can!

Have a suggestion? Feel free to ping @electrostarz and I'll reply as soon as possible!