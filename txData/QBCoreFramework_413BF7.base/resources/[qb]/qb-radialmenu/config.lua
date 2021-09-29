local isJudge = false
local isPolice = false
local isTow = false
local isTaxi = false
local isMedic = false
local isDead = false
local myJob = "Unemployed"
local isHandcuffed = false
local hasOxygenTankOn = false
local bennyscivpoly = false
local onDuty = false
local inGarage = false
local inDepots = false

rootMenuConfig =  {
    {
        id = "General",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"general:givenum", "drug:sell"}
    },
    {
        id = "House Interaction",
        displayName = "House Interaction",
        icon = "#judge-raid-check-owner",
        enableMenu = function()
            return not isDead
        end,
        subMenus = {"home:setstash", "home:setoutfit", "home:setlogout", "home:givekey", "home:takekey", "home:decorate", "home:lock"}
    },
    {
        id = "Interaction",
        displayName = "Interaction",
        icon = "#general-contact",
        enableMenu = function()
            return not isDead
        end,
        
        subMenus = {"general:cuff", "general:rob", "general:putin", "general:takeout"}
    },
    {
        id = "copDead",
         displayName = "11-A",
         icon = "#police-dead",
         functionName = "police:server:11A",
         enableMenu = function()
            return isPolice -- and onDuty 
          end,
     },
    {    
        id = "Police",
        displayName = "Police Interaction",
        icon = "#police-action",
        enableMenu = function()
             return isPolice --and onDuty
        end,
        subMenus = {"police:mdt", "general:cuff", "police:seizecash", "police:checkvehicle", "police:takedriverlicense", "police:statuscheck", "police:searchplayer", "police:jail", "police:takeoffmask" }
    },
    {    
        id = "PoliceObjects",
        displayName = "Police Objects",
        icon = "#police-action",
        enableMenu = function()
             return isPolice --and onDuty
        end,
        subMenus = {"police:spawn1", "police:spawn2", "police:spawn3", "police:del"}
        },
    {
    id = "Ambulance",
    displayName = "Ambulance",
    icon = "#hospital-amb",
    enableMenu = function()
         return isMedic --and onDuty
    end,
    subMenus = {"medic:status", "medic:revive", "medic:treat"}
},
{
    id = "Stretcher",
    displayName = "Stretcher",
    icon = "#hospital-amb",
    enableMenu = function()
        return  (not isDead and isCloseVeh() and isMedic and not IsPedInAnyVehicle(PlayerPedId(), false))
    end,
    subMenus ={"medic:stretcherspawn", "medic:stretcherremove"}
},
{
    id = "Tow",
    displayName = "Tow",
    icon = "#tow-job",
    enableMenu = function()
         return isTow --and onDuty
    end,
    subMenus = {"tow:togglenpc", "tow:vehicle"}
},
{
    id = "Taxi",
    displayName = "Taxi",
    icon = "#tow-job",
    enableMenu = function()
         return isTaxi --and onDuty
    end,
    subMenus = {"taxi:npc", "taxi-meter", "taxi:startmeter"}
},
    {    
    id = "Escort",
    displayName = "Escort",
    icon = "#general-escort",
    functionName = "police:client:EscortPlayer",
    enableMenu = function()
        return not isDead
    end
    },
    {   
        id = "Vehicle",
        displayName = "Vehicle",
        icon = "#general-car",
        functionName = "vehcontrol:openExternal",
        enableMenu = function()
            return (isPolice and not isDead and IsPedInAnyVehicle(PlayerPedId(), true))
        end,
    },
    {    
        id = "Emotes",
        displayName = "Emotes",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu",
        enableMenu = function()
            return not isDead
        end
    },
    {
        id = "general:parkvehicle",
        displayName = "Park Vehicle",
        icon = "#general-parking",
        functionName = "qb-garages:putingarage",
        enableMenu = function()
            return (not isDead and inGarage and isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "general:garage",
        displayName = "Garage",
        icon = "#general-garage",
        functionName = "qb-garages:takeout",
        enableMenu = function()
            return (not isDead and inGarage and not isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
   {
    
        id = "general:depots",
        displayName = "Depots",
        icon = "#general-keys-give",
        functionName = "qb-garages:takeoutveh:depot",
        enableMenu = function()
            return (not isDead and inDepots and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    } -- add `,` after `}` if you gonna add new button but last button should ended w/o `,`

    -- NOTE
    -- for add a new function button to menu:
    -- {
    --     id = "generalgarage", -- type group id name, can be any name
    --     displayName = "Garage", -- Display Name
    --     icon = "#general-garage", -- Icon, should be with `#` cuz from HTML and check HTML for edits
    --     functionName = "qb-garages:takeout", -- THIS IS THE FUNCTION NAME THAT WILL BE TRIGGERED AFTER CLICKING THE BUTTON
    --     enableMenu = function()
    --         return (not isDead and inGarage and not isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false)) -- if person is dead or in vehicle. we don't want dead people to see this button if dead
    --     end
    -- }

    -- for open a new menu from the button:
    -- {
    --     id = "general", -- type group id name, can be any name
    --     displayName = "General", -- Display Name
    --     icon = "#globe-europe", -- Icon, should be with `#` cuz from HTML and check HTML for edits
    --     enableMenu = function()
    --         return not isDead -- if person is dead or in vehicle. we don't want dead people to see this button if dead
    --     end,
    --     subMenus = {"general:escort", "general:emotes", "general:putinvehicle", "general:unseatnearest"} -- add submenu names that will be shown after clicking General button
    -- }

    -- NOTE
    -- EXAMPLE:
    -- {
    --     id = "copDead",
    --     displayName = "11-A",
    --     icon = "#police-dead",
    --     enableMenu = function()
    --         return isPolice and isDead and onDuty -- here button checks if person is cop and dead and on duty. if 3 of them true then this will be shown
    --     end,
    --     subMenus = {"general:escort", "general:emotes", "general:putinvehicle", "general:unseatnearest"}
    -- }
}

newSubMenus = { -- NOTE basicly, what will be happen after clicking these buttons and icon of them
    ['general:givenum'] = {
        title = "Give contact",
        icon = "#general-contact",
        functionName = "qb-phone:client:GiveContactDetails" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    },    
    ['general:rob'] = {
        title = "Rob",
        icon = "#general-contact",
        functionName = "police:client:RobPlayer" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    },   
    ['drug:sell'] = {
        title = "Cornersell",
        icon = "#general-drug",
        functionName = "qb-drugs:client:cornerselling"
    },
    ['general:putinvehicle'] = {
        title = "Seat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:server:PutPlayerInVehicle"
    },
    ['general:cuff'] = {
        title = "Cuff",
        icon = "#general-cuff",
        functionName = "police:client:CuffPlayer"
    },
    ['general:putin'] = {
        title = "Put In Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:client:PutPlayerInVehicle"
    },
    ['general:takeout'] = {
        title = "Take Out Vehicle",
        icon = "#general-unseat-nearest",
        functionName = "police:client:SetPlayerOutVehicle"
    },
    --  POLICE 
    ['police:statuscheck'] = {
        title = "Status Check",
        icon = "#police-checkplayerstatus",
        functionName = "hospital:client:CheckStatus"
    },
    ['police:searchplayer'] = {
        title = "Search player",
        icon = "#police-search",
        functionName = "police:client:SearchPlayer"
    },
    ['police:jail'] = {
        title = "Jail Player",
        icon = "#police-jail",
        functionName = "police:client:JailPlayer"
    },
    ['police:seizecash'] = {
        title = "Seize Cash",
        icon = "#police-seize",
        functionName = "police:client:SeizeCash"
    },
    ['police:bill'] = {
        title = "Bill",
        icon = "#general-cuff",
        functionName = "police:client:BillPlayer"
    },  
    ['police:mdt'] = {
        title = "MDT",
        icon = "#mdt",
        functionName = "police:client:viewmdt"    
    },
    ['police:takeoffmask'] = {
        title = "Mask",
        icon = "#cuffs-remove-mask",
        functionName = "police:client:takeoffmask" 
    },
    ['police:checkvehicle'] = {
        title = "Check Vehicle Status",
        icon = "#police-chechvehiclestatus",
        functionName = "qb-tunerchip:server:TuneStatus"     
    },  
    ['police:takedriverlicense'] = {
        title = "Revoke Drivers License",
        icon = "#police-revokelicense",
        functionName = "police:client:SeizeDriverLicense"     
    },  
    -- POLICE
    ['police:spawn1'] = {
        title = "Cone",
        icon = "#police-revokelicense",
        functionName = "police:client:spawnCone"     
    },   
['police:spawn2'] = {
    title = "Spikes",
    icon = "#police-revokelicense",
    functionName = "police:client:SpawnSpikeStrip" 
},
    ['police:del'] = {
        title = "Delete",
        icon = "#police-revokelicense",
        functionName = "police:client:deleteObjectw"     
    },
    -- HOSPITAL
    ['medic:status'] = {
        title = "StatusCheck",
        icon = "#general-cuff",
        functionName = "" 
    },
    ['medic:revive'] = {
        title = "Revive",
        icon = "#hospital-revivep",
        functionName = "hospital:client:RevivePlayer"
    },
    ['medic:treat'] = {
        title = "Heal wounds",
        icon = "#hospital-treat",
        functionName = "hospital:client:TreatWounds"
    },
    ['medic:stretcherspawn'] = {
        title = "Stretcher",
        icon = "#general-cuff",
        functionName = "hospital:client:TakeStretcher" 
    }, 
    ['medic:stretcherremove'] = {
        title = "Stretcher Remove",
        icon = "#general-cuff",
        functionName = "hospital:client:RemoveStretcher" 
    },  --TOW --TOW
    ['tow:togglenpc'] = {
        title = "Toggle Npc",
        icon = "#tow-mission",
        functionName = "jobs:client:ToggleNpc"
    }, 
    ['tow:vehicle'] = {
        title = "Tow vehicle",
        icon = "#tow-tow",
        functionName = "qb-tow:client:TowVehicle"
    },  -- Taxi
    ['taxi-meter'] = {
        title = "Toggle Meter",
        icon = "#tow-mission",
        functionName = "qb-taxi:client:toggleMeter"
    }, 
    ['taxi:npc'] = {
        title = "Taxi mission",
        icon = "#tow-tow",
        functionName = "qb-taxi:client:DoTaxiNpc"
    },  
    ['taxi:startmeter'] = {
        title = "Start/Stop meter",
        icon = "#tow-tow",
        functionName = "qb-taxi:client:enableMeter"
    },
    ['set:extra'] = {
        title = "Exra",
        icon = "#tow-tow",
        functionName = "qb-radialmenu:client:setExtra"
    },
    --House
    ['home:setstash'] = {
        title = "Set Stash",
        icon = "#cocaine-crate",
        functionName = "qb-houses:client:setLocationStash"
    },
    ['home:setoutfit'] = {
        title = "Set Outfit",
        icon = "#blips-clothing",
        functionName = "qb-houses:client:setLocationOutfit"
    },
    ['home:setlogout'] = {
        title = "Set Logout",
        icon = "#general-takeout",
        functionName = "qb-houses:client:setLocationLogout"
    },
    ['home:givekey'] = {
        title = "Give Home Key",
        icon = "#general-apart-givekey",
        functionName = "qb-houses:client:giveHouseKey"
    },
    ['home:takekey'] = {
        title = "Take Home Key",
        icon = "#general-apart-givekey",
        functionName = "qb-houses:client:removeHouseKey"
    },
    ['home:lock'] = {
        title = "Lock/Unlock Home",
        icon = "#cuffs-cuff",
        functionName = "qb-houses:client:toggleDoorlock"
    }, --[[]
    ['home:decorate'] = {
        title = "Decorate House",
        icon = "#police-check",
        functionName = "qb-houses:client:decorate"
    }, ]]--

-- VEHICLE
    ['vehicle:extra1'] = {
        title = "Toggle Extra 1",
        icon = "#general-car",
        functionName = "extra1"
    },
    ['vehicle:extra2'] = {
        title = "Toggle Extra 2",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['vehicle:extra3'] = {
        title = "Toggle Extra 3",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['vehicle:extra4'] = {
        title = "Toggle Extra 4",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['vehicle:extra5'] = {
        title = "Toggle Extra 5",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['vehicle:extra6'] = {
        title = "Toggle Extra 6",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['vehicle:extra7'] = {
        title = "Toggle Extra 7",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
    ['vehicle:extra8'] = {
        title = "Toggle Extra 8",
        icon = "#general-car",
        functionName = "qb-houses:client:toggleDoorlock"
    },
}
    

RegisterNetEvent("isJudge") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff") -- opposite of the above
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("isTow") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTow", function()
    isTow = true
end)

RegisterNetEvent("isTowOff") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTowOff", function()
    isTow = false
end)

RegisterNetEvent("isTaxi") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTaxi", function()
    isTaxi = true
end)

RegisterNetEvent("isTaxiOff") -- opposite of the above
AddEventHandler("isTaxiOff", function()
    isTaxi = false
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate") -- dont edit this unless you don't use qb-core
AddEventHandler("QBCore:Client:OnJobUpdate", function(jobInfo)
    myJob = jobInfo.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if isTow and myJob ~= "tow" then isTow = false end
    if isTaxi and myJob ~= "taxi" then isTaxi = false end
    if myJob == "police" then isPolice = true end
    if myJob == "tow" then isTow = true end
    if myJob == "taxi" then isTaxi = true end
    if myJob == "ambulance" then isMedic = true end
end)

RegisterNetEvent('QBCore:Client:SetDuty') -- dont edit this unless you don't use qb-core
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    myJob = QBCore.Functions.GetPlayerData().job.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if myJob == "police" then isPolice = true onDuty = duty end
    if myJob == "ambulance" then isMedic = true onDuty = duty end
end)

RegisterNetEvent('deathcheck') -- YOU SHOULD ADD THIS IN YOUR ambulancejob system, basically let the function trigger here when the ped playing anim and add this to
-- your revived function so everytime if person dies, this will be triggered to isDead = true, if he get revived this will be triggered to isDead = false
AddEventHandler('deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)

RegisterNetEvent('police:server:11A')
AddEventHandler('police:server:11A', function()
    local playerPed = GetPlayerPed(player)
    local plyCoords = GetEntityCoords(playerPed)
    local pos = GetEntityCoords(PlayerPedId())

local data = {displayCode = '10-99', dispatchCode = officerdown, blipSprite = 653, blipColour = 84, blipScale = 1.5, description = 'Officer Down', isImportant = 1, recipientList = {'police', 'ambulance'}, length = '10000', infoM = 'fa-info-circle', info = 'Officer in Distress'}
local dispatchData = {dispatchData = data, caller = 'Panic Button', coords = pos}
TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 1, "policepanic", 0.8)
TriggerServerEvent('wf-alerts:svNotify', dispatchData)
end)


RegisterNetEvent("police:currentHandCuffedState") -- add this your police:client:GetCuffed @qb-policejob\client\interactions.lua
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed)
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank") -- add this to your oxygentank wear place, idk where is this for qb-inventory so find out please
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)


RegisterNetEvent('police:client:PutInVehicle')
AddEventHandler('police:client:PutInVehicle', function()
    if isEscorted then
    end
end)

RegisterNetEvent('police:client:viewmdt')
AddEventHandler('police:client:viewmdt', function()
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if not isVisible and IsPedInAnyPoliceVehicle(playerPed) and GetEntitySpeed(playerVeh) < 5.0 then
            if GetVehicleNumberPlateText(getVehicleInFront()) then
                TriggerServerEvent("mdt:performVehicleSearchInFront", GetVehicleNumberPlateText(getVehicleInFront()))
            else
                TriggerServerEvent("mdt:hotKeyOpen")
            end
        elseif not IsPedInAnyPoliceVehicle(playerPed) then
            TriggerServerEvent("mdt:hotKeyOpen")
        end
        if DoesEntityExist(playerPed) and IsPedUsingActionMode(playerPed) then -- disable action mode/combat stance when engaged in combat (thing which makes you run around like an idiot when shooting)
            SetPedUsingActionMode(playerPed, -1, -1, 1)
        end
end)

