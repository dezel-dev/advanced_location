function Location:animation()
    local model = GetHashKey(selectedVehicle.model)
    Location:requestModel(model)
    local vehicle = CreateVehicle(model, Config.Location.Ped.RentVehicle.Initial.position, Config.Location.Ped.RentVehicle.Initial.heading, false, true)
end

RegisterNetEvent("location:vehicle", function()
    Location:animation()
end)