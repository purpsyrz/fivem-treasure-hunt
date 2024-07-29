fx_version 'cerulean'
game 'gta5'

author 'fill_ma_hooters'
description 'Treasure Hunt System for ESX'
version '1.0.0'

-- Server scripts
server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'server/main.lua'
}

-- Client scripts
client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'client/main.lua'
}

-- Shared scripts
shared_scripts {
    'config.lua'
}
