QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("philipsscrewdriver", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("ms:removeplate", source)
    end
end)


QBCore.Functions.CreateUseableItem("license_plate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("ms:placeplate", source)
    end
end)
