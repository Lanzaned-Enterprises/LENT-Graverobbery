--[[ Version Checker ]] --
local version = "1.0.0"

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        checkResourceVersion()
    end
end)

function checkUpdateEmbed(color, name, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. name .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(Config.DISCORD_WEBHOOK, function(err, text, headers) end, 
    'POST', json.encode({
        username = Config.DISCORD_NAME, 
        embeds = content, 
        avatar_url = Config.DISCORD_IMAGE
    }), { ['Content-Type'] = 'application/json '})
end

function checkResourceVersion()
    PerformHttpRequest("https://raw.githubusercontent.com/Lanzaned-Enterprises/LENT-Graverobbery/main/version.txt", function(err, text, headers)
        if string.match(text, version) then
            print(" ")
            print("---------- LANZANED Graverobbery ----------")
            print("Graverobbery is up to date and ready to go!")
            print("Running on Version: " .. version)
            print("https://github.com/Lanzaned-Enterprises/LENT-Graverobbery")
            print("--------------------------------------------")
            print(" ")
            checkUpdateEmbed(20480, "Graverobbery Update Checker", "Graverobbery is up to date and ready to go!\nRunning on Version: " .. version .. "\nhttps://github.com/Lanzaned-Enterprises/Graverobbery", "Script created by: https://discord.lanzaned.com")
        else
            print(" ")
            print("---------- LANZANED Graverobbery ----------")
            print("Graverobbery is not up to date! Please update!")
            print("Curent Version: " .. version .. " Latest Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Graverobbery")
            print("--------------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Graverobbery Update Checker", "Graverobbery is not up to date! Please update!\nCurent Version: " .. version .. " Latest Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/Graverobbery", "Script created by: https://discord.lanzaned.com")
        end
    end, "GET", "", {})
end