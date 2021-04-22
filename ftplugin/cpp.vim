noremap <buffer><silent> gd :call CocAction("jumpDefinition")<CR>
noremap <buffer><silent> gr :call CocAction("rename")<CR>
noremap <buffer><silent> g, :call CocAction("codeAction")<CR>
noremap <buffer><silent> gt :call CocAction("showSignatureHelp")<CR>
noremap <buffer><silent> <leader>a :call CurtineIncSw()<CR>
" noremap <silent> K  :call CocAction("doHover")<CR>


function! FuncAroundC()
  norm! l
  silent exec 'norm! ?\m^\s*\n\(\(\_s\+\|^\)\w\+\)\{2,}[^;]\{-}(\_.\{-})\_.\{-}{'
                 \ . "\n)v``//e\n%"
endfunction

vnoremap <buffer><silent> af :<C-U>call FuncAroundC()<cr>
onoremap <buffer><silent> af :<C-U>call FuncAroundC()<cr>


function! FuncInsideC()
  norm! l
  silent exec 'norm! ?\m^\s*\n\(\(\_s\+\|^\)\w\+\)\{2,}[^;]\{-}(\_.\{-})\_.\{-}{?e'."\n"
  norm viB
endfunction

vnoremap <buffer><silent> if :<C-U>call FuncInsideC()<cr>
onoremap <buffer><silent> if :<C-U>call FuncInsideC()<cr>
