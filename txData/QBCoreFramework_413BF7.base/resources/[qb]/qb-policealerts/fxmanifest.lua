fx_version 'cerulean'
game 'gta5'

description 'QB-Core'
version '1.0.0'

ui_page "html/index.html"

client_scripts {
    'client.lua',
    'config.lua',
}

server_scripts {
    'server.lua',
    'config.lua',
    '@qb-core/import.lua',
}

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
}

lua54 'yes'