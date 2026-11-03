-- CombatArea.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local COMBAT_AREA = workspace:WaitForChild("CombatArea")

local function calculateDamage(player, target)
    local playerAura = player:GetAttribute("CurrentAura")
    local targetAura = target:GetAttribute("CurrentAura")
    
    local damage = 10 -- Base damage
    
    if playerAura == "Fire" and targetAura == "Water" then
        damage = damage * 2
    elseif playerAura == "Water" and targetAura == "Fire" then
        damage = damage * 0.5
    elseif playerAura == "Earth" and targetAura == "Wind" then
        damage = damage * 2
    elseif playerAura == "Wind" and targetAura == "Earth" then
        damage = damage * 0.5
    elseif playerAura == "Light" and targetAura == "Dark" then
        damage = damage * 2
    elseif playerAura == "Dark" and targetAura == "Light" then
        damage = damage * 0.5
    end
    
    return damage
end

COMBAT_AREA.Touched:Connect(function(hit)
    local player = Players:GetPlayerFromCharacter(hit.Parent)
    local target = Players:GetPlayerFromCharacter(hit.Parent)
    
    if player and target and player ~= target then
        local damage = calculateDamage(player, target)
        
        local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:TakeDamage(damage)
        end
    end
end)