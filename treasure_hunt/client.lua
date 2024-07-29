ESX = nil
local treasureFound = {}

Citizen.CreateThread(function()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    for i, loc in ipairs(Config.TreasureLocations) do
        treasureFound[i] = false
    end

    while true do
        Citizen.Wait(0)
        
        for i, loc in ipairs(Config.TreasureLocations) do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - vector3(loc.x, loc.y, loc.z))

            if distance < 50.0 then
                DrawMarker(1, loc.x, loc.y, loc.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
                
                if distance < 1.0 and not treasureFound[i] then
                    ESX.ShowNotification('Press ~INPUT_CONTEXT~ to collect the treasure!')
                    if IsControlJustReleased(0, 38) then -- E key
                        TriggerServerEvent('treasure_hunt:collectTreasure', i)
                        treasureFound[i] = true
                    end
                end
            end
        end
    end
end)

-- Reset treasure hunt status every 10 minutes (600000 ms)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(600000)
        for i in ipairs(treasureFound) do
            treasureFound[i] = false
        end
    end
end)
