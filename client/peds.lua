function Location:initPed()
    newPed = Location:spawnPed(Config.Generic.Ped.Buying.model, Config.Location.Ped.Buying.position.x, Config.Location.Ped.Buying.position.y, Config.Location.Ped.Buying.position.z - 1.0, Config.Location.Ped.Buying.heading)
    FreezeEntityPosition(newPed, true)
    TaskSetBlockingOfNonTemporaryEvents(newPed, true)
    SetEntityInvincible(newPed, true)
    TaskStartScenarioInPlace(newPed, Config.Generic.Ped.Buying.scenario)
end

RegisterNetEvent("esx:playerLoaded", Location:initPed())