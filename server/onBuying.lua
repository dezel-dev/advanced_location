RegisterNetEvent("location:buying", function(price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    if (xPlayer) then
        if (xPlayer.getMoney() < price) then
            return TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent.")
        end
        --xPlayer.removeMoney(price)
        TriggerClientEvent("location:vehicle", _src)
    end
end)