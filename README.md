# [CSDM] Knife Stealer

A fun and competitive Counter-Strike 1.6 plugin designed for CSDM (Deathmatch) servers, this plugin rewards players who eliminate enemies using a knife, allowing them to steal money from their victims, with chances for critical bonuses or total robbery!

## Plugin Information

  - **Name**: [CSDM] Knife Stealer
  - **Version**: 1.0
  - **Author**: DadoDz
  - **Game**: Counter-Strike 1.6
  - **Mod**: CSDM (Deathmatch)

## Description
When a player kills another using a knife, this plugin randomly determines how much money the killer steals from the victim, depending on luck and whether the kill was a headshot, the killer can rob a portion or even all of the victim’s money!

#### Robbery Chances:
  - 1–75% ---> **Steal 1250$ (2500$ if headshot)**
  - 76–80% ---> **Steal 0$ (failed attempt)**
  - 81–95% ---> **Steal a random amount of the victim’s money**
  - 96–100% ---> **Steal all of the victim’s money (total robbery)**

## Requirements
  - AMX Mod X 1.9+
  - ReAPI Module

## Installation
1. Place 'csdm_knife_stealer.sma' in: addons/amxmodx/scripting/
2. Compile it with your AMXX compiler.
3. Place the compiled .amxx file in: addons/amxmodx/plugins/
4. Add this line to your plugins.ini: csdm_knife_stealer.amxx
5. Restart your server.
