QBCore.Commands.Add('ooc', 'OOC Chat Message', {}, false, function(source, args)
    local src = source
    local message = table.concat(args, ' ')
    local Players = QBCore.Functions.GetPlayers()
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Players) do
        if v == src then
            TriggerClientEvent('chat:addMessage', v, 'OOC ' .. GetPlayerName(src), 'normal', message)
        elseif #(GetEntityCoords(GetPlayerPed(src)) -
            GetEntityCoords(GetPlayerPed(v))) < 20.0 then
            TriggerClientEvent('chat:addMessage', v, 'OOC ' .. GetPlayerName(src), 'normal', message)
        elseif QBCore.Functions.HasPermission(v, 'admin') then
            if QBCore.Functions.IsOptin(v) then
                TriggerClientEvent('chat:addMessage', v, 'Proximity OOC ' .. GetPlayerName(src), 'normal', message)
                TriggerEvent('qb-log:server:CreateLog', 'ooc', 'OOC', 'white', '**' .. GetPlayerName(src) .. '** (CitizenID: ' ..Player.PlayerData.citizenid .. ' | ID: ' .. src ..') **Message:** ' .. message, false)
            end
        end
    end
end, 'user')