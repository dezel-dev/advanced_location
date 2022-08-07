Location = {}

function Location:requestModel(model)
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(20)
    end
end

function Location:spawnPed(model, x, y, z, heading)
    local newModel = GetHashKey(model)
    Location:requestModel(newModel)
    local newPed = CreatePed(4, newModel, x, y, z, heading, false, true)
    while (not DoesEntityExist(newPed)) do
        Wait(20)
    end
    return (newPed)
end