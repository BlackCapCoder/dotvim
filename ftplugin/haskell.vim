hi ghcmodType ctermbg=232
let hscoptions="A"
" setlocal omnifunc=necoghc#omnifunc
" setlocal completefunc=LanguageClient#complete
" setlocal omnifunc=LanguageClient#omniComplete

"noremap <C-l> :GhcModType<CR>
"noremap <Esc> :HoogleClose<CR>:GhcModTypeClear<CR>
"noremap <leader>t :GhcModTypeInsert<CR>
"noremap <leader>h :Hoogle
"noremap gt :GhcModInfo<CR>
"noremap K :HoogleInfo<CR>

" Automatically lookup the type of the thing under my cursor whenever I move
" it. I didn't like this because it is not async

" let moved = 0
" set updatetime=500
" autocmd CursorMoved *
"   \ exec "HdevtoolsClear" |
"   \ let moved = 1
"
" autocmd CursorHold *
"   \ if moved == 1 |
"   \   exec "HdevtoolsType" |
"   \   let moved = 0 |
"   \ endif



" noremap gt :InteroGenericType<CR>
" noremap <leader>t :InteroTypeInsert<CR>
" noremap gd :InteroGoToDef<CR>
" noremap gl :GhcModLint<CR>
" exec "silent! InteroLoadCurrentModule"
"
" au BufWrite * :silent! InteroLoadCurrentFile
" let &makeprg = 'stack run 2>&1 \| uncolor'
"
" noremap <silent> <C-j> :10sp term://stack run \| nmap <buffer> <Esc <backspace>> ZQ<CR>:silent! set laststatus=0 \| setlocal noshowmode \| setlocal nonumber \| setlocal norelativenumber<CR>
"
" vmap <silent> <leader>f :%!pointfree --stdin<CR>
" vmap <leader>F :%!pointful --stdin<CR>

" --------- Hlint -------------

" vnoremap R :%!hlint --refactor -<CR>

function! ApplyOneSuggestion()
  let l = line(".")
  let c = col(".")
  let l:filter = "%! hlint - --refactor  --refactor-options=\"--pos ".l.','.c."\""
  execute l:filter
  silent if v:shell_error == 1| undo | endif
  call cursor(l, c)
endfunction


function! ApplyAllSuggestions()
  let l = line(".")
  let c = col(".")
  let l:filter = "%! hlint - --refactor"
  execute l:filter
  silent if v:shell_error == 1| undo | endif"
  call cursor(l, c)
endfunction

map <silent> <leader>l :call ApplyOneSuggestion()<CR>
map <silent> <leader>L :call ApplyAllSuggestions()<CR>




" noremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" noremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
" noremap <silent> gt :HdevtoolsType<CR>
" noremap <silent> g, :call LanguageClient_textDocument_codeAction()<CR>
" nmap <silent> <esc> :silent! HdevtoolsClear<CR>

noremap <silent> gd :call CocAction("jumpDefinition")<CR>
noremap <silent> gr :call CocAction("rename")<CR>
noremap <silent> K  :call CocAction("doHover")<CR>
noremap <silent> g, :call CocAction("codeAction")<CR>
noremap <silent> gt :call CocAction("showSignatureHelp")<CR>


syntax keyword hsNiceOperator undefined conceal cchar=⊥

setlocal tags=tags;/,codex.tags;/
setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()



" " --------- ht-refactor -----------
"
" if !exists("g:ht")
"
"   function! s:OnEvent(job_id, data, event) dict
"     if a:event == 'stdout'
"       checktime
"       " call append(line('$'), join(a:data))
"     else
"       " call HtRestart ()
"       echoerr "ht-refact died!"
"     endif
"   endfunction
"
"   let s:callbacks = {
"   \ 'on_stdout': function('s:OnEvent'),
"   \ 'on_exit': function('s:OnEvent')
"   \ }
"
"   function! HtRestart()
"     " if exists("g:ht")
"     "   call jobstop(g:ht)
"     " endif
"
"     let g:ht = jobstart(['ht-refact', '.'], extend({'shell': 'shell 1'}, s:callbacks))
"   endfunction
"
"   call HtRestart ()
"
"   " ------
"
"   function! HtRefact (str)
"     call jobsend(g:ht, a:str . "\n")
"   endfunction
"
"   function! s:HtGetCursor()
"     let [line, column] = getpos(".")[1:2]
"     return line . ':' . column
"   endfunction
"
"   function! s:HtGetVisual()
"     if mode()=="v"
"         let [line_start, column_start] = getpos("v")[1:2]
"         let [line_end, column_end] = getpos(".")[1:2]
"     else
"         let [line_start, column_start] = getpos("'<")[1:2]
"         let [line_end, column_end] = getpos("'>")[1:2]
"     end
"     if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
"         let [line_start, column_start, line_end, column_end] =
"         \   [line_end, column_end, line_start, column_start]
"     end
"
"     return line_start . ':' . column_start . '-' . line_end . ':' . column_end
"   endfunction
"
"   function! s:HtGetWord()
"     if mode()=="n"
"       norm viw
"     end
"
"     let [line_start, column_start] = getpos("v")[1:2]
"     let [line_end, column_end] = getpos(".")[1:2]
"     norm 1
"
"     return line_start . ':' . column_start . '-' . line_end . ':' . column_end
"   endfunction
"
"   " ------
"
"   " OrganizeImports MODULE
"   function! HtOrganizeImports()
"     call HtRefact('OrganizeImports ' . expand('%:p'))
"   endfunction
"
"   " GenerateExports MODULE
"   function! HtGenerateExports()
"     call HtRefact('GenerateExports ' . expand('%:p'))
"   endfunction
"
"   " OrganizeExtensions MODULE
"   function! HtOrganizeExtensions()
"     call HtRefact('OrganizeExtensions ' . expand('%:p'))
"   endfunction
"
"   " RenameDefinition MODULE SRC-RANGE NEW-NAME
"   function! HtRenameDefinition()
"     call HtRefact('RenameDefinition ' . expand('%:p') . ' ' . s:HtGetWord() . ' ' . input('Rename to: '))
"   endfunction
"
"   " InlineBinding MODULE SRC-RANGE
"   function! HtInlineBinding()
"     call HtRefact('InlineBinding ' . expand('%:p') . ' ' . s:HtGetCursor())
"   endfunction
"
"   " InlineBinding MODULE SRC-RANGE
"   function! HtGenerateSignature()
"     call HtRefact('GenerateSignature ' . expand('%:p') . ' ' . s:HtGetWord())
"   endfunction
"
"   " ExtractBinding MODULE SRC-RANGE NEW-NAME
"   function! HtExtractBindingNorm()
"     let rng  = s:HtGetCursor()
"     let name = input('Name: ')
"
"     call HtRefact('ExtractBinding ' . expand('%:p') . ' ' . s:HtGetCursor() . ' ' . name)
"   endfunction
"
"   function! HtExtractBindingVis()
"     let rng  = s:HtGetVisual()
"     let name = input('Name: ')
"
"     call HtRefact('ExtractBinding ' . expand('%:p') . ' ' . s:HtGetCursor() . ' ' . name)
"   endfunction
"
"   " FloatOut MODULE SRC-RANGE
"   function! HtFloatOut()
"     call HtRefact('FloatOut ' . expand('%:p') . ' ' . s:HtGetWord())
"   endfunction
"
" endif

" nmap <leader>hb :call HtExtractBindingNorm()<cr>
" vmap <leader>hb :call HtExtractBindingVis()<cr>
" nmap <leader>hr :call HtRenameDefinition()<cr>
" nmap <leader>hs :call HtOrganizeImports()<cr>
" nmap <leader>hi :call HtInlineBinding()<cr>
" nmap <leader>hx :call HtOrganizeExtensions()<cr>
" nmap <leader>ht :call HtGenerateSignature()<cr>
" nmap <leader>he :call HtGenerateExports()<cr>
" nmap <leader>hf :call HtFloatOut()<cr>

