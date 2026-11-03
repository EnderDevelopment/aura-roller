-- DeveloperProductService.server.lua

local DataStoreService = game:GetService("DataStoreService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local COINS_DATASTORE_NAME = "PlayerCoins"
local COINS_PER_PURCHASE = 500

local function awardCoins(player, amount)
    local dataStore = DataStoreService:GetDataStore(COINS_DATASTORE_NAME)
    local success, err = pcall(function()
        local coins = dataStore:GetAsync(player.UserId) or 0
        coins = coins + amount
        dataStore:SetAsync(player.UserId, coins)
    end)
    
    if not success then
        warn("Failed to award coins to " .. player.Name .. ": " .. err)
    end
end

MarketplaceService.ProcessReceipt = function(receiptInfo)
    local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
    if player then
        awardCoins(player, COINS_PER_PURCHASE)
    end
    
    return Enum.ProductPurchaseDecision.PurchaseGranted
end

Players.PlayerAdded:Connect(function(player)
    local dataStore = DataStoreService:GetDataStore(COINS_DATASTORE_NAME)
    local success, coins = pcall(function()
        return dataStore:GetAsync(player.UserId)
    end)
    
    if success and coins then
        player:SetAttribute("Coins", coins)
    else
        player:SetAttribute("Coins", 0)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    local dataStore = DataStoreService:GetDataStore(COINS_DATASTORE_NAME)
    local coins = player:GetAttribute("Coins") or 0
    
    local success, err = pcall(function()
        dataStore:SetAsync(player.UserId, coins)
    end)
    
    if not success then
        warn("Failed to save coins for " .. player.Name .. ": " .. err)
    end
end)