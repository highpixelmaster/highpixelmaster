fx_version 'cerulean'
game 'gta5'

version '1.0.0'

client_scripts {
    'ms-client.lua'
}

shared_script '@qb-core/import.lua'
server_script 'ms-server.lua'

server_export 'GetAccount'