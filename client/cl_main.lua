-- [[ QBCORE ]] --
local QBCore = exports['qb-core']:GetCoreObject()

-- [[ Variables ]] --
CementaryLocation = {}
local blipSpawned = false
local isDigging = false
local ZoneSpawned = false 
local ZoneCreated = {}

-- [[ Resource Metadata ]] -- 
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        removeBlip()
    end
end)

-- [[ Functions ]] --
function removeBlip()
    for i, GravBlip in pairs(CementaryLocation) do
        RemoveBlip(GravBlip)
    end
end

function LoadAnimDict( dict )
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function IsShovelItemRequired()
    if Config.GraveRobbery['ItemSettings']['ItemRequired'] then
        if QBCore.Functions.HasItem(Config.Graverobbery['ItemSettings']['ItemName']) then
            return true
        end
    else
        return true
    end

    return false
end

-- [[ Networked Events ]] --
RegisterNetEvent('LENT-Graverobbery:Client:ResetGrave', function(OldGrave, state)
    Config.GraveRobbery['Graves'][OldGrave].Looted = state
end)

RegisterNetEvent("LENT-Graverobbery:Client:StartDigging", function()
    if isDigging == false and IsShovelItemRequired() then
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        TriggerEvent('animations:client:EmoteCommandStart', {"dig"})
        for k, v in pairs(Config.GraveRobbery['Graves']) do
            local dist = #(GetEntityCoords(ped) - vector3(Config.GraveRobbery['Graves'][k]["Coords"].x, Config.GraveRobbery['Graves'][k]["Coords"].y, Config.GraveRobbery['Graves'][k]["Coords"].z))
            if dist <= 2 then
                if Config.GraveRobbery['Graves'][k].Looted == false then
                    Config.GraveRobbery['Graves'][k].Looted = true
                    CurGrave = k
                    QBCore.Functions.Progressbar("digging", "Digging...", math.random(8000, 15000), false, true, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        Diggin = true
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('LENT-Graverobbery:Server:SetGraveState', CurGrave)
                        TriggerServerEvent('LENT-Graverobbery:Server:GiveItems', CurGrave)
                        local x, y, z = Config.GraveRobbery['Graves'][k]["Coords"].x, Config.GraveRobbery['Graves'][k]["Coords"].y, Config.GraveRobbery['Graves'][k]["Coords"].z
                        exports['LENT-Library']:SendPoliceAlert(x, y, z, "Exhumare", "10-86", "Illegal Grave Digger Spotted!", 310, 15, 0.8, 2, "{ \"leo\" }")
                    end, function() -- Cancel
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        exports["LENT-Library"]:SendNotification("Cancelled.", "error")
                    end)
                elseif Config.GraveRobbery['Graves'][k].Looted == true then
                    exports["LENT-Library"]:SendNotification('Seems like someone beat you to it!', 'error', 5000)
                end
            end
        end
    end
end)

-- [[ Threads ]] --
CreateThread(function()
    for k, v in pairs(Config.GraveRobbery['Graves']) do
        if ZoneSpawned then
            return
        end

        for k, v in pairs(Config.GraveRobbery['Graves']) do
            if not ZoneCreated[k] then
                ZoneCreated[k] = {}
            end

            ZoneCreated[k] = exports['qb-target']:AddBoxZone(v["GraveName"], v["Coords"], v["Length"], v["Width"], {
                name = v["GraveName"],
                heading = v["Heading"],
                debugPoly = v["Debug"],
            }, {
                options = {
                    {
                        icon = "fa-solid fa-trowel",
                        label = "Dig Grave",
                        event = "LENT-Graverobbery:Client:StartDigging",
                    },
                },
        
                distance = 1
            })

            ZoneSpawned = true
        end
    end
end)

-- [[ Blip Function ]] --
if Config.GraveRobbery['BlipSettings']['Blip'] then
    CreateThread(function()
        while true do
            Wait(0)
            if blipSpawned then
                return
            end

            local GravBlip = AddBlipForCoord(Config.GraveRobbery['BlipSettings']['BlipCoords'])
            SetBlipSprite(GravBlip, Config.GraveRobbery['BlipSettings']['BlipSprite'])
            SetBlipDisplay(GravBlip, Config.GraveRobbery['BlipSettings']['BlipDisplau'])
            SetBlipScale(GravBlip, Config.GraveRobbery['BlipSettings']['BlipScale'])
            SetBlipColour(GravBlip, Config.GraveRobbery['BlipSettings']['BlipColor'])
            SetBlipAlpha(GravBlip, Config.GraveRobbery['BlipSettings']['BlipAlpha'])
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.GraveRobbery['BlipSettings']['BlipName'])
            EndTextCommandSetBlipName(GravBlip)
            table.insert(CementaryLocation, GravBlip)

            blipSpawned = true
        end
    end)
end