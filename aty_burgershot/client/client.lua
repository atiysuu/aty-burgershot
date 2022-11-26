RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
    local shown = false
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            local player = PlayerPedId() 
            local playerCoords = GetEntityCoords(player)
            local coords = Config.CallForMeatLocation
            local distance = #(playerCoords - coords)

            if distance < 1 then
                sleep = 4
                if Config.useOkok then
                    if not shown then
                        shown = true
                        exports['okokTextUI']:Open('Press [E] to open the mission menu', 'darkblue', 'left')
                    end
                else
                    DrawText3Ds(coords.x, coords.y, coords.z, tostring("Press [E] to open the mission menu"), 35)
                end
                if IsControlJustReleased(0, 38) then
                    SetDisplay(true)
                end
            elseif shown then
                shown = false
                exports['okokTextUI']:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local shown = false
    Citizen.Wait(10)
    
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            local player = PlayerPedId() 
            local playerCoords = GetEntityCoords(player)
            local coordsSpatula = Config.useSpatula
            local distanceSpatula = #(playerCoords - coordsSpatula)

            if distanceSpatula < 1 then
                sleep = 4
                if Config.useOkok then
                    if not shown then
                        shown = true
                        exports['okokTextUI']:Open('Press [E] to start cooking meat', 'darkblue', 'left')
                    end
                else
                    DrawText3Ds(coordsSpatula.x, coordsSpatula.y, coordsSpatula.z, tostring("Press [E] to start cooking meat"), 35)
                end

                if IsControlJustReleased(0, 38) then
                    ESX.TriggerServerCallback("useSpatula:check", function(cb)
                        if cb == true then
                            exports['mythic_progbar']:Progress({
                                name = "doingit",
                                duration = 5000,
                                label = 'You are doing it [DEL]',
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "amb@code_human_police_investigate@idle_b",
                                    anim = "idle_f",
                                    flags = 49,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    TriggerServerEvent("useSpatula")
                                    if Config.useOkok then
                                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                                    else
                                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                                    end
                                end
                            end)
                        end
                    end)
                end
            elseif shown then
                shown = false
                exports['okokTextUI']:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local shown = false
    Citizen.Wait(10)
    
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            local player = PlayerPedId() 
            local playerCoords = GetEntityCoords(player)
            local coordsMeat = Config.potato
            local distanceMeat = #(playerCoords - coordsMeat)

            if distanceMeat < 1 then
                sleep = 4
                if Config.useOkok then
                    if not shown then
                        shown = true
                        exports['okokTextUI']:Open('Press [E] to start cooking potato', 'darkblue', 'left')
                    end
                else
                    DrawText3Ds(coordsMeat.x, coordsMeat.y, coordsMeat.z, tostring("Press [E] to start cooking potato"), 35)
                end

                if IsControlJustReleased(0, 38) then
                    ESX.TriggerServerCallback("hasPotato:check", function(cb)
                        if cb == true then
                            exports['mythic_progbar']:Progress({
                                name = "doingit",
                                duration = 5000,
                                label = 'You are doing it [DEL]',
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "amb@code_human_police_investigate@idle_b",
                                    anim = "idle_f",
                                    flags = 49,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    TriggerServerEvent("hasPotato")
                                    if Config.useOkok then
                                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                                    else
                                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                                    end
                                end
                            end)
                        else
                            if Config.useOkok then
                                exports['okokNotify']:Alert("Alert", "You don't have frozen potato", 5000, 'warning')
                            else
                                exports['mythic_notify']:SendAlert('error', 'You don\'t have frozen potato')
                            end
                        end
                    end)
                end
            elseif shown then
                shown = false
                exports['okokTextUI']:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local shown = false
    Citizen.Wait(10)
    
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            local player = PlayerPedId() 
            local playerCoords = GetEntityCoords(player)
            local coordsMeat = Config.hamburgerBread
            local distanceMeat = #(playerCoords - coordsMeat)

            if distanceMeat < 1 then
                sleep = 4
                if Config.useOkok then
                    if not shown then
                        shown = true
                        exports['okokTextUI']:Open('Press [E] to start making hamburger', 'darkblue', 'left')
                    end
                else
                    DrawText3Ds(coordsMeat.x, coordsMeat.y, coordsMeat.z, tostring("Press [E] to start making hamburger"), 35)
                end

                if IsControlJustReleased(0, 38) then
                    ESX.TriggerServerCallback("hasHamburgerBread:check", function(cb)
                        if cb == true then
                            exports['mythic_progbar']:Progress({
                                name = "doingit",
                                duration = 5000,
                                label = 'You are doing it [DEL]',
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "amb@code_human_police_investigate@idle_b",
                                    anim = "idle_f",
                                    flags = 49,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    TriggerServerEvent("hasHamburgerBread")
                                    if Config.useOkok then
                                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                                    else
                                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                                    end
                                end
                            end)
                        end
                    end)
                end
            elseif shown then
                shown = false
                exports['okokTextUI']:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local shown = false
    Citizen.Wait(10)
    
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            local player = PlayerPedId() 
            local playerCoords = GetEntityCoords(player)
            local coordsMeat = Config.emptyCup
            local distanceMeat = #(playerCoords - coordsMeat)

            if distanceMeat < 1 then
                sleep = 4
                if Config.useOkok then
                    if not shown then
                        shown = true
                        exports['okokTextUI']:Open('Press [E] to get empty cup', 'darkblue', 'left')
                    end
                else
                    DrawText3Ds(coordsMeat.x, coordsMeat.y, coordsMeat.z, tostring("Press [E] to get empty cup"), 35)
                end

                if IsControlJustReleased(0, 38) then
                    exports['mythic_progbar']:Progress({
                        name = "doingit",
                        duration = 5000,
                        label = 'You are doing it [DEL]',
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "amb@code_human_police_investigate@idle_b",
                            anim = "idle_f",
                            flags = 49,
                        },
                    }, function(cancelled)
                        if not cancelled then
                            TriggerServerEvent("giveCup")
                            if Config.useOkok then
                                exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                            else
                                exports['mythic_notify']:SendAlert('success', 'You did it!')
                            end
                        end
                    end)
                end
            elseif shown then
                shown = false
                exports['okokTextUI']:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local shown = false
    
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            local player = PlayerPedId() 
            local playerCoords = GetEntityCoords(player)
            local coords = Config.getDrink
            local distance = #(playerCoords - coords)

            if distance < 1 then
                sleep = 4
                if Config.useOkok then
                    if not shown then
                        shown = true
                        exports['okokTextUI']:Open('Press [E] to get a drink', 'darkblue', 'left')
                    end
                else
                    DrawText3Ds(coords.x, coords.y, coords.z, tostring("Press [E] to get a drink"), 35)
                end
                if IsControlJustReleased(0, 38) then
                    SetDisplayDrink(true)
                end
            elseif shown then
                shown = false
                exports['okokTextUI']:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

function DrawText3Ds(x, y, z, text, shadow)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = shadow / 370
	if shadow ~= 0 then		
   		DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	end
    ClearDrawOrigin()
end

RegisterCommand("opentest", function(source, args)
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function ()
    SetDisplay(false)
    SetDisplayDrink(false)
end)

RegisterNUICallback("main", function ()
    SetDisplay(false)
    SetDisplayDrink(false)
end)

RegisterNUICallback("error", function ()
    print(data.error)
    SetDisplay(false)
    SetDisplayDrink(false)
end)

local carSpawned

RegisterNUICallback("getFrozenMeat", function ()
    SetDisplay(false)
    if Config.useOkok then
        exports['okokNotify']:Alert("Alert", "The service car will be there in a minute!", 5000, 'info')
        Citizen.Wait(10000)
        exports['okokNotify']:Alert("Alert", "The service car has came!", 5000, 'info')
    else
        exports['mythic_notify']:SendAlert('inform', 'The service car will be there in a minute!')
        Citizen.Wait(10000)
        exports['mythic_notify']:SendAlert('inform', 'The service car has came!')
    end
    local wayPoint = Config.getMeat
    SetNewWaypoint(wayPoint.x ,wayPoint.y)
    createServiceCar()
    carSpawned = true
end)

RegisterNUICallback("getFrozenPotato", function ()
    SetDisplay(false)
    if Config.useOkok then
        exports['okokNotify']:Alert("Alert", "The service car will be there in a minute!", 5000, 'info')
        Citizen.Wait(10000)
        exports['okokNotify']:Alert("Alert", "The service car has came!", 5000, 'info')
    else
        exports['mythic_notify']:SendAlert('inform', 'The service car will be there in a minute!')
        Citizen.Wait(10000)
        exports['mythic_notify']:SendAlert('inform', 'The service car has came!')
    end
    local wayPoint = Config.getPotato
    SetNewWaypoint(wayPoint.x ,wayPoint.y)
    createServiceCar()
    carPotatoSpawned = true
end)

Citizen.CreateThread(function()
    local shown = false
    local shownCar = false
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            if carSpawned then
                local player = PlayerPedId() 
                local playerCoords = GetEntityCoords(player)
                local coordsCar = Config.serviceCarCoords
                local getMeat = Config.getMeat
                local distanceCar = GetDistanceBetweenCoords(playerCoords, getMeat.x, getMeat.y, getMeat.z)
                local distanceDeleteCar = GetDistanceBetweenCoords(playerCoords, coordsCar.x, coordsCar.y, coordsCar.z)

                if distanceDeleteCar < 8 and IsPedInVehicle(player, GetVehiclePedIsIn(PlayerPedId(), false), true) then
                    sleep = 1
                    if Config.useOkok then
                        if not shownCar then
                            shownCar = true
                            exports['okokTextUI']:Open('Press [E] to stop the misson', 'darkblue', 'left')
                        end
                    else
                        DrawText3Ds(coordsCar.x, coordsCar.y, coordsCar.z, tostring("Press [E] to stop the misson"), 35)
                    end
                    if IsControlJustPressed(0, 38) then
                        carPotatoSpawned = false
                        carSpawned = false
                        DeleteWaypoint()
                        if Config.useOkok then
                            exports['okokNotify']:Alert("Alert", "You just stopped the mission", 5000, 'info')
                            exports['okokTextUI']:Close()
                            shownCar = false
                        else
                            exports['mythic_notify']:SendAlert('inform', 'You just stopped the mission')
                        end
                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    end
                elseif shownCar then
                    shownCar = false
                    exports['okokTextUI']:Close()
                end

                if distanceCar < 10 then
                    sleep = 1
                    DrawMarker(2, getMeat.x, getMeat.y, getMeat.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
                    if distanceCar < 1 then

                        if Config.useOkok then
                            if not shown then
                                shown = true
                                exports['okokTextUI']:Open('Press [E] to get a frozen meat', 'darkblue', 'left')
                            end
                        else
                            DrawText3Ds(getMeat.x, getMeat.y, getMeat.z, tostring("Press [E] to get a frozen meat"), 35)
                        end
                        if IsControlJustPressed(0, 38) then
                            exports['mythic_progbar']:Progress({
                                name = "doingit",
                                duration = 5000,
                                label = 'You are doing it [DEL]',
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "amb@code_human_police_investigate@idle_b",
                                    anim = "idle_f",
                                    flags = 49,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    TriggerServerEvent("serviceCarMeat")
                                    if Config.useOkok then
                                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                                    else
                                        exports['mythic_notify']:SendAlert('inform', 'You did it!')
                                    end
                                end
                            end)
                        end
                    elseif shown then
                        shown = false
                        exports['okokTextUI']:Close()
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    local shown = false
    local shownCar = false
    while true do
        local sleep = 250
        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "burgershot") then
            if carPotatoSpawned then
                local player = PlayerPedId() 
                local playerCoords = GetEntityCoords(player)
                local coordsCar = Config.serviceCarCoords
                local getPotato = Config.getPotato
                local distanceCar = GetDistanceBetweenCoords(playerCoords, getPotato.x, getPotato.y, getPotato.z)
                local distanceDeleteCar = GetDistanceBetweenCoords(playerCoords, coordsCar.x, coordsCar.y, coordsCar.z)

                if distanceDeleteCar < 8 and IsPedInVehicle(player, GetVehiclePedIsIn(PlayerPedId(), false), true) then
                    sleep = 1
                    if Config.useOkok then
                        if not shownCar then
                            shownCar = true
                            exports['okokTextUI']:Open('Press [E] to stop the misson', 'darkblue', 'left')
                        end
                    else
                        DrawText3Ds(coordsCar.x, coordsCar.y, coordsCar.z, tostring("Press [E] to stop the misson"), 35)
                    end
                    if IsControlJustPressed(0, 38) then
                        carPotatoSpawned = false
                        carSpawned = false
                        DeleteWaypoint()
                        if Config.useOkok then
                            exports['okokNotify']:Alert("Alert", "You just stopped the mission", 5000, 'info')
                            exports['okokTextUI']:Close()
                            shownCar = false
                        else
                            exports['mythic_notify']:SendAlert('inform', 'You just stopped the mission')
                        end
                        DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), false))
                    end
                elseif shownCar then
                    shownCar = false
                    exports['okokTextUI']:Close()
                end

                if distanceCar < 10 then
                    sleep = 1
                    DrawMarker(2, getPotato.x, getPotato.y, getPotato.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
                    if distanceCar < 1 then
                        if Config.useOkok then
                            if not shown then
                                shown = true
                                exports['okokTextUI']:Open('Press [E] to get a frozen potato', 'darkblue', 'left')
                            end
                        else
                            DrawText3Ds(getMeat.x, getMeat.y, getMeat.z, tostring("Press [E] to get a potato meat"), 35)
                        end
                        if IsControlJustPressed(0, 38) then
                            exports['mythic_progbar']:Progress({
                                name = "doingit",
                                duration = 5000,
                                label = 'You are doing it [DEL]',
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "amb@code_human_police_investigate@idle_b",
                                    anim = "idle_f",
                                    flags = 49,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    TriggerServerEvent("serviceCarPotato")
                                    carSpawned = false
                                    if Config.useOkok then
                                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                                    else
                                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                                    end
                                end
                            end)
                        end
                    elseif shown then
                        shown = false
                        exports['okokTextUI']:Close()
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNUICallback("giveSprite", function ()
    ESX.TriggerServerCallback("hasCup:check", function(cb)
        if cb == true then
            exports['mythic_progbar']:Progress({
                name = "doingit",
                duration = 5000,
                label = 'You are doing it [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@code_human_police_investigate@idle_b",
                    anim = "idle_f",
                    flags = 49,
                },
            }, function(cancelled)
                if not cancelled then
                    TriggerServerEvent("giveSprite")
                    if Config.useOkok then
                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                    else
                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                    end
                   
                end
            end)
        else
            if Config.useOkok then
                exports['okokNotify']:Alert("Alert", "You don't have a cup!", 5000, 'warning')
            else
                exports['mythic_notify']:SendAlert('error', 'You don\'t have a cup!')
            end
        end
    end)
end)

RegisterNUICallback("giveCola", function()
    ESX.TriggerServerCallback("hasCup:check", function(cb)
        if cb == true then
            exports['mythic_progbar']:Progress({
                name = "doingit",
                duration = 5000,
                label = 'You are doing it [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@code_human_police_investigate@idle_b",
                    anim = "idle_f",
                    flags = 49,
                },
            }, function(cancelled)
                if not cancelled then
                    TriggerServerEvent("giveCola")
                    if Config.useOkok then
                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                    else
                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                    end
                end
            end)
        else
            if Config.useOkok then
                exports['okokNotify']:Alert("Alert", "You don't have a cup!", 5000, 'warning')
            else
                exports['mythic_notify']:SendAlert('error', 'You don\'t have a cup!')
            end
        end
    end)
end)

RegisterNUICallback("givePepsi", function ()
    ESX.TriggerServerCallback("hasCup:check", function(cb)
        if cb == true then
            exports['mythic_progbar']:Progress({
                name = "doingit",
                duration = 5000,
                label = 'You are doing it [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@code_human_police_investigate@idle_b",
                    anim = "idle_f",
                    flags = 49,
                },
            }, function(cancelled)
                if not cancelled then
                    TriggerServerEvent("givePepsi")
                    if Config.useOkok then
                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                    else
                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                    end
                end
            end)
        else
            if Config.useOkok then
                exports['okokNotify']:Alert("Alert", "You don't have a cup!", 5000, 'warning')
            else
                exports['mythic_notify']:SendAlert('error', 'You don\'t have a cup!')
            end
        end
    end)
end)

RegisterNUICallback("giveWater", function ()
    ESX.TriggerServerCallback("hasCup:check", function(cb)
        if cb == true then
            exports['mythic_progbar']:Progress({
                name = "doingit",
                duration = 5000,
                label = 'You are doing it [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@code_human_police_investigate@idle_b",
                    anim = "idle_f",
                    flags = 49,
                },
            }, function(cancelled)
                if not cancelled then
                    TriggerServerEvent("giveWater")
                    if Config.useOkok then
                        exports['okokNotify']:Alert("Alert", "You did it!", 5000, 'info')
                    else
                        exports['mythic_notify']:SendAlert('success', 'You did it!')
                    end
                end
            end)
        else
            if Config.useOkok then
                exports['okokNotify']:Alert("Alert", "You don't have a cup!", 5000, 'warning')
            else
                exports['mythic_notify']:SendAlert('error', 'You don\'t have a cup!')
            end
        end
    end)
end)

function createServiceCar(vehicle)
    local serviceCarCoords = vector4(-1170.96, -891.2696, 13.94474, 30.01348)
    local ModelHash = Config.serviceCar
    if not IsModelInCdimage(ModelHash) then return end
    RequestModel(ModelHash)
    while not HasModelLoaded(ModelHash) do
        Citizen.Wait(10)
    end
    local vehicleEntity = CreateVehicle(ModelHash , serviceCarCoords.x , serviceCarCoords.y , serviceCarCoords.z , serviceCarCoords.heading, true, false)
    SetModelAsNoLongerNeeded(ModelHash)
    SetVehicleDoorsLocked(plate , 2)
    SetDisplay(false)
end

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

function SetDisplayDrink(bool)
    displayForDrink = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "nui",
        status = bool
    })
end