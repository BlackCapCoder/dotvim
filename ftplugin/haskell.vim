hi ghcmodType ctermbg=black
let g:ghcmod_type_highlight = 'ghcmodType'
let hscoptions="A"
" set updatetime=500

noremap <C-l> :GhcModType<CR>
noremap <Esc> :GhcModTypeClear<CR>
noremap <leader>t :GhcModTypeInsert<CR>
noremap <leader>i :GhcModInfo<CR>

" let moved = 0
" autocmd FileType haskell autocmd CursorMoved *
"   \ exec "GhcModTypeClear" |
"   \ let moved = 1

" autocmd FileType haskell autocmd CursorHold *
"   \ if moved == 1 |
"   \   exec "GhcModType" |
"   \   let moved = 0 |
"   \ endif

