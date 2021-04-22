
function! FormatAndSpaceBeforeBrackets (type, ...)
  let sel_save   = &selection
  let &selection = "inclusive"
  let reg_save   = @@

  if a:0 " Invoked from visual mode
    let s:prefix = 'gv'
    let s:mode   = 'v'
  elseif a:type == 'line'
    let s:prefix = "'[V']"
    let s:mode   = 'V'
  else
    let s:prefix = "`[v`]"
    let s:mode   = 'v'
  endif

  silent  exe "norm! ".s:prefix.":call CocAction ('formatSelected', '".s:mode."')"
  silent! exe "norm! ".s:prefix.":s/\[^ \]\\zs(/ (/g"

  let &selection = sel_save
  let @@         = reg_save
endfunction

nmap <buffer><leader>f :set opfunc=FormatAndSpaceBeforeBrackets<CR>g@
xmap <buffer><leader>f :<C-U>call  FormatAndSpaceBeforeBrackets(visualmode(), 1)<CR>

" xmap <buffer><leader>f <Plug>(coc-format-selected)
" nmap <buffer><leader>f <Plug>(coc-format-selected)


nmap <buffer><silent> [g <Plug>(coc-diagnostic-prev)
nmap <buffer><silent> ]g <Plug>(coc-diagnostic-next)

nmap <buffer><silent> gd <Plug>(coc-definition)
nmap <buffer><silent> gy <Plug>(coc-type-definition)
nmap <buffer><silent> gi <Plug>(coc-implementation)
nmap <buffer><silent> gr <Plug>(coc-references)

xmap <buffer><leader>a <Plug>(coc-codeaction-selected)
nmap <buffer><leader>a <Plug>(coc-codeaction-selected)

nmap <buffer><leader>ac <Plug>(coc-codeaction)
nmap <buffer><leader>qf <Plug>(coc-fix-current)
