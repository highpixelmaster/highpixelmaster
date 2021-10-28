Citizen.CreateThread(function()
	while true do
		SetVehicleDensityMultiplierThisFrame(5.0)
	    SetPedDensityMultiplierThisFrame(2.0)
	    SetParkedVehicleDensityMultiplierThisFrame(2.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

		Citizen.Wait(3)
	end
end)