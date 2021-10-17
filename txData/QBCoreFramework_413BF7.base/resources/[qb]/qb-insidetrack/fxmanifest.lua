fx_version 'cerulean'

game 'gta5'

description 'Infinity Creations : Inside-Track'

version '1.0.0'

client_scripts {
    'client/utils.lua',
    'client/client.lua',
    'client/screens/*.lua',
}

shared_scripts '@qb-core/import.lua'


server_script 'server/server.lua'