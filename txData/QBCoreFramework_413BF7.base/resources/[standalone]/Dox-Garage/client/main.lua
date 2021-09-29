-- Dox Shop https://discord.gg/wQBuB3U5Ym
-- Dox Shop https://discord.gg/wQBuB3U5Ym
-- Dox Shop https://discord.gg/wQBuB3U5Ym
-- Dox Shop https://discord.gg/wQBuB3U5Ym


QBCore = nil
local PlayerData = {}
local pedspawned = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     PlayerJob = job
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.Pedlocation) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cords - pos)
			
			if dist < 40 and pedspawned == false then
				TriggerEvent('spawn:ped',v.Cords,v.h)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('spawn:ped')
AddEventHandler('spawn:ped',function(coords,heading)
	local hash = GetHashKey('ig_trafficwarden')
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawned = true
	npc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(npc, true)
	SetEntityInvincible(npc, true)
	SetBlockingOfNonTemporaryEvents(npc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	while not TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent('dox:garage')
AddEventHandler('dox:garage', function(pd)
    local vehicle = pd.vehicle
    local coords = { ['x'] = 458.95, ['y'] = -993.23, ['z'] = 25.377454, ['h'] = 0 }
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "LEO"..tostring(math.random(1000, 9999)))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        SetEntityHeading(veh, coords.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)     
end)

RegisterNetEvent('dox:storecar')
AddEventHandler('dox:storecar', function()
    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)



RegisterNetEvent('garage:menu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Police Garage",
            txt = ""
        },
        {
            id = 2,
            header = "Charger",
            txt = "Police Charger",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polchar',
                    
                }
            }
        },
        {
            id = 3,
            header = "Crown Vic",
            txt = "Police Crown Vic",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polvic',
                    
                }
            }
        },
        {
            id = 4,
            header = "Raptor",
            txt = "Police Raptor",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'polraptor',
                    
                }
            }
        },
        {
            id = 5,
            header = "Taurus",
            txt = "Police Taurus",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'poltaurus',
                    
                }
            }
        },
        {
            id = 6,
            header = "Mustang",
            txt = "Police Mustang",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = '2015polstang',
                    
                }
            }
        },
        {
            id = 7,
            header = "Corvette",
            txt = "Police Corvette",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolvette',
                    
                }
            }
        },
        {
            id = 8,
            header = "Challanger",
            txt = "Police Challanger",
            params = {
                event = "dox:garage",
                args = {
                    vehicle = 'npolchal',
                    
                }
            }
        },
        {
            id = 9,
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "dox:storecar",
                args = {
                    
                }
            }
        },
        
    })
end)


