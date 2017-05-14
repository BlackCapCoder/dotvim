hi ghcmodType ctermbg=232
let g:ghcmod_type_highlight = 'ghcmodType'
let hscoptions="A"

noremap <C-l> :GhcModType<CR>
noremap <Esc> :HoogleClose<CR>:GhcModTypeClear<CR>
noremap <leader>t :GhcModTypeInsert<CR>
noremap <leader>h :Hoogle
noremap gt :GhcModInfo<CR>
noremap K :HoogleInfo<CR>


" Automatically lookup the type of the thing under my cursor whenever I move
" it. I didn't like this because it is not async

" let moved = 0
" set updatetime=500
" autocmd CursorMoved *
"   \ exec "GhcModTypeClear" |
"   \ let moved = 1
"
" autocmd CursorHold *
"   \ if moved == 1 |
"   \   exec "GhcModType" |
"   \   let moved = 0 |
"   \ endif
"
