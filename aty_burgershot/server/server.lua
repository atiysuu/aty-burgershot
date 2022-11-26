RegisterServerEvent("burgershot:getMeat", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("frozenmeat", 1)
end)

ESX.RegisterServerCallback("useSpatula:check", function(source, cb)
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("spatula").count > 0 and xPlayer.getInventoryItem("frozenmeat").count > 0 then
        cb(true)
    elseif xPlayer.getInventoryItem("spatula").count == 0 and xPlayer.getInventoryItem("frozenmeat").count > 0 then
        if Config.useOkok then
            TriggerClientEvent('okokNotify:Alert', source, "Alert", "You don't have spatula", 5000, 'warning')
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You don\'t have spatula', length = 5000})
        end
        cb(false)
    elseif xPlayer.getInventoryItem("frozenmeat").count == 0 and xPlayer.getInventoryItem("spatula").count > 0 then
        if Config.useOkok then
            TriggerClientEvent('okokNotify:Alert', source, "Alert", "You don't have frozen meat", 5000, 'warning')
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You don\'t have frozen meat', length = 5000})
        end
        cb(false)
    else
        if Config.useOkok then
            TriggerClientEvent('okokNotify:Alert', source, "Alert", "You don't have spatula and frozen meat", 5000, 'warning')
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You don\'t have spatula and frozen meat', length = 5000})
        end
        cb(false)
    end
end)

RegisterServerEvent("useSpatula", function(cb)
    xPlayer.removeInventoryItem('frozenmeat', 1)
    xPlayer.addInventoryItem("meat", 1)
end)

ESX.RegisterServerCallback("hasPotato:check", function(source, cb)
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("frozenpotato").count > 0 then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent("hasPotato", function(cb)
    xPlayer.removeInventoryItem('frozenpotato', 1)
    xPlayer.addInventoryItem("potato", 1)
end)

ESX.RegisterServerCallback("hasHamburgerBread:check", function(source, cb)
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("hamburgerbread").count > 1 and xPlayer.getInventoryItem("meat").count > 0 then
        cb(true)
    elseif xPlayer.getInventoryItem("meat").count == 0 and xPlayer.getInventoryItem("hamburgerbread").count > 0 then
        if Config.useOkok then
            TriggerClientEvent('okokNotify:Alert', source, "Alert", "You don't have meat", 5000, 'warning')
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You don\'t have have meat', length = 5000})
        end
        cb(false)
    elseif xPlayer.getInventoryItem("hamburgerbread").count < 2 and xPlayer.getInventoryItem("meat").count > 0 then
        if Config.useOkok then
            TriggerClientEvent('okokNotify:Alert', source, "Alert", "You don't have enough bread", 5000, 'warning')
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You don\'t have enough bread', length = 5000})
        end
        cb(false)
    else
        if Config.useOkok then
            TriggerClientEvent('okokNotify:Alert', source, "Alert", "You don't have meat and bread", 5000, 'warning')
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You don\'t have meat and bread', length = 5000})
        end
        cb(false)
    end
end)
    
RegisterServerEvent("hasHamburgerBread", function(cb)
    xPlayer.removeInventoryItem('meat', 1)
    xPlayer.removeInventoryItem('hamburgerbread', 2)
    xPlayer.addInventoryItem("hamburger", 1)
end)

RegisterServerEvent("giveCup", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("emptycup", 1)
end)

ESX.RegisterServerCallback("hasCup:check", function(source, cb)
    xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem("emptycup").count > 0 then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent("giveSprite", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('emptycup', 1)
    xPlayer.addInventoryItem("sprite", 1)
end)

RegisterServerEvent("giveWater", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('emptycup', 1)
    xPlayer.addInventoryItem("water", 1)
end)

RegisterServerEvent("givePepsi", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('emptycup', 1)
    xPlayer.addInventoryItem("pepsi", 1)
end)

RegisterServerEvent("giveCola", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('emptycup', 1)
    xPlayer.addInventoryItem("cocacola", 1)
end)

RegisterServerEvent("serviceCarMeat", function()
    local meat = math.random(1,2)
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("frozenmeat", meat)
end)

RegisterServerEvent("serviceCarPotato", function()
    local meat = math.random(1,2)
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem("frozenpotato", meat)
end)