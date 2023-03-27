-- [[ QBCORE ]] --
local QBCore = exports['qb-core']:GetCoreObject()

-- [[ Blip Variables ]] --
CementaryLocation = {}
local blipSpawned = false

-- [[ Grave Variables ]] --
local isDigging = false

-- [[ Resource Metadata ]] -- 
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        removeBlip()
    end
end)

-- [[ Function for Grave Stones ]] --
local ZoneSpawned = false 
local ZoneCreated = {}

CreateThread(function()
    for k, v in pairs(Config.Graves) do
        if ZoneSpawned then
            return
        end

        for k, v in pairs(Config.Graves) do
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

-- [[ Events ]] -- 
RegisterNetEvent('LENT-Graverobbery:Client:ResetGrave', function(OldGrave, state)
    Config.Graves[OldGrave].Looted = state
end)

RegisterNetEvent("LENT-Graverobbery:Client:StartDigging", function()
    if isDigging == false and QBCore.Functions.HasItem('shovel') then
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        TriggerEvent('animations:client:EmoteCommandStart', {"dig"})
        for k, v in pairs(Config.Graves) do
            local dist = #(GetEntityCoords(ped) - vector3(Config.Graves[k]["Coords"].x, Config.Graves[k]["Coords"].y, Config.Graves[k]["Coords"].z))
            if dist <= 2 then
                if Config.Graves[k].Looted == false then
                    Config.Graves[k].Looted = true
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
                        policeAlert()
                    end, function() -- Cancel
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        QBCore.Functions.Notify("Cancelled.", "error")
                    end)
                elseif Config.Graves[k].Looted == true then
                    QBCore.Functions.Notify('Seems like someone beat you to it!', 'error', 5000)
                end
            end
        end
    end
end)

-- [[ Blip Function ]] --
if Config.Blip then
    CreateThread(function()
        while true do
            Wait(0)
            if blipSpawned then
                return
            end

            local GravBlip = AddBlipForCoord(-1683.29, -293.2, 51.89)
            SetBlipSprite(GravBlip, 310)
            SetBlipDisplay(GravBlip, 3)
            SetBlipScale(GravBlip, 1.0)
            SetBlipColour(GravBlip, 39)
            SetBlipAlpha(GravBlip, 256)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Cemetery")
            EndTextCommandSetBlipName(GravBlip)
            table.insert(CementaryLocation, GravBlip)

            blipSpawned = true
        end
    end)
end

function removeBlip()
    for i, GravBlip in pairs(CementaryLocation) do
        RemoveBlip(GravBlip)
    end
end

-- [[ Animation Functions ]] --
function LoadAnimDict( dict )
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end