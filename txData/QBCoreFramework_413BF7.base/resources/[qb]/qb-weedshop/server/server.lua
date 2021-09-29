
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

--########################################## We Love You Kakarot#2550 ##########################################--
--##############################################################################################################--
--############################################### OGKush Picking ###############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshop:server:OGKushPick')
AddEventHandler('qb-weedshop:server:OGKushPick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,10)
    if random <= 5 then
        Player.Functions.AddItem("weed_og_kush_seed", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_og_kush_seed"], "add")
   else
            Player.Functions.AddItem("weed_og_kush", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_og_kush"], "add")
    end
end)

--##############################################################################################################--
--############################################# Purple-Haze Picking ############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshop:server:PurpleHazePick')
AddEventHandler('qb-weedshop:server:PurpleHazePick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,10)
    if random <= 5 then
        Player.Functions.AddItem("weed_purple_haze_seed", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_purple_haze_seed"], "add")
   else
            Player.Functions.AddItem("weed_purple_haze", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_purple_haze"], "add")
    end
end)

--##############################################################################################################--
--################################################# AK47 Picking ###############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshop:server:AK47Pick')
AddEventHandler('qb-weedshop:server:AK47Pick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,10)
    if random <= 5 then
        Player.Functions.AddItem("weed_ak47_seed", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_ak47_seed"], "add")
   else
            Player.Functions.AddItem("weed_ak47", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_ak47"], "add")
    end
end)

--##############################################################################################################--
--################################################# Skunk Picking ##############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshop:server:SkunkPick')
AddEventHandler('qb-weedshop:server:SkunkPick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,10)
    if random <= 5 then
        Player.Functions.AddItem("weed_skunk_seed", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_skunk_seed"], "add")
    else
            Player.Functions.AddItem("weed_skunk", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_skunk"], "add")
    end
end)

--##############################################################################################################--
--########################################### White-Widow Picking ##############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshop:server:WhiteWidowPick')
AddEventHandler('qb-weedshop:server:WhiteWidowPick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,10)
    if random <= 5 then
        Player.Functions.AddItem("weed_white_widow_seed", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_white_widow_seed"], "add")
    else
            Player.Functions.AddItem("weed_white_widow", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_white_widow"], "add")
    end
end)

--##############################################################################################################--
--############################################# Amnesia Picking ################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshop:server:AmnesiaPick')
AddEventHandler('qb-weedshop:server:AmnesiaPick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,10)
    if random <= 5 then
        Player.Functions.AddItem("weed_amnesia_seed", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_amnesia_seed"], "add")
   else
            Player.Functions.AddItem("weed_amnesia", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_amnesia"], "add")
    end
end)

--##############################################################################################################--
--################################################## OGKush ####################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:ogkush', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName("rolling_paper")
    local weedkush = Player.Functions.GetItemByName("weed_og_kush")
    if rolling ~= nil and weedkush ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--################################################ Purple-Haze #################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:weed_purple_haze', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName("rolling_paper")
    local weed_purple_haze = Player.Functions.GetItemByName("weed_purple_haze")
    if rolling ~= nil and weed_purple_haze ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--################################################## AK47 ######################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:weed_ak47', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName("rolling_paper")
    local weed_ak47 = Player.Functions.GetItemByName("weed_ak47")
    if rolling ~= nil and weed_ak47 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--################################################## Skunk #####################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:weed_skunk', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName("rolling_paper")
    local weed_skunk = Player.Functions.GetItemByName("weed_skunk")
    if rolling ~= nil and weed_skunk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--############################################### White-Widow ##################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:white_widow', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName("rolling_paper")
    local white_widow = Player.Functions.GetItemByName("white_widow")
    if rolling ~= nil and white_widow ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--################################################# Amnesia ####################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:amnesia', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rolling = Player.Functions.GetItemByName("rolling_paper")
    local amnesia = Player.Functions.GetItemByName("weed_amnesia")
    if rolling ~= nil and amnesia ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--################################################### Dab ######################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

QBCore.Functions.CreateCallback('qb-weedshop:server:getitems:dabcart', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weed_white_widow1 = Player.Functions.GetItemByName("rolling_paper")
    local weed_skunk1 = Player.Functions.GetItemByName("weed_amnesia")
    local weed_purple_haze1 = Player.Functions.GetItemByName("rolling_paper")
    local weed_og_kush1 = Player.Functions.GetItemByName("weed_amnesia")
    local weed_amnesia1 = Player.Functions.GetItemByName("rolling_paper")
    local weed_ak471 = Player.Functions.GetItemByName("weed_amnesia")
    if weed_white_widow1 ~= nil and weed_skunk1 ~= nil and weed_purple_haze1 ~= nil and weed_og_kush1 ~= nil and weed_amnesia1 ~= nil and weed_ak471 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--##############################################################################################################--
--################################################# Load Anim ##################################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

function RequestAnimationDict(AnimDict)
    RequestAnimDict(AnimDict)
    while not HasAnimDictLoaded(AnimDict) do
        Citizen.Wait(1)
    end
  end
  
  function RequestAnimationDict(ad)
    RequestAnimDict(ad)
    while not HasAnimDictLoaded(ad) do
        Citizen.Wait(1)
    end
  end

--##############################################################################################################--
--############################################### Register Stuff ###############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

RegisterServerEvent('qb-weedshoptarget:server:add:to:register')
AddEventHandler('qb-weedshoptarget:server:add:to:register', function(Price, Note)
    local RandomID = math.random(1111,9999)
    Config.ActivePayments[RandomID] = {['Price'] = Price, ['Note'] = Note}
    TriggerClientEvent('qb-weedshoptarget:client:sync:register', -1, Config.ActivePayments)
end)

RegisterServerEvent('qb-weedshoptarget:server:pay:receipt')
AddEventHandler('qb-weedshoptarget:server:pay:receipt', function(Price, Note, Id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney('cash', Price, 'weedshop') then
        if Config.ActivePayments[tonumber(Id)] ~= nil then
            Config.ActivePayments[tonumber(Id)] = nil
            
            TriggerEvent('qb-weedshoptarget:give:receipt:to:workers', Note, Price)
            TriggerClientEvent('qb-weedshoptarget:client:sync:register', -1, Config.ActivePayments)
            TriggerEvent("qb-bossmenu:server:addAccountMoney", "weedshop", Price)

            TriggerClientEvent('QBCore:Notify', src, 'You paid $'..Price..'.' , "success")
        else
            TriggerClientEvent('QBCore:Notify', src, 'Error..', "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough cash.', "error")
    end
end)

--##############################################################################################################--
--###################################### Event Without Chance Of Seed ##########################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--

--[[RegisterServerEvent('qb-weedshoptarget:server:OGKushPick')
AddEventHandler('qb-weedshoptarget:server:OGKushPick', function(Area, Coral, Bool)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem("weed_og_kush", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weed_og_kush"], "add")
end)]]

--##############################################################################################################--
--############################################## Sorry I Was Bored #############################################--
--################################################## Pluto ❤ ##################################################--
--##############################################################################################################--
