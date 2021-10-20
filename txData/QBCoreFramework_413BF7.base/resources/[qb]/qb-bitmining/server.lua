RegisterServerEvent('qb-cryptomining:server:addCryptoCoins')
AddEventHandler('qb-cryptomining:server:addCryptoCoins', function(reward)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.Functions.AddMoney('crypto', reward) then
        TriggerClientEvent('QBCore:Notify', src, "You have mined "..reward.." BTC!", 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, "Mining Failed", 'error')
    end
end)

QBCore.Functions.CreateUseableItem("gpu1", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-cryptomining:client:installCPU", source, "RTX 2070", Config.Reward["RTX 2070"], item)
end)

QBCore.Functions.CreateUseableItem("gpu2", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-cryptomining:client:installCPU", source, "5700 XT", Config.Reward["5700 XT"], item)
end)

QBCore.Functions.CreateUseableItem("gpu3", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-cryptomining:client:installCPU", source, "3060 Ti", Config.Reward["3060 Ti"], item)
end)

RegisterServerEvent("qb-cryptomining:server:RemoveItem")
AddEventHandler("qb-cryptomining:server:RemoveItem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)
