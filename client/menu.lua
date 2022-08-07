openMenu = function()

    local main = RageUI.CreateMenu("Location", "L.S Location");

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do

        Citizen.Wait(0)

        RageUI.IsVisible(main, function()
            RageUI.Button("Appuyez sur le ~b~véhicule~s~ que vous voulez", nil, {RightBadge = RageUI.BadgeStyle.Alert}, true, {})
            RageUI.Line()
            for _, v in pairs(Config.Location.Vehicles) do
                RageUI.Button(v.label, nil, {RightLabel = "~g~$"..v.price}, true, {
                    onSelected = function()
                        if (not ESX.Game.IsSpawnPointClear(Config.Location.Ped.RentVehicle.Initial.position, 1.0)) or (not ESX.Game.IsSpawnPointClear(Config.Location.Ped.RentVehicle.Final.position, 1.0)) then
                            return ESX.ShowNotification("~r~Pas assez de place! Veuillez réessayer.")
                        end
                        selectedVehicle = { label = v.label, price = v.price, model = v.model }
                        TriggerServerEvent("location:buying", v.price)
                    end
                })
            end
        end)

        if not RageUI.Visible(main)  then
            main = RMenu:DeleteType('main', true)
        end
    end
end