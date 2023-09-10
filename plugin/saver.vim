" AutoSave with Lua
lua << EOF
require "auto_save".setup()
EOF

augroup AutoSaveGroup
    autocmd!
    autocmd InsertLeave,TextChanged * :lua require "auto_save".auto_save()
augroup END

