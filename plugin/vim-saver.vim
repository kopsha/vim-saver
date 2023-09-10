" =============================================================================
" Vim Saver
" Description: Yet another auto-save plugin, a true time saver.
" Maintainer: Florin Ciurcanu <https://github.com/kopsha>
" =============================================================================

" Prevent the script from being loaded more than once
if exists("g:vimsaver_is_loaded")
    finish
endif
let g:vimsaver_is_loaded = 1

" Autogroup for managing auto-save related autocmds
augroup AutoSaveGroup
    autocmd!
    " Trigger auto-save when leaving Insert mode or when text is changed
    autocmd InsertLeave,TextChanged * :lua require "vim-saver".on_save_event()
augroup END

