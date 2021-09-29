local canFight = false
Citizen.CreateThread(function()
    while true do
    if canFight == false then
        DisableControlAction(0,24,true)
    end
    if IsControlPressed(0, 25) then
        canFight = true
    end
    if IsControlJustReleased(0, 25) then
        canFight = false
    end
        Wait(1)
    end
end)