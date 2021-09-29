local scenes = {}

RegisterNetEvent('zd-scenes:fetch', function()
    local src = source
    TriggerClientEvent('zd-scenes:send', src, scenes)
end)

RegisterNetEvent('zd-scenes:add', function(coords, message, color, distance)
    table.insert(scenes, {
        message = message,
        color = color,
        distance = distance,
        coords = coords
    })
    TriggerClientEvent('zd-scenes:send', -1, scenes)
    TriggerEvent('zd-scenes:log', source, message, coords)
end)

RegisterNetEvent('zd-scenes:delete', function(key)
    table.remove(scenes, key)
    TriggerClientEvent('zd-scenes:send', -1, scenes)
end)


RegisterNetEvent('zd-scenes:log', function(id, text, coords)
    local f, err = io.open('sceneLogging.txt', 'a')
    if not f then return print(err) end
    f:write('Player: ['..id..'] Placed Scene: ['..text..'] At Coords = '..coords..'\n')
    f:close()
end)