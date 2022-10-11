-- [[ Metadata ]] --
fx_version 'cerulean'
games { 'gta5' }

-- [[ Author ]] --
author 'Izumi S. <https://discordapp.com/users/871877975346405388>'
description 'Lananed Development | Graverobbery'
discord 'https://discord.lanzaned.com'
github 'https://github.com/Lanzaned-Enterprises/LENT-Graverobbery'
docs 'https://docs.lanzaned.com/'

-- [[ Version ]] --
version '1.0.0'

-- [[ Dependencies ]] --
dependencies {
    'qb-core',
}

-- [[ Files ]] --
shared_scripts {
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
}

client_scripts {
    -- Client Events
    'client/*.lua',
}

-- [[ Tebex ]] --
lua54 'yes'