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
        ["GraveName"] = "Xirvin",
        ["Coords"] = vector3(-1752.37, -205.8, 56.79),
        ["Length"] = 1.6, ["Width"] = 0.6, ["Heading"] = 53,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [2] = {
        ["GraveName"] = "Serena",
        ["Coords"] = vector3(-1729.41, -286.5, 49.83),
        ["Length"] = 2.6, ["Width"] = 1.2, ["Heading"] = 10,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [3] = {
        ["GraveName"] = "Scarlett",
        ["Coords"] = vector3(-1730.1, -282.35, 50.01),
        ["Length"] = 2.2, ["Width"] = 1.0, ["Heading"] = 15,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
}

-- [[ Functions ]] --
function policeAlert()
    exports["ps-dispatch"]:GraveRobbery()
end

function Notify(text, type, time)
    QBCore.Functions.Notify(text, type, time)
end