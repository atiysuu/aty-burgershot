fx_version 'adamant'

game 'gta5'

description 'test'

lua54 'yes'

shared_scripts{
    '@es_extended/imports.lua',
    'config.lua',
}

client_scripts{
    'client/*.lua',
}

server_scripts{
    'server/*.lua',
}

ui_page 'html/ui.html'

files{
    'html/ui.html',
    'html/script.js',
    'html/style.css'
}