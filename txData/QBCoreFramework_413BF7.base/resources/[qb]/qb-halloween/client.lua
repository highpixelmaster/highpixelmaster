local zone = 0
local ped
QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()

    for k,v in pairs(Config.Doors) do
        zone = zone+1
        exports['qb-target']:AddBoxZone(zone, v.coords, 2.0, 2.0, {
            name=zone,
            heading=0.0,
            debugPoly=false,
            minZ=v.z,
            maxZ=v.z+10
        }, {
            options = {
                {
                type = "client",
                event = "qb-knock:knockOnDoor",
                icon = "fas fa-door-closed",
                label = "Knock on Door",
                },
            },
              
                distance = 2.5
        })             
    end




 for k, v in pairs(Config.Doors) do
                      
                        HouseBlip = AddBlipForCoord(v.coords)

                        SetBlipSprite (HouseBlip, 484)
                        SetBlipDisplay(HouseBlip, 4)
                        SetBlipScale  (HouseBlip, 0.65)
                        SetBlipAsShortRange(HouseBlip, true)
                        SetBlipColour(HouseBlip, 9)

                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentSubstringPlayerName("Trick or Treat")
                        EndTextCommandSetBlipName(HouseBlip)

                
                    end


end)


RegisterNetEvent('qb-knock:knockOnDoor',function()
    for k,door in pairs(Config.Doors) do 
    local dst = #(GetEntityCoords(PlayerPedId()) - door.coords)
	if not door.looted then
			
        if dst < 3 and not door.looted then
            door.looted = true
            LoadAnimDict("timetable@jimmy@doorknock@")
            TaskPlayAnim(PlayerPedId(), "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 1.0, -1, 17, 0, 0, 0, 0)
            Wait(3000)
            playAnim()
            Wait(300000)
            door.looted = false
		end
		else
            QBCore.Functions.Notify('We dont have anymore candy! Come back soon for more!','error')

end	
end
end)



function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end


function playAnim()
    local hash = GetHashKey(Config.Peds[math.random(#Config.Peds)])
	local zombie = -1404353274
    print(hash)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do 
        Wait(10)
    end
    local PosH = GetEntityHeading(PlayerPedId())
    local Pos = GetEntityCoords(PlayerPedId())
    local frontx = GetEntityForwardX(PlayerPedId())
    local fronty = GetEntityForwardY(PlayerPedId())
    ped = CreatePed(5, hash, Pos.x + (frontx), Pos.y, Pos.z - 1, (PosH - 180), true, false)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    Wait(1000)
    LoadAnimDict("mp_safehouselost@")
    TaskPlayAnim(PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    TaskPlayAnim(ped, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(3000)
    DeleteEntity(ped)
	

    TriggerServerEvent('qb-trickortreak:randomitem')
	
    SetModelAsNoLongerNeeded(hash)
end