local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttemps = 0
local cokepicking = false
local cokeprocess = false
local nearDealer = false

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


exports['qb-target']:AddBoxZone("grindleaves", vector3(1116.81, -1240.81, 16.42), 0.5, 0.5, {
	name="grindleaves",
    heading=0,
	debugPoly=false,
	}, {
		options = {
			{
            	type = "server",
            	event = "qb-coke:server:grindleaves",
				icon = "fas fa-mortar-pestle",
				label = "Grind Coke",
			},
		},
		distance = 3.5
})

Citizen.CreateThread(function()
    while true do
        local inRange = false

        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

        local distance1 = #(PlayerPos - vector3(-599.64, 2910.9, 16.58))
        local distance2 = #(PlayerPos - vector3(-602.85, 2913.9, 16.01))
        local distance3 = #(PlayerPos - vector3(-606.83, 2914.9, 15.58))
        
        if distance1 < 15 then
            inRange = true

            if distance1 < 2 then
                DrawText3Ds(-599.64, 2910.9, 16.58, "[G] Start Picking")
                if IsControlJustPressed(0, 47) then
                    PrepareAnim()
                    PickMinigame()
                end
            end

            if distance2 < 2 then
                DrawText3Ds(-602.85, 2913.9, 16.01, "[G] Start Picking")
                if IsControlJustPressed(0, 47) then
                    PrepareAnim()
                    PickMinigame()
                end
            end

            if distance3 < 2 then
                DrawText3Ds(-606.83, 2914.9, 15.58, "[G] Start Picking")
                if IsControlJustPressed(0, 47) then
                    PrepareAnim()
                    PickMinigame()
                end
            end
            
        end

        if not inRange then
            Citizen.Wait(2000)
        end
        Citizen.Wait(3)
    end
end)


exports['qb-target']:AddBoxZone("processCrack", vector3(1122.7, -1232.47, 16.42), 8.2, 1.2, {
	name="processCrack",
    heading=308,
	debugPoly=false,
	}, {
		options = {
			{
            	type = "server",
            	event = "qb-coke:server:processCrack",
				icon = "fas fa-box",
				label = "Process Coke",
			},
		},
		distance = 3.5
})

RegisterNetEvent('qb-coke:client:grindleavesMinigame')
AddEventHandler('qb-coke:client:grindleavesMinigame', function(source)
    PrepareProcessAnim()
    ProcessMinigame(source)
end)

RegisterNetEvent('qb-coke:client:processCrack')
AddEventHandler('qb-coke:client:processCrack', function(source)
    ProcessCrackMinigame(source)
end)

function pickProcess()
    QBCore.Functions.Progressbar("grind_coke", "Picking Coca Leaves ..", math.random(15000,60000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-coke:server:getleaf")
        ClearPedTasks(PlayerPedId())
        cokepicking = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function cokeProcess()
    QBCore.Functions.Progressbar("grind_coke", "Process Coke Leaves ..", math.random(10000, 12000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-coke:server:getcoke")
        ClearPedTasks(PlayerPedId())
        cokepicking = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function crackProcess()
    QBCore.Functions.Progressbar("grind_coke", "Process Crack ..", math.random(10000, 12000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-coke:server:getcrack")
        ClearPedTasks(PlayerPedId())
        cokepicking = false
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Process Canceled", "error")
    end)
end

function PickMinigame()
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(3, 5)
        -- NeededAttempts = 1
    end

    local maxwidth = 30
    local maxduration = 3500

    Skillbar.Start({
        duration = math.random(2000, 3000),
        pos = math.random(10, 30),
        width = math.random(20, 30),
    }, function()

        if SucceededAttempts + 1 >= NeededAttempts then
            pickProcess()
            QBCore.Functions.Notify("You picked a coca leaf", "success")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(2000, 3000),
                pos = math.random(10, 30),
                width = math.random(20, 30),
            })
        end
                
        
	end, function()

            QBCore.Functions.Notify("You messed up the coca leaf!", "error")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
            cokepicking = false
       
    end)
end

function ProcessMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(3, 5)
        -- NeededAttempts = 1
    end

    local maxwidth = 30
    local maxduration = 3000

    Skillbar.Start({
        duration = math.random(2000, 3000),
        pos = math.random(10, 30),
        width = math.random(20, 30),
    }, function()

        if SucceededAttempts + 1 >= NeededAttempts then
            cokeProcess()
            QBCore.Functions.Notify("You make some coke!", "success")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(2000, 3000),
                pos = math.random(10, 30),
                width = math.random(20, 30),
            })
        end
                
        
	end, function()

            QBCore.Functions.Notify("You messed up the process!", "error")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
            cokeprocess = false
       
    end)
end

function ProcessCrackMinigame(source)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(3, 4)
        -- NeededAttempts = 1
    end

    local maxwidth = 30
    local maxduration = 3500

    Skillbar.Start({
        duration = math.random(2000, 3000),
        pos = math.random(10, 30),
        width = math.random(20, 30),
    }, function()

        if SucceededAttempts + 1 >= NeededAttempts then
            crackProcess()
            QBCore.Functions.Notify("You make some crack!", "success")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(2000, 3000),
                pos = math.random(10, 30),
                width = math.random(20, 30),
            })
        end
                
        
	end, function()

            QBCore.Functions.Notify("You messed up the process!", "error")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
            cokeprocess = false
       
    end)
end

function PrepareProcessAnim()
    local ped = PlayerPedId()
    LoadAnim('mini@repair')
    TaskPlayAnim(ped, 'mini@repair', 'fixing_a_ped', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    PreparingProcessAnimCheck()
end

function PreparingProcessAnimCheck()
    cokeprocess = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()

            if cokeprocess then
                -- if not TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true) then
                --     TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                -- end
            else
                ClearPedTasksImmediately(ped)
                break
            end

            Citizen.Wait(200)
        end
    end)
end

function PrepareAnim()
    local ped = PlayerPedId()
    -- LoadAnim('amb@prop_human_bbq@male@idle_a')
    -- TaskPlayAnim(ped, 'amb@prop_human_bbq@male@idle_a', 'idle_b', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    PreparingAnimCheck()
end

function ProcessPrepareAnim()
    local ped = PlayerPedId()
    LoadAnim('amb@prop_human_bbq@male@idle_a')
    TaskPlayAnim(ped, 'amb@prop_human_bbq@male@idle_a', 'idle_b', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
    -- TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    PreparingAnimCheck()
end

function PreparingAnimCheck()
    cokepicking = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()

            if cokepicking then
                -- if not TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true) then
                --     TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                -- end
            else
                ClearPedTasksImmediately(ped)
                break
            end

            Citizen.Wait(200)
        end
    end)
end

function knockDealerDoor()
    local hours = GetClockHours()
    local min = 9
    local max = 21

    if hours >= min and hours <= max then
        knockDoorAnim(true)
    else
        knockDoorAnim(false)
    end
end

function knockDoorAnim(home)
    local knockAnimLib = "timetable@jimmy@doorknock@"
    local knockAnim = "knockdoor_idle"
    local PlayerPed = PlayerPedId()
    local myData = QBCore.Functions.GetPlayerData()

    if home then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
        Citizen.Wait(100)
        while (not HasAnimDictLoaded(knockAnimLib)) do
            RequestAnimDict(knockAnimLib)
            Citizen.Wait(100)
        end
        knockingDoor = true
        TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3500)
        TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
        knockingDoor = false
        Citizen.Wait(1000)
        dealerIsHome = true
        -- TriggerEvent("chatMessage", "Dealer Johnny", "normal", 'Yo '..myData.charinfo.firstname..', damn you got ')
        TriggerServerEvent("qb-coke:server:cokesell")

        -- knockTimeout()
    else
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
        Citizen.Wait(100)
        while (not HasAnimDictLoaded(knockAnimLib)) do
            RequestAnimDict(knockAnimLib)
            Citizen.Wait(100)
        end
        knockingDoor = true
        TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
        Citizen.Wait(3500)
        TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
        knockingDoor = false
        Citizen.Wait(1000)
        QBCore.Functions.Notify('It seems that no one is home..', 'error', 3500)
    end
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(1)
    end
end