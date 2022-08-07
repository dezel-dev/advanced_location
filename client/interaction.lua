Citizen.CreateThread(function()
    while (true) do
        local interval = 1000
        local dst = #(Config.Location.Ped.Buying.position - GetEntityCoords(PlayerPedId()))
        if (dst <= Config.Generic.Text.drawableDistance) then
            interval = 0
            ESX.Game.Utils.DrawText3D(Config.Location.Ped.Buying.position, "Appuyez sur [~b~E~s~] pour intéragir avec le vendeur", Config.Generic.Text.size, 4)
            if (IsControlJustPressed(0, 54)) then
                PlayPedAmbientSpeechNative(newPed, Config.Generic.Ped.Buying.sound, "SPEECH_PARAMS_STANDARD")
                openMenu()
            end
        end
        Citizen.Wait(interval)
    end
end)