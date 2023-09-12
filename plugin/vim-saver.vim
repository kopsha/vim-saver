" =============================================================================
" VimSaver
" Description: Yet another auto-save plugin, a true time saver.
" Maintainer: Florin Ciurcanu <https://github.com/kopsha>
" =============================================================================

if exists("g:vimsaver_was_loaded")
    finish
endif

lua require("vim-saver").setup({})
let g:vimsaver_was_loaded = 1

