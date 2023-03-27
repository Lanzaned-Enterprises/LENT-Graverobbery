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
    [6] = {
        ["item"] = "grub",
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
    [4] = {
        ["GraveName"] = "Jennifer",
        ["Coords"] = vector3(-1745.68, -210.81, 56.81),
        ["Length"] = 0.8, ["Width"] = 0.6, ["Heading"] = 55,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [5] = {
        ["GraveName"] = "Rick",
        ["Coords"] = vector3(-1754.84, -218.82, 55.06),
        ["Length"] = 1.0, ["Width"] = 0.6, ["Heading"] = 55,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [6] = {
        ["GraveName"] = "Sandra",
        ["Coords"] = vector3(-1761.93, -204.7, 55.81),
        ["Length"] = 1.0, ["Width"] = 0.6, ["Heading"] = 55,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [7] = {
        ["GraveName"] = "Peter",
        ["Coords"] = vector3(-1752.89, -219.91, 55.08),
        ["Length"] = 1.0, ["Width"] = 0.6, ["Heading"] = 55,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [8] = {
        ["GraveName"] = "Monica",
        ["Coords"] = vector3(-1752.42, -213.23, 56.1),
        ["Length"] = 1.0, ["Width"] = 0.6, ["Heading"] = 55,
        ["Debug"] = false,
        ["Looted"] = false, -- Don't change this.
    },
    [9] = {
        ["GraveName"] = "Ted",
        ["Coords"] = vector3(-1746.37, -216.41, 55.93),
        ["Length"] = 1.0, ["Width"] = 0.6, ["Heading"] = 55,
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