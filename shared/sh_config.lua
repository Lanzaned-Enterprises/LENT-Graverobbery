Config = Config or {}

Config.GraveRobbery = {
    ['BlipSettings'] = {
        ['Blip'] = true,
        ['BlipCoords'] = vector3(-1683.29, -293.2, 51.89)
        ['BlipSprite'] = 310,
        ['BlipName'] = "Cemetary",
        ['BlipColor'] = 39,
        ['BlipDisplay'] = 3,
        ['BlipAlpha'] = 256,
        ['BlipScale'] = 0.8
    },
    ['ItemSettings'] = {
        ['ItemRequired'] = true,
        ['ItemName'] = "shovel",
    },
    ['GraveSettings'] = {
        ['GraveResetTimer'] = 300000,
        ['SpecialSettings'] = {
            ['Special'] = true,
            ['SpecialChance'] = 75
            ['ChanceTable'] = {
                "grub"
            },
        },
        ['RewardSettings'] = {
            ['RewardChance'] = 20,
            ['GraveRewards'] = {
                [1] = { ['Item'] = "rolex", ["Amount"] = math.random(1, 4) },
            },
        },
    },
    ['Graves'] = {
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
}