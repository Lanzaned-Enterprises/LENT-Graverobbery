Config = {}

-- [[ Yard Blip ]] --
Config.Blip = true

-- [[ Grave Reset Timer ]] --
Config.GraveTimer = 300000 -- Default: 300000 = 5 Minutes

-- [[ Rewards ]] --
Config.SpecialChance = 75
Config.ChanceItem = "weapon_pistol"
Config.RewardChance = 20
Config.Rewards ={
    [1] = {
        ["item"] = "rolex",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [2] = {
        ["item"] = "diamond_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [3] = {
        ["item"] = "goldchain",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [4] = {
        ["item"] = "10kgoldchain",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [5] = {
        ["item"] = "goldbar",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
}

-- [[ Graves / Reset ]] --
Config.Graves = {
    [1] = {
        ["Coords"] = vector3(-1752.37, -205.8, 56.79),
        ["Length"] = 1.6, ["Width"] = 0.6, ["Heading"] = 53,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    }
}

-- [[ Functions ]] --
Config.PoliceAlert = 10 -- Seconds
function policeAlert()
    exports["ps-dispatch"]:GraveRobbery()
end

function Notify(text, type, time)
    QBCore.Functions.Notify(text, type, time)
end