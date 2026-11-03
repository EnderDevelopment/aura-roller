# AuraRoller

AuraRoller is a Roblox game project that integrates with MarketplaceService to process Developer Products and Game Passes. It features a random number generator (RNG) rolling system with a UI text label that rolls a random aura from a rarity table. The project also includes a combat area where a player's attack damage scales based on their equipped aura's rarity. Players can purchase Developer Products for additional rolls or Game Passes for VIP benefits like increased chances of rolling legendary auras.

## Install

1. Open Roblox Studio.
2. Create a new Baseplate.
3. Navigate to the `ServerScriptService` folder and create a new Script.
4. Copy and paste the contents of `DeveloperProductService.server.lua` and `GamePassService.server.lua` into the Script.
5. Navigate to the `StarterGui` folder and create a new ScreenGui.
6. Inside the ScreenGui, create a new LocalScript and copy and paste the contents of `RollingSystem.gui.lua`.
7. Navigate to the `ServerScriptService` folder again and create another Script.
8. Copy and paste the contents of `CombatArea.server.lua` into this Script.
9. Ensure you have a part named `CombatArea` in your workspace for the combat system to work.
10. Replace the placeholder Game Pass ID in `GamePassService.server.lua` with your actual Game Pass ID.

## Use

1. Players can purchase Developer Products to roll for random auras.
2. Players can purchase Game Passes for VIP benefits like increased chances of rolling legendary auras.
3. The RNG rolling system will display the rolled aura and apply a colored particle effect based on the aura's rarity.
4. Players can enter the combat area to test their power against waves of NPCs or in a PvP arena, with attack damage scaling based on their equipped aura's rarity.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/e3bbb5e5-01a4-4808-ad79-d56c38bda38f?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=e3bbb5e5-01a4-4808-ad79-d56c38bda38f
