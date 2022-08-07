Config = {}

Config.Generic = {
    Blips = {
        id = 77, -- Sprite of the blips         --[[
        size = 0.7, -- Size of the blips            (https://docs.fivem.net/docs/game-references/blips/)
        color = 3, -- Color of the blips         ]]--
        name = "Location | Véhicules",
    },
    Ped = {
        Buying = {
            model = "a_m_y_gencaspat_01", -- (https://docs.fivem.net/docs/game-references/ped-models/)
            scenario = "WORLD_HUMAN_CLIPBOARD", -- (https://wiki.rage.mp/index.php?title=Scenarios)
            sound = "GENERIC_HI" -- (https://pastebin.com/Vk9609qj)
        },
        RentVehicle = {
            model = "cs_paper", -- (https://docs.fivem.net/docs/game-references/ped-models/)
        },
    },
    Text = {
        size = 0.75,
        drawableDistance = 2.0
    }
}

Config.Location = {
    Ped = {
        Buying = { position = vector3(-1031.52, -2734.06, 20.16), heading = 141.73 },
        RentVehicle = {
            Initial = { position = vector3(-1091.459351, -2671.120850, 20.164062), heading = 206.92913818359 },
            Final = { position = vector3(-1032.514282, -2729.881348, 19.490112)}
        }
    },
    Vehicles = {
        {
            label = "BMX",
            model = "bmx",
            price = 50
        },
        {
            label = "Voiture",
            model = "blista",
            price = 250,
        },
        {
            label = "Moto",
            model = "sanchez",
            price = 125
        }
    }
}