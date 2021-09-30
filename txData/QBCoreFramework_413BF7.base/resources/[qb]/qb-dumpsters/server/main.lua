local DumpsterSearched = {1}
RegisterNetEvent('qb-dumpsters:timer:check', function(Dumpster)
    local src = source
    if HasSearched(Dumpster) then 
        TriggerClientEvent('QBCore:Notify', src, 'It seems like this one has already been searched', 'error', 3000)
    else
        table.insert(DumpsterSearched, Dumpster)
        TriggerClientEvent('qb-dumpsters:search:start', src)
        TriggerEvent('qb-dumpsters:timer:restart', Dumpster)
    end
end)

RegisterNetEvent('qb-dumpsters:timer:restart', function(Dumpster)
    RestartDumpster(Dumpster)
end)

RegisterNetEvent('qb-dumpsters:search:complete', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Chance = math.random(1, 100)
    local Tier = GetTier(Chance)
    local Item = ItemPicker(Tier)
    local Amount = GetAmount(Tier)
    Player.Functions.AddItem(Item, Amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Item], "add")
end)


-- FUNCTIONS
function HasSearched(Dumpster)
    local Has = false
    for i = 1, #DumpsterSearched do 
        if DumpsterSearched[i] == Dumpster then 
            Has = true
        end
    end
    return Has
end

function RestartDumpster(Dumpster)
    Timer = Config.replenishtimer
    while Timer > 0 do
        Timer = Timer - 1
        Wait(60000)
    end

    if Timer == 0 then
        for i = 1, #DumpsterSearched do 
            if DumpsterSearched[i] == Dumpster then 
                table.remove(DumpsterSearched, i)
            end
        end                
    end
end

function GetTier(Chance)
    local Tier = nil
    if Chance <= 80 then
        Tier = 'tier1'
    elseif Chance <= 95 then 
        Tier = 'tier2'
    else
        Tier = 'tier3'
    end
    return Tier
end

function ItemPicker(Tier)
    return Config.loot[Tier][math.random(1, #Config.loot[Tier])]
end

function GetAmount(Tier)
    local Amount = nil
    if Tier == 'tier1' then
        Amount = math.random(1, 5)
    elseif Tier == 'tier2' then 
        Amount = 1
    else
        Amount = 1
    end
    return Amount
end