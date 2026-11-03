-- RollingSystem.gui.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ROLL_EVENT = Instance.new("RemoteEvent")
ROLL_EVENT.Name = "RollEvent"
ROLL_EVENT.Parent = ReplicatedStorage

local AURAS = {
    "Fire",
    "Water",
    "Earth",
    "Wind",
    "Light",
    "Dark"
}

local function rollAura(player)
    local randomIndex = math.random(1, #AURAS)
    local aura = AURAS[randomIndex]
    player:SetAttribute("CurrentAura", aura)
    
    return aura
end

ROLL_EVENT.OnServerEvent:Connect(function(player)
    local aura = rollAura(player)
    
    -- Create particle effect based on aura
    local particle = Instance.new("ParticleEmitter")
    particle.Parent = player.Character.HumanoidRootPart
    
    if aura == "Fire" then
        particle.Color = Color3.fromRGB(255, 0, 0)
    elseif aura == "Water" then
        particle.Color = Color3.fromRGB(0, 0, 255)
    elseif aura == "Earth" then
        particle.Color = Color3.fromRGB(0, 255, 0)
    elseif aura == "Wind" then
        particle.Color = Color3.fromRGB(255, 255, 255)
    elseif aura == "Light" then
        particle.Color = Color3.fromRGB(255, 255, 0)
    elseif aura == "Dark" then
        particle.Color = Color3.fromRGB(0, 0, 0)
    end
    
    particle:Emit(10)
    
    game:GetService("Debris"):AddItem(particle, 2)
end)