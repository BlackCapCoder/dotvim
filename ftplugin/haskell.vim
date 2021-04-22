hi ghcmodType ctermbg=232
let hscoptions="A"


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

" map <buffer><silent> <leader>l :call ApplyOneSuggestion()<CR>
" map <buffer><silent> <leader>L :call ApplyAllSuggestions()<CR>


if !exists('g:has_jump_def')
  let g:has_jump_def = 1

  function! ftplugin#haskell#jumpDef()
    silent! let res = CocAction("jumpDefinition")
    if res == v:true
      return
    endif
    call coc#config("coc.preferences.hoverTarget", "echo")
    silent! let res = CocAction("doHover")
    call coc#config("coc.preferences.hoverTarget", "float")
    if res == v:false
      norm! gd
      return
    endif
    let targ = split(g:coc_last_hover_message)[1]
    let ws   = split(targ, "\\.")
    let pth  = join(ws[0:-2], "/")
    let ts   = filter(taglist(ws[-1].'$'), "v:val['filename'] =~ pth")
    if len(ts) == 0
      norm! gd
      return
    endif
    exec('edit +'.ts[0]['cmd'].' '.ts[0]['filename'])
  endfunction
endif

nmap <buffer><silent> gd :call ftplugin#haskell#jumpDef()<cr>

if !exists('g:has_get_typedec')
  let g:has_get_typedec = 1

  function! ftplugin#haskell#get_typedec()
    call coc#config("coc.preferences.hoverTarget", "echo")
    silent! let res = CocAction("doHover")
    call coc#config("coc.preferences.hoverTarget", "float")
    if res == v:false
      " auch!
      return
    endif
    let dec = join(split(split(g:coc_last_hover_message, "```")[0], "\n")[1:-1])
    -1put=dec
  endfunction
endif

nmap <buffer><silent> gt :call ftplugin#haskell#get_typedec()<cr>


function! HaskTags()
  ! hasktags --ctags -L --output=codex.tags . ~/.cabal/packages/hackage.haskell.org/
endfunction

setlocal tags=codex.tags;/,tags


" noremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" noremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
" noremap <silent> gt :HdevtoolsType<CR>
" noremap <silent> g, :call LanguageClient_textDocument_codeAction()<CR>
" nmap <silent> <esc> :silent! HdevtoolsClear<CR>

" nmap <buffer><silent> gu <Plug>(coc-references)
" nmap <buffer><silent> gr <Plug>(coc-rename)
" nmap <buffer><silent> g, <Plug>(coc-codeaction)
" nmap <buffer><silent> gt <Plug>(coc-rename)


syntax keyword hsNiceOperator undefined conceal cchar=⊥

setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <buffer><silent> [g <Plug>(coc-diagnostic-prev)
nmap <buffer><silent> ]g <Plug>(coc-diagnostic-next)

" nmap <buffer><silent> gd <Plug>(coc-definition)
nmap <buffer><silent> gy <Plug>(coc-type-definition)
" nmap <buffer><silent> gi <Plug>(coc-implementation)
nmap <buffer><silent> gr <Plug>(coc-references)
nmap <buffer><silent> gR <Plug>(coc-rename)

" xmap <buffer><leader>a <Plug>(coc-codeaction-selected)
" nmap <buffer><leader>a <Plug>(coc-codeaction-selected)

nmap <silent><buffer><leader>ac <Plug>(coc-codeaction)
" nmap <silent><buffer><leader>qf <Plug>(coc-fix-current)

nmap <silent><buffer>gl <Plug>(coc-codelens-action)

