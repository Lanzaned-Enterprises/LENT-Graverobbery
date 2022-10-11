local QBCore = exports['qb-core']:GetCoreObject()

CementaryLocation = {}

zone = 0
local isDigging = false

-- [[ When the resource starts create the peds ]] -- 
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        if Config.Blip then
            createBlip()
        end
    end
end)

-- [[ When the resource stops delete all the peds ]] -- 
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        removeBlip()
    end
end)

-- [[ Function for Grave Stones ]] --
Citizen.CreateThread(function()
    for k, v in pairs(Config.Graves) do
        zone = zone + 1
        exports['qb-target']:AddBoxZone(zone, v["Coords"], v["Length"], v["Width"], {
            name=zone,
            heading=v["Heading"],
            debugPoly=v["Debug"],
        }, {
            options = {
                {
                    event = "LENT:CLIENT:GETITEM",
                    icon = "fa-solid fa-trowel",
                    label = "Dig Grave",
                },
            },
            distance = 3
        })             
    end
end)

-- [[ Events ]] -- 
RegisterNetEvent('LENT:CLIENT:RESET:GRAVE', function(OldGrave, state)
    Config.Graves[OldGrave].Looted = state
end)

RegisterNetEvent("LENT:CLIENT:GETITEM", function()
    if isDigging == false and QBCore.Functions.HasItem('shovel') then
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        for k, v in pairs(Config.Graves) do
            if Config.Graves[k].Looted == false then
                policeAlert()
                Config.Graves[k].Looted = true
                CurGrave = k
                TriggerEvent('animations:client:EmoteCommandStart', {"dig"})
                QBCore.Functions.Progressbar("digging", "Digging...", math.random(8000, 15000), false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    Diggin = true
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    TriggerServerEvent('LENT:GRAVE:SETSTATE', CurGrave)
                    TriggerServerEvent('LENT:GRAVE:GETITEM', CurGrave)
                end, function() -- Cancel
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("Cancelled.", "error")
                end)
            end
        end
    end
end)

-- [[ Blip Function ]] --
function createBlip()
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
end

function removeBlip()
    for i, GravBlip in pairs(CementaryLocation) do
        RemoveBlip(GravBlip)
    end
end

-- [[ Animation Functions ]] --
function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end