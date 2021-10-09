fx_version 'cerulean'
game 'gta5'

description 'QB-Skateboard'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

server_script 'server/*.lua'
client_script 'client/*.lua'
