-- GamePassService.server.lua

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local VIP_LUCK_PASS_ID = 123456789 -- Replace with your actual Game Pass ID

local function checkVipLuck(player)
    local success, isVip = pcall(function()
        return MarketplaceService:UserOwnsGamePassAsync(player.UserId, VIP_LUCK_PASS_ID)
    end)
    
    if success then
        player:SetAttribute("VIPLuck", isVip)
    end
end

Players.PlayerAdded:Connect(function(player)
    checkVipLuck(player)
    
    MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, wasPurchased)
        if gamePassId == VIP_LUCK_PASS_ID and wasPurchased then
            player:SetAttribute("VIPLuck", true)
        end
    end)
end)