--- Disable idle Camera 

CreateThread(function()
    while true do
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()
        Wait(29000) --The idle camera activates after 30 second so we don't need to call this per frame
    end
end)

-- Rockstar Editor

RegisterCommand("record", function(source , args)
    StartRecording(1)
    QBCore.Functions.Notify("Started Recording!", "success")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify("Saved Recording!", "success")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify("Deleted Recording!", "error")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify("Later aligator!", "error")
end)

--- Disable Weird Run after Shooting 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) then
            if IsPedUsingActionMode(ped) then
                SetPedUsingActionMode(ped, -1, -1, 1)
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

-- Controller Aimbot

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local id = PlayerId()
        local weapon = GetSelectedPedWeapon(ped)

        if (GetWeaponDamageType(weapon) ~= 2) then
            SetPlayerLockon(id, false)
        else
            SetPlayerLockon(id, true)
        end
        Wait(10)
    end
end)

-- Fix for Acidedently Punching

local canFight = false
Citizen.CreateThread(function()
    while true do
    if canFight == false then
        DisableControlAction(0,24,true)
    end
    if IsControlPressed(0, 25) then
        canFight = true
    end
    if IsControlJustReleased(0, 25) then
        canFight = false
    end
        Wait(1)
    end
end)

-- Mini Map name

function AddTextEntry(key, value)
    Citizen.InvokeNative(GetHashKey('ADD_TEXT_ENTRY'), key, value)
    end
    
    CreateThread(function()
    AddTextEntry('FE_THDR_GTA0', 'HighPixel.City')
    end)

