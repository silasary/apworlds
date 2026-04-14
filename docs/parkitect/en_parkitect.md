# 🎢 Archipelago Parkitect – AP World

This document describes how the **Parkitect AP World** integrates with the Archipelago multiworld randomizer.  
It covers configuration, item handling, scenarios, and how cross-game interactions work.

---

## 🎲 What Does Randomization Affect?

The randomizer can affect almost every system inside Parkitect, bringing chaos and fun to your park management experience! 🎡

### Randomized Categories

### 🎢 Player
- Adjust **Game Speed** (adds new options: `4x`, `5x`, `6x`, `7x`, `7x, `9x`)
- Add **Money**

### 🧍 Guests
- Spawn guests
- Modify their money (+/-)
- Kill (remove) them
- Change their needs (hungry, thirsty, happy, tired, bathroom)
- Cause **vomiting**/**nausea**
- Turn them into **vandals**

### 🧑‍🔧 Employees
- Hire automatically
- Set **tired** state
- Send for **training**

### ☁️ Weather
- Set to **Rainy**, **Cloudy**, **Sunny** or **Stormy**

### 🎠 Attractions
- Trigger **breakdowns**
- Apply **vouchers**

### 🍔 Stalls / Shops
- Re-deliver ingredients
- Set **cleaning tasks**
- Apply **vouchers**

### 🗺️ Scenario
- Add any **goal** with any **reward**

---

## 🎯 Goals
You can configure multiple win conditions for your scenario. Each goal can be adjusted individually:

### 👥 Guest Goal
Defines how many guests must be in your park to win.  
- **Range:** 1 – 2500  
- **Default:** 1000  

### 💰 Money Goal
Requires reaching a certain amount of money.  
- **Range:** 50,000 – 500,000  
- **Default:** 100,000  

### 🎢 Roller Coaster Goal
Number of roller coasters required.  
- **Range:** 0 – 12  
- **Default:** 4  

### 😀 Excitement Rating
Minimum excitement required for a coaster to count.  
Set to **0** to disable this requirement.  
- **Range:** 0 – 80  
- **Default:** 50  

### 😬 Intensity Rating
Minimum intensity required for a coaster to count.  
Set to **0** to disable this requirement.  
- **Range:** 0 – 80  
- **Default:** 50  

### 📈 Ride Profit Goal
Total profit required from all rides.  
- **Range:** 0 – 10,000  
- **Default:** 1500  

### 🎟️ Park Tickets Goal
Number of park tickets that must be sold.  
- **Range:** 0 – 20,000  
- **Default:** 0  

### 🏪 Shops Goal
Number of shops required in the park.  
- **Range:** 0 – 100  
- **Default:** 30  

### 💵 Shop Profit Goal
Total profit required from shops.  
- **Range:** 0 – 3,000  
- **Default:** 500  

---

## 🌍 Which Items Can Appear in Another Player’s World?

Certain Parkitect items can be sent across the network and affect other players’ parks.  
Here’s what can appear in **other players’ worlds**:

| Category | Item | Description |
|-----------|------|-------------|
| **Player** | 💰 Money (+/-) | Changes player’s park funds |
| **Attractions** | 🎠 Attractions |
| | ⚙️ Breakdowns | Random attraction malfunctions (excluding crashes & lightning strikes) |
| | 🎟️ Vouchers ||
| **Shops / Stalls** | 🍔 Stall/Shop ||
| | 📦 Ingredient Re-Delivery | Triggers restocking |
| | 🧹 Cleaning Job | Assigns janitors |
| | 🎟️ Vouchers ||
| **Employees (Traps)** | 💤 Tired, 🧠 Training, 🧑‍🔧 Hiring | Modifies employee states |
| **Weather (Traps)** | 🌧️ Rainy / Stormy / Cloudy / Sunny | Alters weather conditions |
| **Guests (Traps)** | 🧍 Spawning, 💀 Kill, 💸 Money (+/-), 🍔 Hungry, 🥤 Thirsty, 🚽 Toilet, 🤢 Vomit, 😡 Happiness, 😴 Tiredness, 🧨 Vandal | Alters guest states or spawns effects |
| **Parkitect Mods** | Only from Collection | [Steam Collection](https://steamcommunity.com/sharedfiles/filedetails/?id=3647109901) |

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
