ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local treasureLastCollected = {}

-- Initialize the last collected time for each treasure location
Citizen.CreateThread(function()
    for i, loc in ipairs(Config.TreasureLocations) do
        treasureLastCollected[i] = 0
    end
end)

-- Server-side logic to handle treasure collection
RegisterServerEvent('treasure_hunt:collectTreasure')
AddEventHandler('treasure_hunt:collectTreasure', function(treasureIndex)
    local xPlayer = ESX.GetPlayerFromId(source)
    local currentTime = os.time() * 1000 -- current time in milliseconds

    if currentTime - treasureLastCollected[treasureIndex] >= Config.TreasureCooldown then
        treasureLastCollected[treasureIndex] = currentTime

        if Config.TreasureReward.type == 'money' then
            xPlayer.addMoney(Config.TreasureReward.amount)
            TriggerClientEvent('esx:showNotification', source, 'You found a treasure and received $' .. Config.TreasureReward.amount)
        elseif Config.TreasureReward.type == 'item' then
            xPlayer.addInventoryItem(Config.TreasureReward.itemName, Config.TreasureReward.amount)
            TriggerClientEvent('esx:showNotification', source, 'You found a treasure and received ' .. Config.TreasureReward.amount .. ' ' .. Config.TreasureReward.itemName)
        end
    else
        TriggerClientEvent('esx:showNotification', source, 'This treasure is still on cooldown. Please wait.')
    end
end)
