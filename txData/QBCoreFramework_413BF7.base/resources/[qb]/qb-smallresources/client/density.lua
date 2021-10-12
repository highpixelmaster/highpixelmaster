Citizen.CreateThread(function()
	while true do
		SetVehicleDensityMultiplierThisFrame(10.0)
	    SetPedDensityMultiplierThisFrame(1.0)
	    SetParkedVehicleDensityMultiplierThisFrame(5.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

		Citizen.Wait(3)
	end
end)