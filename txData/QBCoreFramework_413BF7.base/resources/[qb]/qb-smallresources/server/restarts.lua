restarttimes = { '08:00', '12:00', '24:00' }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(20000)
		local time = os.date("%X"):sub(1, -4)
		for i=1, #restarttimes, 1 do
			if restarttimes[i] == time then
				TriggerEvent('qb-weathersync:server:setWeather', "rain")
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'normal', 'Attention citizens! 🌊 Tsunami is going to hit the city in 30 minutes!')
				Citizen.Wait(900000)
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'normal', 'Attention citizens! 🌊 Tsunami is going to hit the city in 15 minutes!')
				Citizen.Wait(300000)
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'normal', 'Attention citizens! 🌊 Tsunami is going to hit the city in 10 minutes!')
				Citizen.Wait(300000)
				TriggerEvent('qb-weathersync:server:setWeather', "thunder")
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'warning', 'Attention citizens! 🌊 Tsunami is going to hit the city in 5 minutes!')
				Citizen.Wait(180000)
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'warning', 'Attention citizens! 🌊 Tsunami is going to hit the city in 2 minutes!')
				Citizen.Wait(60000)
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'error', 'Attention citizens! 🌊 Tsunami is going to hit the city in 1 minutes!')
				Citizen.Wait(30000)
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'error', 'Attention citizens! 🌊 Tsunami is going to hit the city in 30 seconds!')
				Citizen.Wait(30000)
                TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'error', 'Attention citizens! 🌊 Tsunami is going to hit the city now!')
                restart()
			end
		end
	end
end)

function restart()
	local xPlayers = QBCore.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
		DropPlayer(xPlayers[i], "All Roleplay situations have ended. Your progress has been saved. City is restarting and will be back in couple of minutes!")
	end
	Citizen.Wait(10000)
	os.exit()
end

QBCore.Commands.Add("restartcity", "5 Minute City Restart", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
        TriggerEvent('qb-weathersync:server:setWeather', "thunder")
        TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'warning', 'Attention citizens! 🌊 Tsunami is going to hit the city in 5 minutes!')

		Citizen.Wait(180000)
        TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'warning', 'Attention citizens! 🌊 Tsunami is going to hit the city in 2 minutes!')

		Citizen.Wait(60000)
        TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'error', 'Attention citizens! 🌊 Tsunami is going to hit the city in 1 minutes!')

		Citizen.Wait(30000)
        TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'error', 'Attention citizens! 🌊 Tsunami is going to hit the city in 30 seconds!')

		Citizen.Wait(30000)
		restart()
	end)
end, "god")

QBCore.Commands.Add("testchat", "5 Minute City Restart", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
        TriggerClientEvent('chat:addMessage', -1, 'City Weather Service', 'error', 'Attention citizens! 🌊 Tsunami is going to hit the city in 30 seconds!')
	end)
end, "god")

QBCore.Commands.Add("restartcitynow", "Restart the city instantly.", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
		restart()
	end)
end, "god")