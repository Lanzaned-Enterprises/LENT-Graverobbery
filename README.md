# LENT-Graverobbery
*Do you have a shovel? Are you down bad? Need some quick loot to repo it back to a pawn shop? Well fear no more. You can now do exactly that!*

## Dependencies
- qb-core
- PolyZone

## Optional Dependencies
- ps-dispatch

## How to Install
- Add the following item to your `qb-core/shared/items.lua`
```lua
	['shovel'] 				 		 = {['name'] = 'shovel', 			    		['label'] = 'Shovel', 					['weight'] = 15000, 	['type'] = 'item', 		['image'] = 'shovel.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Get Digging!'},
    ["grub"] = {["name"] = "grub",  ["label"] = "Grub",  ["weight"] = 100, ["type"] = "item",  ["image"] = "grub.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false,  ["description"] = "That's what you get for robbing graves..", },
```
- Add the image from `Images` to your `inventory/html/images`
- Add the following snipets to `ps-dispatch`
```lua
-- cl_events.lua
local function GraveRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "GraveRobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-86",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = 'Exhumare', -- message
        job = {"police", "bcso", "doc"} -- jobs that will get the alerts
    })
end exports('GraveRobbery', GraveRobbery)

-- sv_dispatchcodes.lua
["GraveRobbery"] = { displayCode = '10-86', description = "Attempted Robbery", radius = 0, recipientList = {'police', 'bcso', 'doc'}, blipSprite = 630, blipColour = 12, blipScale = 1.5, blipLength = 2, sound = "robberysound", offset = "false", blipflash = "false" },
```

## Issues
|  Question |  Answer |
|----       |----     |
|           |         |

## Roadmap
|  Subject |  Completed? |
|----      |----         |
| Add more graves to the `Config.lua` | ❌ |

## Contributors
|  Rank       |  Member       | ID                 | Qualifications                       |
|----         |----           |----                |----                                  |
| Director    | [Lanzaned#2512](https://discordapp.com/users/871877975346405388) | [871877975346405388](https://discordapp.com/users/871877975346405388) | Javascript, XML, HTML, CSS, lua, SQL |

## Useful Links 
Discord: https://discord.lanzaned.com<br>
Github: https://github.lanzaned.com<br>
Documentation: https://docs.lanzaned.com/
