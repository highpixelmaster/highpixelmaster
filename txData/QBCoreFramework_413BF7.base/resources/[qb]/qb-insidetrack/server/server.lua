local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("insidetrack:server:winnings")
AddEventHandler("insidetrack:server:winnings", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player ~= nil then
        Player.Functions.AddItem("casino_chips", amount)
        --print("Added item")
    end
end)

RegisterServerEvent("insidetrack:server:placebet")
AddEventHandler("insidetrack:server:placebet", function(bet)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player ~= nil then
        Player.Functions.RemoveItem("casino_chips", bet)
        --print("removed items")
    end
end)

QBCore.Functions.CreateCallback("insidetrack:server:getbalance", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player ~= nil then
        chips = Player.Functions.GetItemByName("casino_chips")
        if chips ~= nil then
            cb(chips.amount)
        else
            cb(0)
        end
    else
        cb(0)
    end
end)