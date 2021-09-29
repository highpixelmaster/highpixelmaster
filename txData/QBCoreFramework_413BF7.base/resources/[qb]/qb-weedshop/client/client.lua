local QBCore = nil  

QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent('qb-weedshop:client:pickkog')
AddEventHandler('qb-weedshop:client:pickkog', function()
  local playerPed = PlayerPedId()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("search_register", "Picking OG-Kush marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-weedshop:server:OGKushPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-weedshop:client:pickHaze')
AddEventHandler('qb-weedshop:client:pickHaze', function()
  local playerPed = PlayerPedId()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("search_register", "Picking Purple-Haze marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-weedshop:server:PurpleHazePick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-weedshop:client:pickAK47')
AddEventHandler('qb-weedshop:client:pickAK47', function()
  local playerPed = PlayerPedId()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("search_register", "Picking AK47 marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-weedshop:server:AK47Pick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-weedshop:client:pickSkunk')
AddEventHandler('qb-weedshop:client:pickSkunk', function()
  local playerPed = PlayerPedId()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("search_register", "Picking Skunk marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-weedshop:server:SkunkPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-weedshop:client:pickWidow')
AddEventHandler('qb-weedshop:client:pickWidow', function()
  local playerPed = PlayerPedId()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("search_register", "Picking White-Widow marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-weedshop:server:WhiteWidowPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-weedshop:client:pickAmnesia')
AddEventHandler('qb-weedshop:client:pickAmnesia', function()
  local playerPed = PlayerPedId()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    QBCore.Functions.Progressbar("search_register", "Picking Amnesia marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-weedshop:server:AmnesiaPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)



------------- Payments -------------

RegisterNetEvent('qb-weedshop:openPayment')
AddEventHandler('qb-weedshop:openPayment', function()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenPayment', payments = Config.ActivePayments})
end)

RegisterNetEvent('qb-weedshop:client:openRegister')
AddEventHandler('qb-weedshop:client:openRegister', function()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenRegister'})
end)

RegisterNetEvent('qb-weedshoptarget:client:sync:register')
AddEventHandler('qb-weedshoptarget:client:sync:register', function(RegisterConfig)
  Config.ActivePayments = RegisterConfig
end)

function GetActiveRegister()
  return Config.ActivePayments
end

RegisterNUICallback('Click', function()
  PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
  PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('AddPrice', function(data)
  TriggerServerEvent('qb-weedshoptarget:server:add:to:register', data.Price, data.Note)
end)

RegisterNUICallback('PayReceipt', function(data)
  TriggerServerEvent('qb-weedshoptarget:server:pay:receipt', data.Price, data.Note, data.Id)
end)

RegisterNUICallback('CloseNui', function()
  SetNuiFocus(false, false)
end)

RegisterNetEvent('qb-weedshop:cashRegister')
AddEventHandler('qb-weedshop:cashRegister', function()
    Player = QBCore.Functions.GetPlayerData()
    if Player.job.name == 'weedshop' then
        TriggerEvent('qb-weedshop:client:openRegister')
    else
        TriggerEvent('qb-weedshop:openPayment')
    end
end)

------------- Context -------------

 RegisterNetEvent('weedclock')
AddEventHandler('weedclock', function()
  TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "| WeedShop |",
            txt = ""
        },
        {
            id = 2,
            header = "| Signing On/Off Duty |",
            txt = "| Use this to sign in/off |",
            params = {
                event = "ClockInWeed"
            }
        },
        {
            id = 3,
            header = "| Boss Menu |",
            txt = "| Boss Options |",
            params = {
                event = "qb-weedshop:openbossmenu"
            }
        },
    })
end)

RegisterNetEvent('craftjoint')
AddEventHandler('craftjoint', function()
  TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Joint Crafting ",
            txt = ""
        },
        {
            id = 2,
            header = "OG-Kush Joint",
            txt = "1x OG-Kush 2g | 1x Rolling Paper",
            params = {
                event = "qb-weedshop:trigger:OGKushh"
            }
        },
            {
            id = 3,
            header = "Purple-Haze Joint",
            txt = "1x Purple Haze 2g | 1x Rolling Paper",
            params = {
                event = "qb-weedshop:trigger:PurpleHaze"
            }
        },
        {
            id = 4,
            header = "AK47 Joint",
            txt = "1x AK47 2g | 1x Rolling Paper",
            params = {
                event = "qb-weedshop:trigger:AK47"
            }
        },
        {
            id = 5,
            header = "Skunk Joint",
            txt = "1x Skunk 2g | 1x Rolling Paper",
            params = {
                event = "qb-weedshop:trigger:Skunk"
            }
        },
        {
            id = 6,
            header = "White-Widow Joint",
            txt = "1x White Widow 2g | 1x Rolling Paper",
            params = {
                event = "qb-weedshop:trigger:WhiteWidow"
            }
        },
        {
          id = 7,
          header = "Amnesia Joint",
          txt = "1x Amnesia 2g | 1x Rolling Paper",
          params = {
              event = "qb-weedshop:trigger:Amnesia"
          }
        },
        {
        id = 8,
        header = "Hybrid Dab Cart",
        txt = "1x OG-Kush 2g | 1x Purple Haze 2g | 1x AK47 2g | 1x Skunk 2g | 1x White Widow 2g | 1x Amnesia 2g",
        params = {
            event = "qb-weedshop:trigger:dabcart"
        }
        },
    })
end)

------------- Load Anim -------------

function RequestAnimationDict(AnimDict)
  RequestAnimDict(AnimDict)
  while not HasAnimDictLoaded(AnimDict) do
      Citizen.Wait(1)
  end
end

function RequestAnimationDict(ad)
  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do
      Citizen.Wait(1)
  end
end

------------- Blip -------------

Citizen.CreateThread(function()
  local blip = AddBlipForCoord(377.4846, -836.813, 29.291)
  SetBlipSprite(blip, 140)
  SetBlipAsShortRange(blip, true)
  SetBlipScale(blip, 0.5)
  SetBlipColour(blip, 1)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Weed Dispensary")
  EndTextCommandSetBlipName(blip)
end)

------------- Events -------------

RegisterNetEvent("ClockInWeed")
 AddEventHandler("ClockInWeed", function()
     TriggerServerEvent('QBCore:ToggleDuty')
 end)

RegisterNetEvent('qb-weedshop:client:open:cold:storage')
AddEventHandler('qb-weedshop:client:open:cold:storage', function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "WeedShopStash", {maxweight = 1000000, slots = 20})
    TriggerEvent("inventory:client:SetCurrentStash", "WeedShopStash")
  else
    QBCore.Functions.Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-weedshop:client:open:counter')
AddEventHandler('qb-weedshop:client:open:counter', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "WeedShopCounter", {maxweight = 1000000, slots = 6})
    TriggerEvent("inventory:client:SetCurrentStash", "WeedShopCounter")
end)

------------- qbTarget -------------

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedClock", vector3(375.75, -825.00, 30.3022), 1.4, 0.2, {
      name="WeedClock",
      heading=270.0,
      debugPoly=false,
      minZ=29.70,
      maxZ=30.60,
    },{
      options = {
              {
                type = "client",
                event = "weedclock",
                icon = "fas fa-clock",
                label = "Clock In/Out",
                job = "weedshop",
              },
           },
      distance = 2.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedStorage", vector3(374.2817, -825.634, 29.3), 3.0, 0.5, {
      name="WeedStorage",
      heading=270.0,
      debugPoly=false,
      minZ = 25.79,
      maxZ = 30.04,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:open:cold:storage",
                icon = "fas fa-list-alt",
                label = "Weed Shop Storage",
                job = "weedshop",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedCashier", vector3(380.1976, -827.346, 29.3), 0.5, 0.6, {
      name="WeedCashier",
      heading=180.0,
      debugPoly=false,
      minZ=29.0,
      maxZ=29.7,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:cashRegister",
                icon = "fas fa-cash-register",
                label = "Weed Cashregister",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("TablePeople", vector3(378.2, -827.22, 29.3), 3.2, 1.0, {
      name="TablePeople",
      heading=270.0,
      debugPoly=false,
      minZ = 28.79,
      maxZ = 29.40,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:open:counter",
                icon = "fas fa-inbox",
                label = "Products",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("CraftJoints", vector3(375.7926, -824.581, 29.30), 0.7, 0.4, {
      name="CraftJoints",
      heading=270.0,
      debugPoly=false,
      minZ = 29.10,
      maxZ = 29.50,
    },{
      options = {
              {
                type = "client",
                event = "craftjoint",
                icon = "fas fa-inbox",
                label = "Craft Products",
                job = "weedshop",
              },
           },
      distance = 1.5
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant1", vector3(378.12, -813.26, 29.3), 1.0, 1.0, {
      name="WeedShopPlant1",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickkog",
                icon = "fas fa-seedling",
                label = "Pick OG-Kush plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant2", vector3(379.36, -813.27, 29.3), 1.0, 1.0, {
      name="WeedShopPlant2",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickkog",
                icon = "fas fa-seedling",
                label = "Pick OG-Kush plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant3", vector3(380.43, -813.4, 29.3), 1.0, 1.0, {
      name="WeedShopPlant3",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickHaze",
                icon = "fas fa-seedling",
                label = "Pick Purple-Haze plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant4", vector3(382.17, -813.44, 29.3), 1.0, 1.0, {
      name="WeedShopPlant4",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickHaze",
                icon = "fas fa-seedling",
                label = "Pick Purple-Haze plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant5", vector3(383.25, -813.38, 29.3), 1.0, 1.0, {
      name="WeedShopPlant5",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickAK47",
                icon = "fas fa-seedling",
                label = "Pick AK47 plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant6", vector3(382.86, -811.58, 29.3), 1.0, 1.0, {
      name="WeedShopPlant6",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickAK47",
                icon = "fas fa-seedling",
                label = "Pick AK47 plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant7", vector3(381.8, -811.6, 29.3), 1.0, 1.0, {
      name="WeedShopPlant7",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickSkunk",
                icon = "fas fa-seedling",
                label = "Pick Skunk plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant8", vector3(380.64, -811.54, 29.3), 1.0, 1.0, {
      name="WeedShopPlant8",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickSkunk",
                icon = "fas fa-seedling",
                label = "Pick Skunk plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant9", vector3(379.35, -811.56, 29.3), 1.0, 1.0, {
      name="WeedShopPlant9",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickWidow",
                icon = "fas fa-seedling",
                label = "Pick White-Widow plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopPlant10", vector3(378.18, -811.4, 29.3), 1.0, 1.0, {
      name="WeedShopPlant10",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.9,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:client:pickAmnesia",
                icon = "fas fa-seedling",
                label = "Pick Amnesia plant",
                job = "weedshop",
              },
           },
      distance = 1.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShop", vector3(374.5970, -816.187, 30.354), 0.5, 1.3, {
      name="WeedShop",
      heading=180.0,
      debugPoly=false,
      minZ = 28.4,
      maxZ = 29.40,
    },{
      options = {
              {
                type = "client",
                event = "qb-weedshop:storeeprod",
                icon = "fas fa-shopping-basket",
                label = "Enter Weed Store",
                job = "weedshop",
              },
           },
      distance = 1.5
       })
 end)

RegisterNetEvent("qb-weedshop:openbossmenu")
AddEventHandler("qb-weedshop:openbossmenu", function()
  local Player = QBCore.Functions.GetPlayerData()
  if Player.job.grade.level == 2 then
    TriggerServerEvent("qb-bossmenu:server:openMenu")
    else
      QBCore.Functions.Notify("You aren't the boss.");
    end
end)


RegisterNetEvent("qb-weedshop:storeeprod")
AddEventHandler("qb-weedshop:storeeprod", function()
  local Player = QBCore.Functions.GetPlayerData()

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Weed Shop Items", Config.Items)
end)

------------- OGKush -------------

RegisterNetEvent("qb-weedshop:trigger:OGKushh")
AddEventHandler("qb-weedshop:trigger:OGKushh", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:ogkush', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Rolling Up OG-Kush..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_og_kush", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "og_kush", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Rolled Up OG-Kush Joint.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

------------- Purple-Haze -------------

RegisterNetEvent("qb-weedshop:trigger:PurpleHaze")
AddEventHandler("qb-weedshop:trigger:PurpleHaze", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:weed_purple_haze', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Rolling Up Purple-Haze..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_purple_haze", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "purple_haze", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Rolled Up Purple-Haze Joint.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

------------- AK47 -------------

RegisterNetEvent("qb-weedshop:trigger:AK47")
AddEventHandler("qb-weedshop:trigger:AK47", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:weed_ak47', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Rolling Up AK47..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_ak47", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "ak47", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Rolled Up AK47 Joint.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

------------- Skunk -------------

RegisterNetEvent("qb-weedshop:trigger:Skunk")
AddEventHandler("qb-weedshop:trigger:Skunk", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:weed_skunk', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Rolling Up Skunk..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_skunk", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "skunk", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Rolled Up Skunk Joint.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

------------- White-Widow -------------

RegisterNetEvent("qb-weedshop:trigger:WhiteWidow")
AddEventHandler("qb-weedshop:trigger:WhiteWidow", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:white_widow', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Rolling Up White-Widow..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_white_widow", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "white_widow", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Rolled Up White-Widow.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

------------- Amnesia -------------

RegisterNetEvent("qb-weedshop:trigger:Amnesia")
AddEventHandler("qb-weedshop:trigger:Amnesia", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:amnesia', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Rolling Up Amnesia..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_amnesia", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "amnesia", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Rolled Up Amnesia Joint.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

------------- Craft Dab Cart -------------

RegisterNetEvent("qb-weedshop:trigger:dabcart")
AddEventHandler("qb-weedshop:trigger:dabcart", function()
  if QBCore.Functions.GetPlayerData().job.onduty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:getitems:dabcart', function(HasItems)  
    		if HasItems then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          QBCore.Functions.Progressbar("search_register", "Filling Dab Cart With Concentrate..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_white_widow", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_skunk", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_purple_haze", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_og_kush", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_amnesia", 1)
              TriggerServerEvent('QBCore:Server:RemoveItem', "weed_ak47", 1)
              TriggerServerEvent('QBCore:Server:AddItem', "dabcart", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              QBCore.Functions.Notify("Filled Dab Cart With Concentrate.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            QBCore.Functions.Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          QBCore.Functions.Notify('You do not have the required items!', "error")
          end
    end)
      else 
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)