# 🎢 Archipelago Parkitect – AP World

This document describes how the **Parkitect AP World** integrates with the Archipelago multiworld randomizer.  
It covers configuration, item handling, scenarios, and how cross-game interactions work.

---

## 🎲 [What Does Randomization Affect?](https://github.com/CrusherRL/AP_Parkitect?tab=readme-ov-file#-what-can-the-randomizer-change)

---

## 🎯 [Goals](https://github.com/CrusherRL/AP_Parkitect?tab=readme-ov-file#-goals)

---

## 🌍 Which Items Can Appear in Another Player’s World?

Certain Parkitect items can be sent across the network and affect other players’ parks.  
Here’s what can appear in **other players’ worlds**:

| Category              | Item                                                                                                                    | Description                                                                           |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| **Player**            | 💰 Money                                                                                                                | Adding player’s park funds                                                            |
| **Attractions**       | 🎠 Itself                                                                                                               |
|                       | ⚙️ Breakdowns                                                                                                           | Random attraction malfunctions (excluding crashes & lightning strikes)                |
|                       | 🎟️ Vouchers                                                                                                            | Vouchers for a free ride                                                              |
| **Shops / Stalls**    | 🍔 Itself                                                                                                               |                                                                                       |
|                       | 📦 Ingredient Re-Delivery                                                                                               | Triggers restocking                                                                   |
|                       | 🧹 Cleaning Job                                                                                                         | Assigns janitors to clean a Stall/Shop                                                |
|                       | 🎟️ Vouchers                                                                                                            | Vouchers for a free drink/food                                                        |
| **Utility Buidlings** | 🏭 Itself                                                                                                               |
| **Employees (Traps)** | 💤 Tired, 🧠 Training, 🧑‍🔧 Hiring                                                                                     | Modifies employee states                                                              |
| **Weather (Traps)**   | 🌧️ Rainy / Stormy / Cloudy / Sunny                                                                                     | Alters weather conditions                                                             |
| **Guests (Traps)**    | 🧍 Spawning, 💀 Kill, 💸 Money (+/-), 🍔 Hungry, 🥤 Thirsty, 🚽 Toilet, 🤢 Vomit, 😡 Happiness, 😴 Tiredness, 🧨 Vandal | Alters guest states or spawns effects                                                 |
| **Research (Traps)**  | Attraction/Shop/Decoration Theme                                                                                        | Put it into the research Pool                                                         |
| **Statistics**        | All type of Statistics                                                                                                  |                                                                                       |
| **Parkitect Mods**    | Only from Collection                                                                                                    | [Steam Collection](https://steamcommunity.com/sharedfiles/filedetails/?id=3647109901) |

---

## 🎁 What Happens When the Player Receives an Item?

### 🧩 Planned / Work in Progress
When the player receives an **Archipelago item**, or completes a **challenge**,  
an **“Ingredient Package”** will appear at the **Depot**.  
A **Delivery Guy** (Handyman) will collect it and deliver it to the correct building.  
Once it arrives, the related AP item becomes **active/unlocked**.

> Example:  
> You receive a “Carousel” → a package is delivered to a specific Shop to unlock.

### ✅ Current Implementation
For now, items are **instantly applied** to the game state upon reception.  
Completing a challenge immediately **unlocks** its corresponding AP item.

---

## 🗺️ Available Scenarios

Currently included scenarios:

| Scenario Name | Description | Notes |
|----------------|--------------|-------|
| **Lakeside Green** | A relaxing park by the lake. Great starter map with balanced challenges. | Recommended for first-time AP runs |
| **Dusty Ridge Ranch** | A dry, rugged landscape perfect for testing weather effects. | More challenging terrain |
| **The Broken Atoll** | Small Island and everything is broken. Really, anything!. | Cleanup before you start! :D |
| **Magma Falls** | Volcanic Theme Park. For the more experienced :). | More challenging terrain and less space |

> 💡 More maps will be added over time — including community submissions!  
> You can request or submit new scenarios in the [GitHub repository](https://github.com/CrusherRL/AP_Parkitect_World/issues) or on Discord.

---

## 🧭 [Scenario Rules (for Contributors)](https://github.com/CrusherRL/AP_Parkitect?tab=readme-ov-file#-scenario-rules-for-contributors)

---


## 🧭 [Testing & Compatibility](https://github.com/CrusherRL/AP_Parkitect?tab=readme-ov-file#-testing--compatibility)

---

## 💡 Future Ideas

- Proper **Delivery System** for AP items  
- Additional **Scenario maps** and themed challenges  

---

## ❤️ Credits

Created by **CrusherRL**
Special thanks to my friends who helped me with ideas, debugging and adding content!
Special thanks to the **Archipelago Community** for testing, feedback, and support!

---

🧩 *“Every park is a world — now it’s part of many.”*
