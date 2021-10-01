RegisterCommand('liv', function(source, args)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local liveryID = tonumber(args[1])
    local livCount = GetVehicleLiveryCount(veh)

    if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" then
        if livCount > 0 then
            SetVehicleLivery(veh, liveryID)
        else
            SetVehicleMod(veh, 48, liveryID, false)
        end
    else
        QBCore.Functions.Notify('You must be a LEO/EMS to change Liveries!', 'error')
    end
end, false)

RegisterCommand('extrall', function(source, args)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local liveryID = tonumber(args[1])
    local livCount = GetVehicleLiveryCount(veh)

    if PlayerData.job.name == "police" then
        SetVehicleAutoRepairDisabled(veh, true)
        SetVehicleExtra(veh, 1, toggle)
        SetVehicleExtra(veh, 2, toggle)
        SetVehicleExtra(veh, 3, toggle)
        SetVehicleExtra(veh, 4, toggle)
        SetVehicleExtra(veh, 5, toggle)                
        SetVehicleExtra(veh, 6, toggle)
        SetVehicleExtra(veh, 7, toggle)
        SetVehicleExtra(veh, 8, toggle)
        SetVehicleExtra(veh, 9, toggle)                                
        SetVehicleExtra(veh, 10, toggle)
        SetVehicleExtra(veh, 11, toggle)
        SetVehicleExtra(veh, 12, toggle)
        SetVehicleExtra(veh, 13, toggle)
        SetVehicleExtra(veh, 14, toggle)
        SetVehicleExtra(veh, 15, toggle)
        SetVehicleExtra(veh, 16, toggle)
        SetVehicleExtra(veh, 17, toggle)
        SetVehicleExtra(veh, 18, toggle)
        SetVehicleExtra(veh, 19, toggle)
        SetVehicleExtra(veh, 20, toggle)
    else
        QBCore.Functions.Notify('You must be a LEO/EMS to change Liveries!', 'error')
    end
end, false)