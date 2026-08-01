# How to integrate Torture User Client
Now, you can't integrate the Admin Client as that is meant to be its own thing, however you can integrate the user
client! You don't really need to do much.

The importing process follows just like UT.

![How to import Torture User Client](https://github.com/ElectroStarz/Torture-AP-Client/blob/main/docs/images/importing.png)

We define the classes afterwards because we can't import as SuperContext and SuperCommandContext because of UT. Now, for
your Context and CommandProcessor classes we use multilevel inheritance, they should look something like this (Depending
on if you have integrated UT or not)

![Multilevel inheritence with the Context and CommandProcessor classes](https://github.com/ElectroStarz/Torture-AP-Client/blob/main/docs/images/multilevel_inheritance.png)

If things are working, you should be able to do /torture_help in your client, and it'll take you to the user help 
document! Please see the [Torture User Client help doc](https://github.com/ElectroStarz/Torture-AP-Client/blob/main/docs/user_help.md).