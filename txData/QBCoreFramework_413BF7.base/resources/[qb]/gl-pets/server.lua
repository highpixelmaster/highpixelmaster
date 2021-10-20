QBCore = exports['qb-core']:GetCoreObject()

--	local xPlayer = QBCore.Functions.GetPlayer(source)



RegisterServerEvent('gl-pets:buyPet')
AddEventHandler('gl-pets:buyPet', function(petType,price)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)


	exports.oxmysql:execute('SELECT * FROM gl_pets WHERE owner = @owner', {
		['@owner'] = xPlayer.PlayerData.citizenid,
	}, function (result)
		local ifOwner = table.unpack(result)
		if ifOwner ~= nil then
			print('You already own a Pet!') -- Add notification here
		else
			if xPlayer.PlayerData.money.cash > price then
				print('You purchased a Pet!') -- Add notification here
				xPlayer.Functions.RemoveMoney('cash', price)
				exports.oxmysql:execute('INSERT INTO gl_pets (owner, modelname) VALUES (@owner, @modelname)',
				{
					['@owner']   = xPlayer.PlayerData.citizenid,
					['@modelname']   = petType,
				}, function (rowsChanged)

				end)
			else
				print('You cannot afford this pet') -- Add notification here
			end
		end
	end)
end)


RegisterServerEvent('gl-pets:buyFood')
AddEventHandler('gl-pets:buyFood', function(price)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.money.cash >= price then
		xPlayer.Functions.RemoveMoney('cash', price)
		xPlayer.Functions.AddItem(Config.FoodItem,1)
	end
end)


RegisterServerEvent('gl-pets:getOwnedPet')
AddEventHandler('gl-pets:getOwnedPet',function()

	local xPlayer = QBCore.Functions.GetPlayer(source)

	exports.oxmysql:execute('SELECT * FROM gl_pets WHERE owner = @owner', {
		['@owner'] = xPlayer.PlayerData.citizenid,
		['@modelname'] = modelname,
	}, function (result)
		TriggerClientEvent('gl-pets:spawnPet',modelname,health,illness)
	end)

end)

RegisterServerEvent('gl-pets:chargeABitch')
AddEventHandler('gl-pets:chargeABitch',function(fee)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.money.cash >= (Config.HealPrice + fee) then
		xPlayer.removeMoney((Config.HealPrice + fee))
	end
end)

RegisterServerEvent('gl-pets:returnBall')
AddEventHandler('gl-pets:returnBall',function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	xPlayer.Functions.AddItem('tennisball',1)
end)

RegisterServerEvent('gl-pets:removeBall')
AddEventHandler('gl-pets:removeBall',function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	xPlayer.Functions.RemoveItem('tennisball',1)
end)

QBCore.Functions.CreateUseableItem("tennisball", function(source)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('gl-pets:useTennisBall', source)
	xPlayer.Functions.RemoveItem('tennisball', 1)
    -- print('usado')
end)



function getPet(citizenid)

	exports.oxmysql:execute('SELECT * FROM gl_pets WHERE owner = @owner', {
		['@owner'] = citizenid,
	}, function (result)
		id = result[1].id
		owner = result[1].owner
		modelname = result[1].modelname
		health = result[1].health
		illnesses = result[1].illnesses
		cb(id,owner,modelname,health,illnesses)
	end)


end

QBCore.Functions.CreateCallback("gl-pets:getPetSQL", function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    --cb(getPet(xPlayer.PlayerData.citizenid))
    	exports.oxmysql:execute('SELECT * FROM gl_pets WHERE owner = @owner', {
		['@owner'] = xPlayer.PlayerData.citizenid,
	}, function (result)
		cb(result)
	end)
end)


RegisterServerEvent('gl-pets:updatePet')
AddEventHandler('gl-pets:updatePet',function(health,illness)
    local xPlayer = QBCore.Functions.GetPlayer(source)

	exports.oxmysql:execute('UPDATE gl_pets SET health = @health, illnesses = @illness WHERE owner = @owner', {
		['@health'] = health,
		['@illness'] = illness,				
		['@owner']   = xPlayer.PlayerData.citizenid,
	}, function(rowsChanged)

	end)

end)

RegisterServerEvent('gl-pets:buyTennisBall')
AddEventHandler('gl-pets:buyTennisBall',function(price)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.money.cash >= price then
		xPlayer.Functions.RemoveMoney('cash', price)
		xPlayer.Functions.AddItem('tennisball',1)
	end	
end)


RegisterServerEvent('gl-pets:updatePetName')
AddEventHandler('gl-pets:updatePetName',function(name)
    local xPlayer = QBCore.Functions.GetPlayer(source)

	exports.oxmysql:execute('UPDATE gl_pets SET name = @name WHERE owner = @owner', {
		['@name'] = name,		
		['@owner']   = xPlayer.PlayerData.citizenid,
	}, function(rowsChanged)

	end)

end)



RegisterServerEvent('gl-pets:removePet')
AddEventHandler('gl-pets:removePet',function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	exports.oxmysql:execute('DELETE FROM gl_pets WHERE owner = @owner', {
		['@owner'] = xPlayer.PlayerData.citizenid
	})

end)


RegisterNetEvent('gl-pets:k9Search')
AddEventHandler('gl-pets:k9Search',function(ID,targetID)
	print('Im here')
	local itemFound = false
	local source = source
	local targetPlayer = QBCore.Functions.GetPlayer(targetID)
	        for k, v in pairs(Config.SearchableItems.IllegalItems) do
            	if targetPlayer.Functions.GetItemByName(k).count >= v then
            		itemFound = true
            	end
        	end

		TriggerClientEvent('gl-pets:k9ItemCheck', source, itemFound)

end)
