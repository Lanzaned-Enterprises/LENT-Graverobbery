local QBCore = exports['qb-core']:GetCoreObject()
local OldGrave = nil

-- [[ Function ]] --
function ResetGraveTimer(OldGrave)
    local num = Config.GraveRobbery['GraveSettings']['GraveResetTimer']  -- 5 minutes 45 seconds
    local time = tonumber(num)
    SetTimeout(time, function()
        Config.GraveRobbery['Graves'][OldGrave].Looted = false
        TriggerClientEvent('LENT-Graverobbery:Client:ResetGrave', -1, OldGrave, false)
    end)
end

RegisterServerEvent('LENT-Graverobbery:Server:SetGraveState', function(CurGrave)
    local OldGrave = nil
    local src = source
    local OldGrave = CurGrave
    if not Config.GraveRobbery['Graves'][OldGrave].Looted then 
        ResetGraveTimer(OldGrave)
        TriggerClientEvent('LENT-Graverobbery:Client:SetGraveState', -1, OldGrave, true)
    end
    Config.GraveRobbery['Graves'][OldGrave].Looted = true
end)

RegisterServerEvent("LENT-Graverobbery:Server:GiveItems", function(CurGrave)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = math.random(1, #Config.GraveRobbery['GraveSettings']['RewardSettings']['GraveRewards'])
    local amount = Config.GraveRobbery['GraveSettings']['RewardSettings'][reward]['Amount']
    local lootfound = false
    local chance = math.random(1, 100)
    if chance <= Config.GraveRobbery['GraveSettings']['RewardSettings']['RewardChance'] then 
        lootfound = true
        Player.Functions.AddItem(Config.GraveRobbery['GraveSettings']['RewardSettings'][reward]["Item"], amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.GraveRobbery['GraveSettings']['RewardSettings'][reward]["item"]], 'add')
    end
    if Config.GraveRobbery['GraveSettings']['SpecialSettings']['Specal'] then
        if chance >= Config.GraveRobbery['GraveSettings']['SpecialSettings']['SpecialChance'] then
            lootfound = true 
            Player.Functions.AddItem(math.random(1, #Config.GraveRobbery['GraveSettings']['SpecialSettings']['ChanceTable']), 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[math.random(1, #Config.GraveRobbery['GraveSettings']['SpecialSettings']['ChanceTable'])], "add", 1)
        end
    end
    if lootfound then 
        TriggerClientEvent('QBCore:Notify', src, 'You found something!', 'success', 3500)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You found nothing.', 'error', 3500)
    end
end)