QBCore = exports['qb-core']:GetCoreObject()
local pet, bowlObj, activePet,illness
local petHealth, petFood = 100, 300
local petMoving, stay, feeding, ballThrown, chasing, searching = false, false, false, false, false, false
local petSpeed = 8.0
local attacking = false
local petShopSpawned,vetSpawned = false, false
local petShopNPC, vet
local petName = 'Pet'

PlayerJob = {}
RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(response)
    PlayerJob = response
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)


-- On player spawn, set relationship to all pets
AddEventHandler('playerSpawned', function()
    local Player = PlayerPedId()
    AddRelationshipGroup('OWNER')
    SetPedRelationshipGroupHash(Player,GetHashKey('OWNER'))
end)


-- Spawn NPC When you get close, delete when you leave
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            local pedCoords = GetEntityCoords(PlayerPedId()) 
            local spawnCoords = vector3(563.76,2753.27,41.88)
            local dst = #(spawnCoords - pedCoords)
            
            if dst < 100 and petShopSpawned == false then
                TriggerEvent('gl-pets:spawnPed',spawnCoords,178.33)
                petShopSpawned = true
            end
            if dst >= 101  then
                petShopSpawned = false
                DeleteEntity(petShopNPC)
            end
    end
end)
-- Spawn NPC
RegisterNetEvent('gl-pets:spawnPed')
AddEventHandler('gl-pets:spawnPed',function(coords,heading)
    local hash = GetHashKey('a_f_y_soucent_03')
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do 
        Wait(10)
    end

    petShopNPC = CreatePed(5, hash, coords, heading, false, false)
    FreezeEntityPosition(petShopNPC, true)
    SetEntityInvincible(petShopNPC, true)
    SetBlockingOfNonTemporaryEvents(petShopNPC, true)
    SetModelAsNoLongerNeeded(hash)
    exports['qb-target']:AddEntityZone('petShopNPC', petShopNPC, {
            name="petShopNPC",
            debugPoly=false,
            useZ = true
                }, {
                options = {
                    {
                    event = "gl-pets:petStore",
                    icon = "far fa-comment",
                    label = "Open Shop",
                    },                                     
                },
                    job = {"all"},
                    distance = 2.5
                })  

end)


-- Spawn VET NPC When you get close, delete when you leave
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
            local pedCoords = GetEntityCoords(PlayerPedId()) 
            local spawnCoords = vector3(-1565.74,-969.45,12.03)
            local dst = #(spawnCoords - pedCoords)
            
            if dst < 100 and vetSpawned == false then
                TriggerEvent('gl-pets:spawnVet',spawnCoords,227.0)
                vetSpawned = true
            end
            if dst >= 101  then
                vetSpawned = false
                DeleteEntity(vet)
            end
    end
end)
-- Spawn NPC
RegisterNetEvent('gl-pets:spawnVet')
AddEventHandler('gl-pets:spawnVet',function(coords,heading)
    local hash = GetHashKey('s_f_y_sweatshop_01')
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do 
        Wait(10)
    end

    vet = CreatePed(5, hash, coords, heading, false, false)
    FreezeEntityPosition(vet, true)
    SetEntityInvincible(vet, true)
    SetBlockingOfNonTemporaryEvents(vet, true)
    SetModelAsNoLongerNeeded(hash)
    exports['qb-target']:AddEntityZone('vet', vet, {
            name="vet",
            debugPoly=false,
            useZ = true
                }, {
                options = {
                    {
                    event = "gl-pets:healPet",
                    icon = "far fa-comment",
                    label = "Heal Pet",
                    },                  
                    {
                    event = "gl-pets:removePet",
                    icon = "far fa-comment",
                    label = "Abandon Your Pet",
                    },   



                },
                    job = {"all"},
                    distance = 2.5
                })  

end)








Citizen.CreateThread(function()
    RegisterKeyMapping("PetMenu", "Pet Menu", "keyboard", "HOME") 
    RegisterCommand('PetMenu', PetMenu, false)
    TriggerEvent("chat:removeSuggestion", "/PetMenu")
    RegisterKeyMapping("PetAttack", "PetAttack", "keyboard", "G") 
    RegisterCommand('PetAttack', k9Attack, false)
    TriggerEvent("chat:removeSuggestion", "/PetAttack")   
    RegisterKeyMapping("PetSearch", "PetSearch", "keyboard", "H") 
    RegisterCommand('PetSearch', k9Search, false)
    TriggerEvent("chat:removeSuggestion", "/PetSearch")       
end)

local aiming, entity

function k9Search()
    if PlayerJob.name == 'police' then
        if DoesEntityExist(pet) then
        attacking = true
            if IsPlayerFreeAiming(PlayerId()) then
                aiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if (aiming) then
                    if IsEntityAPed(entity) then
                        TaskGoToEntity(pet, entity, -1, 2.0, petSpeed, 1073741824.0, 0)
                        searching = true
                        return entity
                    end
                end
            end
        end
    end

end

function k9Attack()
    if PlayerJob.name == 'police' then
        if DoesEntityExist(pet) then
        attacking = true
            if IsPlayerFreeAiming(PlayerId()) then
                aiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
                if (aiming) then
                    if IsEntityAPed(entity) then
                        SetCanAttackFriendly(pet, true, false)
                        SetPedRelationshipGroupDefaultHash(entity, GetHashKey("CIVMALE"))
                        SetPedRelationshipGroupHash(pet,GetHashKey('COUGAR'))
                        TaskPutPedDirectlyIntoMelee(pet, entity, 0.0, -1.0, 0.0, 0)
                        return entity
                    end
                end
            end
        end
    end

end


RegisterNetEvent('gl-pets:spawnPet')
AddEventHandler('gl-pets:spawnPet',function(modelname)

    if DoesEntityExist(pet) then

        DeleteEntity(pet)

    else

    local playerCoords = GetEntityCoords(PlayerPedId())
    local hash = modelname
    local playerPed = PlayerPedId()
    local playerGroup = GetPedGroupIndex(playerPed)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do
        Wait(10)
    end
    pet = CreatePed(28, hash, playerCoords.x +1, playerCoords.y +1, playerCoords.z -1, 1, 1)
    SetModelAsNoLongerNeeded(hash)
    AddRelationshipGroup('PET')
    AddRelationshipGroup('OWNER')
    SetPedRelationshipGroupHash(pet,GetHashKey('PET'))
    SetPedRelationshipGroupHash(playerPed,GetHashKey('OWNER'))
    SetRelationshipBetweenGroups(0, GetHashKey("PET"), GetHashKey('OWNER'))
    petOut()
    petSickness()
    local petModel = GetEntityModel(pet)
    if petModel == GetHashKey('a_c_pug') or petModel == GetHashKey('a_c_poodle') then
        SitDict = "creatures@pug@amb@world_dog_sitting@idle_a"
        SitAnim = "idle_b"
        BarkDict = "creatures@pug@amb@world_dog_barking@idle_a"
        BarkAnim = "idle_a"
        SleepDict = nil
        SleepAnim = nil
    elseif petModel == GetHashKey('a_c_rottweiler') or petModel == GetHashKey('a_c_husky') or petModel == GetHashKey('a_c_retriever')  or petModel == GetHashKey('a_c_shepherd')  then
        SitDict = "creatures@retriever@amb@world_dog_sitting@idle_a"
        SitAnim = "idle_b"
        BarkDict = "creatures@rottweiler@amb@world_dog_barking@idle_a"
        BarkAnim = "idle_a"
        SleepDict = "creatures@rottweiler@amb@sleep_in_kennel@"
        SleepAnim = "sleep_in_kennel"
    elseif petModel == GetHashKey('a_c_cat_01') then
        SitDict = "creatures@cat@amb@world_cat_sleeping_ground@base"
        SitAnim = "base"
        BarkDict = nil
        BarkAnim = nil
        SleepDict = "creatures@cat@amb@world_cat_sleeping_ground@base"
        SleepAnim = "base"
    elseif petModel == GetHashKey('a_c_rabbit_01') then
        SitDict = nil
        SitAnim = nil
        BarkDict = "creatures@rabbit@amb@world_rabbit_eating@base"
        BarkAnim = "base"
        SleepDict = nil
        SleepAnim = nil
    elseif petModel == GetHashKey('a_c_mtlion') then
        SitDict = "creatures@cougar@amb@world_cougar_rest@base"
        SitAnim = "base"
        BarkDict = nil
        BarkAnim = nil
        SleepDict = nil
        SleepAnim = nil
    elseif petModel == GetHashKey('a_c_hen') then
        SitDict = "creatures@hen@amb@world_hen_standing@idle_a"
        SitAnim = "idle_a"
        BarkDict = "creatures@hen@amb@world_hen_pecking@base"
        BarkAnim = "base"
        SleepDict = nil
        SleepAnim = nil
    elseif petModel == GetHashKey('a_c_westy') then
        SitDict = nil
        SitAnim = nil
        BarkDict = nil
        BarkAnim = nil
        SleepDict = nil
        SleepAnim = nil
    elseif petModel == GetHashKey('a_c_pig') then
        SitDict = nil
        SitAnim = nil
        BarkDict = "creatures@pig@amb@world_pig_grazing@base"
        BarkAnim = "base"
        SleepDict = nil
        SleepAnim = nil

    end
end


end)


RegisterNetEvent('gl-pets:removePet')
AddEventHandler('gl-pets:removePet',function()
    TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'We have taken your pet from you. Monster.', length = 8500})
TriggerServerEvent('gl-pets:removePet')
end)


RegisterNetEvent('gl-pets:useTennisBall')
AddEventHandler('gl-pets:useTennisBall',function()

        local hash = 'prop_tennis_ball'
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-1.0))
        RequestModel(hash)
        while not HasModelLoaded(hash) do Citizen.Wait(0) end
        ballObj = CreateObjectNoOffset(hash, x, y, z, true, false)
        SetModelAsNoLongerNeeded(hash)
        AttachEntityToEntity(ballObj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.15, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- object is attached to right hand 
        local forwardVector = GetEntityForwardVector(PlayerPedId())
        local force = 50.0
        local animDict = "melee@unarmed@streamed_variations"
        local anim = "plyr_takedown_front_slap"
        ClearPedTasks(PlayerPedId())
        while (not HasAnimDictLoaded(animDict)) do
            RequestAnimDict(animDict)
            Citizen.Wait(5)
        end
        TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Wait(500)
        DetachEntity(ballObj)
        ApplyForceToEntity(ballObj,1,forwardVector.x*force,forwardVector.y*force + 5.0,forwardVector.z,0,0,0,0,false,true,true,false,true)
        ballID = ObjToNet(ballObj)
        SetNetworkIdExistsOnAllMachines(ballObj,true)
        ballThrown = true
        chasing = true
        TriggerServerEvent('gl-pets:removeBall')
end)


RegisterNetEvent('gl-pets:petGetIn')
AddEventHandler('gl-pets:petGetIn',function()
vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
TaskWarpPedIntoVehicle(pet,vehicle,-2)

end)

RegisterNetEvent('gl-pets:petGetOut')
AddEventHandler('gl-pets:petGetOut',function()
    vehicle = GetVehiclePedIsIn(pet,false)
    TaskLeaveVehicle(pet,vehicle,16)
end)

RegisterNetEvent('gl-pets:healPet')
AddEventHandler('gl-pets:healPet',function()
local illnessFee = 0

if DoesEntityExist(pet) then



    SetEntityCoords(pet,-1570.3,-966.69,12.84)
    stay = true
    FreezeEntityPosition(pet,true)
    if SleepDict == nil then

    else
        LoadAnimDict(SleepDict)
        TaskPlayAnim(pet, SleepDict, SleepAnim ,8.0, -8, -1, 1, 0, false, false, false)
    end
    TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Your pet is being treated in the other room.', length = 5000})
    Wait(15000)
    stay = false
    SetEntityCoords(pet,-1570.02,-968.1,12.03)
    FreezeEntityPosition(pet,false)
    ClearPedTasks(pet)
    if petHealth < 100 or petSpeed ~= 10.0 then
        if illness == 'fatigue' then
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Your pet was treated for ' .. illness, length = 8500})
            SetEntityHealth(pet,200)
            illness = 'none'
            illnessFee = 100
            petSpeed = 10.0
        elseif illness == 'kennelcough' then
            TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Your pet was healed and treated for ' .. 'Kennel Cough', length = 8500})
            illness = 'none'
            SetEntityHealth(pet,200)
            illnessFee = 300
            petHealth = 100
        end
            TriggerServerEvent('gl-pets:chargeABitch',illnessFee)
    end





else
    TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = 'Where is your pet? I cant treat people', length = 8500})
end
end)


function petSickness()

Citizen.CreateThread(function()
    while true do

        if DoesEntityExist(pet) then       
            if illness == 'none' then
                local chance = math.random(1,100)
                if chance <= Config.IllnessChance then
                    local pick = math.random(1,2)
                    if pick == 1 then
                        illness = 'fatigue'
                    else
                        illness = 'kennelcough'
                    end
                end
            end

        else
            break
        end
    Wait(600000)
    end
end)

end


RegisterNetEvent('gl-pets:k9ItemCheck')
AddEventHandler('gl-pets:k9ItemCheck',function(ItemCheck)
    print('did i trigger')
local found = ItemCheck

print(found)
    if found then
    TriggerEvent('mythic_notify:client:SendAlert', {type = 'inform', text = Config.K9Message, length = 5500})
    LoadAnimDict(BarkDict)
    TaskPlayAnim(pet, BarkDict, BarkAnim ,8.0, -8, -1, 1, 0, false, false, false)
    Wait(5000)
    ClearPedTasks(pet)
else
end


end)



-- Main Pet Loop

function petOut()

Citizen.CreateThread(function()
    while true do

        if DoesEntityExist(pet) then


            --Search a Person
            if searching then
                local dst = #(GetEntityCoords(pet) - GetEntityCoords(entity))
                if dst < 4 then

                    local player, distance = QBCore.Functions.GetClosestPlayer()
                    if distance ~= -1 and distance <= 3.0 then
                            Wait(5000)
                            searching = false
                        TriggerServerEvent('gl-pets:k9Search',GetPlayerServerId(PlayerId()), GetPlayerServerId(player))

                    end

                end
            end

            -- K9 is Attacking
            if attacking then
                if DoesEntityExist(entity) then
                    local entityHealth = GetEntityHealth(entity)
                    if entityHealth <= 140 then
                        attacking = false
                        entity = nil
                        local chance = math.random(1,100)
                        if chance <= Config.IllnessChance then
                            local pick = math.random(1,2)
                            if pick == 1 then
                                illness = 'fatigue'
                            else
                                illness = 'kennelcough'
                            end
                        end
                        SetPedRelationshipGroupHash(pet,GetHashKey('PET'))
                    end

                end

            end



            -- Chase ball if it was thrown
            if ballThrown then
                local speed = GetEntitySpeed(pet)
                local dst3 = #(GetEntityCoords(pet) - GetEntityCoords(ballObj))
                if speed <= 0 then
                TaskGoToEntity(pet, ballObj, -1, 2.0, petSpeed, 1073741824.0, 0)
                stay = false
                feeding = false
                    if dst3 < 2 then
                        DeleteEntity(ballObj)
                        ballThrown = false
                        petMoving = false
                        chasing = false
                        returnBall = true
                    end
                end
            end





            -- If pet has an illness, lower health or other things
            if illness == "fatigue" then
                petSpeed = 1.0
            elseif illness == "kennelcough" then
                petHealth = petHealth -.3
            end



            -- If Health less/equal to 0 then kill pet
            if petHealth <= 0 then
                SetEntityInvincible(pet,false)
                SetEntityHealth(pet,0)
            end

            -- If Pet is Alive, Take Food Away
            if petHealth > 0 then
                if petFood > 0 then
                    petFood = petFood - .5
                    --print(petFood)
                else
                    --If Food is less then 0, Take Health away
                    petHealth = petHealth -.5
                    --print(petHealth)
                end
            end


            -- Feeding & Moving to Bowl
            if feeding and not petMoving then
                petMoving = true
                stay = false
                TaskGoToEntity(pet, bowlObj, -1, 2.0, petSpeed, 1073741824.0, 0)
                local dst2 = #(GetEntityCoords(pet) - GetEntityCoords(bowlObj))
                    if dst2 < 4 then
                        if BarkDict == nil then

                        else
                            LoadAnimDict(BarkDict)
                            TaskPlayAnim(pet, BarkDict, BarkAnim ,8.0, -8, -1, 1, 0, false, false, false)
                        end
                        Wait(5000)
                        DeleteEntity(bowlObj)
                        petFood = 300
                        feeding = false
                        petMoving = false
                        ClearPedTasks(pet)
                    end
            end

            -- Move & Stay
            local dst = #(GetEntityCoords(pet) - GetEntityCoords(PlayerPedId()))
            if dst > 5 and not petMoving and not stay and not feeding and not chasing and not attacking and not searching then
                petMoving = true
                TaskGoToEntity(pet, PlayerPedId(), -1, 1.0, petSpeed, 1073741824.0, 0)
            elseif dst < 5 then
                petMoving = false
                if returnBall then
                    TriggerServerEvent('gl-pets:returnBall')
                    returnBall = false
                end
            end

        else
            break
        end
        Wait(2000)
    end
end)

end


RegisterNetEvent('gl-pets:getOwnedPet')
AddEventHandler('gl-pets:getOwnedPet',function()
    QBCore.Functions.TriggerCallback("gl-pets:getPetSQL", function(cb)
        petInfo = table.unpack(cb)
        if petInfo ~= nil then
            activePet = petInfo.modelname
            petHealth = petInfo.health
            illness = petInfo.illnesses
            petName = petInfo.name
            if activePet then
                TriggerEvent('gl-pets:spawnPet',activePet)
            end
        end
    end)
end)



RegisterNetEvent('gl-pets:feedPet')
AddEventHandler('gl-pets:feedPet',function()
    if not DoesEntityExist(bowlObj) then
        bendAnimation()
        local hash = 'prop_bowl_crisps'
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-1.0))
        RequestModel(hash)
        while not HasModelLoaded(hash) do Citizen.Wait(0) end
        bowlObj = CreateObjectNoOffset(hash, x, y, z, true, false)
        PlaceObjectOnGroundProperly(bowlObj)
        SetModelAsNoLongerNeeded(hash)
        feeding = true
    end
end)


RegisterNetEvent('gl-pets:stay')
RegisterNetEvent('gl-pets:follow')

AddEventHandler('gl-pets:follow',function()
stay = false
attacking = false
entity = nil
ClearPedTasks(pet)
end)

AddEventHandler('gl-pets:stay',function()
stay = true
attacking = false
entity = nil
ClearPedTasks(pet)
LoadAnimDict(SitDict)
TaskPlayAnim(pet,SitDict,SitAnim  ,8.0, -8, -1, 1, 0, false, false, false)

end)


RegisterNetEvent('gl-pets:petStore')
AddEventHandler('gl-pets:petStore',function()

TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Pet Shop",
            txt = "Buy Pet Food" .. " for $" .. Config.FoodPrice,
            params = {
                event = 'gl-pets:buyFood',
            }
        },
        {
            id = 2,
            header = "Purchase a",
            txt = Config.Pet1Label .. " for $" .. Config.Pet1Price,
            params = {
                event = 'gl-pets:buyPet1',
            }
        },
        {
            id = 3,
            header = "Purchase a",
            txt = Config.Pet2Label .. " for $" .. Config.Pet2Price,
            params = {
                event = 'gl-pets:buyPet2',
            }
        },
        {
            id = 4,
            header = "Purchase a",
            txt = Config.Pet3Label .. " for $" .. Config.Pet3Price,
            params = {
                event = 'gl-pets:buyPet3',
            }
        },
        {
            id = 5,
            header = "Purchase a",
            txt = Config.Pet4Label .. " for $" .. Config.Pet4Price,
            params = {
                event = 'gl-pets:buyPet4',
            }
        },
        {
            id = 6,
            header = "Purchase a",
            txt = Config.Pet5Label .. " for $" .. Config.Pet5Price,
            params = {
                event = 'gl-pets:buyPet5',
            }
        },
        {
            id = 7,
            header = "Purchase a",
            txt = Config.Pet6Label .. " for $" .. Config.Pet6Price,
            params = {
                event = 'gl-pets:buyPet6',
            }
        },
        {
            id = 8,
            header = "Purchase a",
            txt = Config.Pet7Label .. " for $" .. Config.Pet7Price,
            params = {
                event = 'gl-pets:buyPet7',
            }
        },
        {
            id = 9,
            header = "Purchase a",
            txt = Config.Pet8Label .. " for $" .. Config.Pet8Price,
            params = {
                event = 'gl-pets:buyPet8',
            }
        },
        {
            id = 10,
            header = "Purchase a",
            txt = Config.Pet9Label .. " for $" .. Config.Pet9Price,
            params = {
                event = 'gl-pets:buyPet9',
            }
        },
        {
            id = 11,
            header = "Purchase a",
            txt = Config.Pet10Label .. " for $" .. Config.Pet10Price,
            params = {
                event = 'gl-pets:buyPet10',
            }
        },
        {
            id = 12,
            header = "Purchase a",
            txt = Config.Pet11Label .. " for $" .. Config.Pet11Price,
            params = {
                event = 'gl-pets:buyPet11',
            }
        },



    })

end)

RegisterNetEvent('gl-pets:buyFood')
AddEventHandler('gl-pets:buyFood',function()
TriggerServerEvent('gl-pets:buyFood',Config.FoodPrice)
end)
RegisterNetEvent('gl-pets:buyPet1')
AddEventHandler('gl-pets:buyPet1',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet1,Config.Pet1Price)
end)
RegisterNetEvent('gl-pets:buyPet2')
AddEventHandler('gl-pets:buyPet2',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet2,Config.Pet2Price)
end)
RegisterNetEvent('gl-pets:buyPet3')
AddEventHandler('gl-pets:buyPet3',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet3,Config.Pet3Price)
end)
RegisterNetEvent('gl-pets:buyPet4')
AddEventHandler('gl-pets:buyPet4',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet4,Config.Pet4Price)
end)
RegisterNetEvent('gl-pets:buyPet5')
AddEventHandler('gl-pets:buyPet5',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet5,Config.Pet5Price)
end)

RegisterNetEvent('gl-pets:buyPet6')
AddEventHandler('gl-pets:buyPet6',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet6,Config.Pet6Price)
end)

RegisterNetEvent('gl-pets:buyPet7')
AddEventHandler('gl-pets:buyPet7',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet7,Config.Pet7Price)
end)
RegisterNetEvent('gl-pets:buyPet8')
AddEventHandler('gl-pets:buyPet8',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet8,Config.Pet8Price)
end)

RegisterNetEvent('gl-pets:buyPet9')
AddEventHandler('gl-pets:buyPet9',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet9,Config.Pet9Price)
end)

RegisterNetEvent('gl-pets:buyPet10')
AddEventHandler('gl-pets:buyPet10',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet10,Config.Pet10Price)
end)


RegisterNetEvent('gl-pets:buyPet11')
AddEventHandler('gl-pets:buyPet11',function()
TriggerServerEvent('gl-pets:buyPet',Config.Pet11,Config.Pet11Price)
end)








RegisterNetEvent('gl-pets:namePet')
AddEventHandler('gl-pets:namePet',function()
local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Name Your Pet", 
    rows = {
        {
            id = 0, 
            txt = "Name"
        },
      
    }
})

    if keyboard ~= nil then
        TriggerServerEvent('gl-pets:updatePetName', keyboard[1].input)
        petName = keyboard[1].input
    end
end)


function PetMenu()

TriggerEvent('gl-pets:petMenu')

end

RegisterNetEvent('gl-pets:petMenu')
AddEventHandler('gl-pets:petMenu',function()

TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Pet Menu",
            txt = ""
        },
        {
            id = 2,
            header = "Commands",
            txt = "Call Pet",
            params = {
                event = 'gl-pets:getOwnedPet',
            }
        },
        {
            id = 3,
            header = "Commands",
            txt = "Dismiss Pet",
            params = {
                event = "gl-pets:dismissPet",
            }
        },
        {
            id = 4,
            header = "Commands",
            txt = "Pet Commands",
            params = {
                event = 'gl-pets:petCommands',
            }
        },
        {
            id = 5,
            header = "Status",
            txt = petName .. "'s Status",
            params = {
                event = 'gl-pets:petStatus',
            }
        },

    })

end)


RegisterNetEvent('gl-pets:petStatus')
AddEventHandler('gl-pets:petStatus',function()

TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = petName .. "'s Status",
            txt = "Go Back",
            params = {
                event = 'gl-pets:petMenu',
            }
        },
        {
            id = 2,
            header = "Health",
            txt = petHealth
        },
        {
            id = 3,
            header = "Food",
            txt = petFood
        },
        {
            id = 4,
            header = "Illnesses",
            txt = illness
        },
        {
            id = 5,
            header = petName,
            txt = 'Rename Your Pet',
            params = {
                event = 'gl-pets:namePet',
            }
        },

    })

end)


RegisterNetEvent('gl-pets:petCommands')
AddEventHandler('gl-pets:petCommands',function()

TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Pet Menu",
            txt = "Back",
            params = {
                event = 'gl-pets:petMenu',
            }
        },
        {
            id = 2,
            header = "Commands",
            txt = "Follow",
            params = {
                event = 'gl-pets:follow',
            }
        },
        {
            id = 3,
            header = "Commands",
            txt = "Stay",
            params = {
                event = "gl-pets:stay",
            }
        },
        {
            id = 4,
            header = "Commands",
            txt = "Feed",
            params = {
                event = "gl-pets:feedPet",
            }
        },
        {
            id = 5,
            header = "Commands",
            txt = "Get In Vehicle",
            params = {
                event = "gl-pets:petGetIn",
            }
        },
        {
            id = 6,
            header = "Commands",
            txt = "Get Out Vehicle",
            params = {
                event = "gl-pets:petGetOut",
            }
        },
    })

end)



RegisterNetEvent('gl-pets:dismissPet')
AddEventHandler('gl-pets:dismissPet',function()

    if DoesEntityExist(pet) then
        TaskWanderStandard(pet,10.0,10)
        SetPedAsNoLongerNeeded(pet)
        Wait(5000)
        DeleteEntity(pet)
        feeding = false
        stay = false
        TriggerServerEvent('gl-pets:updatePet',petHealth,illness)
    end

end)

function bendAnimation()
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
    TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
    Citizen.Wait(5000)
    ClearPedTasksImmediately(PlayerPedId())
end


function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end