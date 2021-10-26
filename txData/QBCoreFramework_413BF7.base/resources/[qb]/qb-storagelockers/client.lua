RegisterNetEvent('qb-stopragelockers:StashAvailability1', function()
	TriggerEvent('nh-context:sendMenu', {
		{
			id = 0,
			header = "Open Locker (With Combo)",
			txt = "",
			params = {
			event = "qb-stopragelockers:Stash1",
			}
		},
	})
end)

RegisterNetEvent('qb-stopragelockers:StashAvailability2', function()
	TriggerEvent('nh-context:sendMenu', {
		{
			id = 0,
			header = "Open Locker (With Combo)",
			txt = "",
			params = {
			event = "qb-stopragelockers:Stash2",
			}
		},
	})
end)

RegisterNetEvent('qb-stopragelockers:StashAvailability3', function()
	TriggerEvent('nh-context:sendMenu', {
		{
			id = 0,
			header = "Open Locker (With Combo)",
			txt = "",
			params = {
			event = "qb-stopragelockers:Stash3",
			}
		},
	})
end)
RegisterNetEvent('qb-stopragelockers:StashAvailability4', function()
	TriggerEvent('nh-context:sendMenu', {
		{
			id = 0,
			header = "Open Locker (With Combo)",
			txt = "",
			params = {
			event = "qb-stopragelockers:Stash4",
			}
		},
	})
end)






RegisterNetEvent('qb-stopragelockers:Stash1', function()
	local keyboard = exports["qb-input"]:ShowInput({
		header = "Enter Combo",
		submitText = "Enter Combo",
		inputs = {
			{
				text = "Combo",
                name = "sl2", -- name of the input should be unique otherwise it might override
				type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
			}
		}
	})
    if keyboard ~= nil then
        for k,v in pairs(keyboard) do
			if v == Config.SL_2 then
				EnterStash2()

			else
				QBCore.Functions.Notify("You entered the wrong lock combo!", "error", 10000)
			end	
		end
    end
end)

RegisterNetEvent('qb-stopragelockers:Stash2', function()
	local keyboard = exports["qb-input"]:ShowInput({
		header = "Enter Combo",
		submitText = "Enter Combo",
		inputs = {
			{
				text = "Combo",
                name = "sl2", -- name of the input should be unique otherwise it might override
				type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
			}
		}
	})
    if keyboard ~= nil then
        for k,v in pairs(keyboard) do
			if v == Config.SL_2 then
				EnterStash2()

			else
				QBCore.Functions.Notify("You entered the wrong lock combo!", "error", 10000)
			end	
		end
    end
end)

RegisterNetEvent('qb-stopragelockers:Stash3', function()
	local keyboard = exports["qb-input"]:ShowInput({
		header = "Enter Combo",
		submitText = "Enter Combo",
		inputs = {
			{
				text = "Combo",
                name = "sl3", -- name of the input should be unique otherwise it might override
				type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
			}
		}
	})
    if keyboard ~= nil then
        for k,v in pairs(keyboard) do
			if v == Config.SL_3 then
				EnterStash3()

			else
				QBCore.Functions.Notify("You entered the wrong lock combo!", "error", 10000)
			end	
		end
    end
end)
RegisterNetEvent('qb-stopragelockers:Stash4', function()
	local keyboard = exports["qb-input"]:ShowInput({
		header = "Enter Combo",
		submitText = "Enter Combo",
		inputs = {
			{
				text = "Combo",
                name = "sl4", -- name of the input should be unique otherwise it might override
				type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
			}
		}
	})
    if keyboard ~= nil then
        for k,v in pairs(keyboard) do
			if v == Config.SL_4 then
				EnterStash4()

			else
				QBCore.Functions.Notify("You entered the wrong lock combo!", "error", 10000)
			end	
		end
    end
end)




function EnterStash1()
    TriggerEvent("inventory:client:SetCurrentStash", "SL_1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "SL_1", {
        maxweight = 4000000,
        slots = 250,
    })
end

function EnterStash2()
TriggerEvent("inventory:client:SetCurrentStash", "SL_2")
TriggerServerEvent("inventory:server:OpenInventory", "stash", "SL_2", {
    maxweight = 4000000,
    slots = 250,
})
end

function EnterStash3()
	TriggerEvent("inventory:client:SetCurrentStash", "SL_3")
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "SL_3", {
		maxweight = 4000000,
		slots = 250,
	})
	end

	function EnterStash4()
		TriggerEvent("inventory:client:SetCurrentStash", "SL_4")
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "SL_4", {
			maxweight = 4000000,
			slots = 250,
		})
		end









RegisterNetEvent('qb-stopragelockers:StashCoppy1', function()
	SendNUIMessage({
		coords = "SL_1"
	})
end)
RegisterNetEvent('qb-stopragelockers:StashCoppy2', function()
	SendNUIMessage({
		coords = "SL_2"
	})
end)
RegisterNetEvent('qb-stopragelockers:StashCoppy3', function()
	SendNUIMessage({
		coords = "SL_3"
	})
end)
RegisterNetEvent('qb-stopragelockers:StashCoppy4', function()
	SendNUIMessage({
		coords = "SL_4"
	})
end)