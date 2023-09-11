" =============================================================================
" Vim Saver
" Description: Yet another auto-save plugin, a true time saver.
" Maintainer: Florin Ciurcanu <https://github.com/kopsha>
" =============================================================================

if exists("g:vimsaver_is_loaded")
    finish
endif
let g:vimsaver_is_loaded = 1

command! SaverToggle lua require "vim-saver".toggle()

augroup SaverEvents
    autocmd!
    autocmd BufLeave * lua require "vim-saver".on_buf_leave()
    autocmd FocusLost * lua require "vim-saver".on_buf_leave()
augroup END

