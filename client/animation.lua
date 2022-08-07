function Location:animation()
    local model = GetHashKey(selectedVehicle.model)
    Location:requestModel(model)
    local vehicle = CreateVehicle(model, Config.Location.Ped.RentVehicle.Initial.position, Config.Location.Ped.RentVehicle.Initial.heading, false, true)
    SetVehicleDoorsLocked(vehicle , 2)
    SetEntityAsNoLongerNeeded(vehicle)
    ESX.ShowNotification("~g~Votre véhicule arrive!")
    local pedModel GetHashKey(Config.Generic.Ped.RentVehicle.model)
    RequestModel(pedModel)
    pedModel = GetHashKey("a_m_y_stlat_01")
    if DoesEntityExist(vehicle) then
        if IsModelValid(pedModel) then
            RequestModel(pedModel)
            while not HasModelLoaded(pedModel) do
                Wait(1)
            end

            ped = CreatePedInsideVehicle(vehicle, 26, pedModel, -1, true, false)
            SetAmbientVoiceName(ped, "A_M_M_EASTSA_02_LATINO_FULL_01")
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityAsMissionEntity(ped, true, true)

            SetModelAsNoLongerNeeded(model)
        end
    end
    blip = AddBlipForEntity(ped)
    TaskVehicleDriveToCoord(ped, vehicle, Config.Location.Ped.RentVehicle.Final.position, 10.0, 0, GetEntityModel(vehicle), 411, 0.5)
    SetPedKeepTask(taxiPed, true)
    CreateThread(function()
        while (true) do
            local dst = #(GetEntityCoords(ped) - Config.Location.Ped.RentVehicle.Final.position)
            ESX.Game.Utils.DrawText3D(GetEntityCoords(ped), ("Votre loaction (~b~%s~s~)"):format(math.floor(dst)), 0.5, 4)
            print(dst)
            if (dst <= 1.5) then
                break
            end
            Wait(1)
        end
        SetVehicleDoorsLocked(vehicle , 1)
        TaskLeaveVehicle(ped, vehicle, 0)
        ESX.ShowNotification("~g~Vous avez reçu votre véhicule! Aurevoir.")
    end)
    Wait(20000)
    DeleteEntity(ped)
    RemoveBlip(blip)
end

RegisterNetEvent("location:vehicle", function()
    Location:animation()
end)