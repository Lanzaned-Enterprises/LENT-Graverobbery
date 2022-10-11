local QBCore = exports['qb-core']:GetCoreObject()
local OldGrave = nil

-- [[ Function ]] --
function ResetGraveTimer(OldGrave)
    local num = Config.GraveTimer  -- 5 minutes 45 seconds
    local time = tonumber(num)
    SetTimeout(time, function()
        Config.Graves[OldGrave].Looted = false
        TriggerClientEvent('LENT:CLIENT:RESET:GRAVE', -1, OldGrave, false)
    end)
end

RegisterServerEvent('LENT:GRAVE:SETSTATE', function(CurGrave)
    local OldGrave = nil
    local src = source
    local OldGrave = CurGrave
    if Config.Graves[OldGrave].Looted == false then 
        ResetGraveTimer(OldGrave)
        TriggerClientEvent('LENT:CLIENT:SETSTATE', -1, OldGrave, true)
    end
    Config.Graves[OldGrave].Looted = true
end)

RegisterServerEvent("LENT:GRAVE:GETITEM", function(CurGrave)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = math.random(1, #Config.Rewards)
    local amount = math.random(Config.Rewards[reward]["amount"]["min"], Config.Rewards[reward]["amount"]["max"])
    local lootfound = false
    local chance = math.random(1, 100)
    if chance <= Config.RewardChance then 
        lootfound = true
        Player.Functions.AddItem(Config.Rewards[reward]["item"], amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Rewards[reward]["item"]], 'add')
    end
    if chance >= Config.SpecialChance then
        lootfound = true 
        Player.Functions.AddItem(Config.ChanceItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ChanceItem], "add", 1)
    end
    if lootfound == true then 
        TriggerClientEvent('QBCore:Notify', src, 'You found something!', 'success', 3500)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You found nothing.', 'error', 3500)
    end
end)