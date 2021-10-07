fx_version 'adamant'

game 'gta5'
author 'Boost = Forked and Converted MisterBuzzee'
description 'QB Sit'

version '1.0.0'

server_scripts {
	'config.lua',
	'lists/seat.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'lists/seat.lua',
	'client.lua'
}

shared_scripts {

	'@qb-core/import.lua',

}

dependencies { 
  'PolyZone', 
  'qb-target' 
}
