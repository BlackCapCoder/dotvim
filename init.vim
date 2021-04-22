if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" set runtimepath+=/home/blackcap/.config/nvim/dein/./repos/github.com/Shougo/dein.vim
set runtimepath+=/home/blackcap/.cache/dein/repos/github.com/Shougo/dein.vim


let g:polyglot_disabled = ['autoindent']

runtime after/plugins.vim

" ----------


if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif


let g:gitgutter_map_keys = 0

" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=80
let g:qs_lazy_highlight = 1

let g:neoterm_position            = 'horizontal'
let g:neoterm_automap_keys        = ',tt'
let g:closetag_filenames          = "*.html,*.xhtml,*.phtml,*.xml,*.php"
let g:ctrlp_map                   = ''
" let g:ranger_map_keys             = 0
let mapleader                     = " "
let maplocalleader                = ','
let g:maplocalleader              = ','
let g:Guifont                     = "Monospace:h20"
let g:indentguides_ignorelist     = ['text', 'haskell', 'hs']
let g:markdown_composer_autostart = 0
let g:table_mode_corner           = "|"
let g:haskellmode_completion_ghc  = 0
let g:clang_library_path          = '/usr/lib/libclang.so'
let g:codi#autocmd                = "InsertLeave"
let g:codi#autoclose              = 1
let g:codi#interpreters = {
      \ 'pyth': {
          \ 'bin': ['codify-exe', 'python3', '/home/blackcap/.config/nvim/interp/pyth/pyth.py', '-c'],
          \ 'prompt': '^> ',
          \ },
      \ '05AB1E': {
        \ 'bin': ['codify-exe', 'python3', '/home/blackcap/.config/nvim/interp/05AB1E/05AB1E.py', '-e'],
        \ 'prompt': '^> ',
        \ },
      \ 'V': {
        \ 'bin': ['codify-exe', 'python', '/home/blackcap/golf/V/main.py', '-v'],
        \ 'prompt': '^> ',
        \ },
      \ }

" let g:loaded_matchparen = 1 " Disable parenteces matching for performance
let g:necoghc_use_stack = 1
let g:idris_conceal = 1
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

let g:easytags_cmd = '/usr/local/bin/ectags'
let g:easytags_by_filetype = '~/.vim/tags'
let g:easytags_async = 1

let g:keysound_py_version = 3
let g:keysound_enable = 0
let g:keysound_theme = 'typewriter'
let g:keysound_volume = 500
let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}

let g:UltiSnipsListSnippets = "<NUL>"
let g:UltiSnipsExpandTrigger = "<NUL>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" inoremap <silent><expr><C-i> ncm2_ultisnips#expand_or("\<C-R>=UltiSnips#ExpandSnippet()<CR>", 'n')
" inoremap <silent><C-i> <C-R>=UltiSnips#ExpandSnippet()<CR>
" se mouse=a
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')




" function! WrapLNext(direction)
"   if a:direction == "up"
"     try
"       lprevious
"     catch /^Vim\%((\a\+)\)\=:E553/
"       llast
"     endtry
"   elseif a:direction == "down"
"     try
"       lnext
"     catch /^Vim\%((\a\+)\)\=:E553/
"       lfirst
"     endtry
"   endif
" endfunction


" augroup CapsLockLED
"   autocmd!
"   autocmd InsertEnter * :silent !xset  led named 'Caps Lock'
"   autocmd InsertLeave * :silent !xset -led named 'Caps Lock'
"   autocmd VimLeave    * :silent !xset -led named 'Caps Lock'
" augroup END


" ---- Keymaps

" map <leader>i :tabp<cr>
" map <leader>o :tabn<cr>
map <silent><C-l> :call WrapLNext("up")<cr>
map <silent><C-h> :call WrapLNext("down")<cr>
command WQ wq
command Wq wq
command W w
command Q q
nmap <F3> :retab<CR>:%s/\s\+$//e<CR>``
" nmap <CR> :CtrlPBuffer<CR>
" nnoremap <Leader><Leader> <C-^>
nnoremap <silent><C-p> :CtrlP<CR>:<CR>

nmap <silent><leader>o :FuzzyOpen<CR>
" nmap <silent><leader>f :FuzzyGrep<CR>
" nmap <leader>m :MRU<CR>:nmap <buffer> <Esc <backspace>> ZQ<CR>
nmap <silent><leader>m :CtrlPMRUFiles<CR>

" nnoremap Q <nop>
" nmap Q: :q
" nmap q: :q
" cnoremap Q! q!



" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

tmap <a-j> <C-\><C-n>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

command Codex silent!! codex update > /dev/null &
command Fixjs silent!! eslint --fix %

nmap <silent><leader>q :TagbarOpenAutoClose<CR>

map <silent><leader>gf :e <cfile><cr>

" Work around for issues with clang complete
let g:AutoPairsMapCR = 0
let g:AutoPairsMapBS = 1
" imap <silent><CR> <Plug>AutoPairsReturn
" nmap <tab> za

nnoremap <silent><Leader>w :up<CR>
" noremap <Left> g;
" noremap <Right> g,

"
" " Comfortable motion
" let g:comfortable_motion_no_default_key_mappings = 1
" let g:comfortable_motion_friction = 1600.0
" let g:comfortable_motion_air_drag = 16.0
" let g:comfortable_motion_impulse_multiplier = 0.8  " Feel free to increase/decrease this value.
" nnoremap <silent> <C-d> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
" nnoremap <silent> <C-f> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
" nnoremap <silent> <C-b> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>


let g:swap_no_default_key_mappings = 1
let g:switch_mapping = "-"
nmap <silent>- :Switch<cr>

let g:switch_custom_definitions =
    \ [ ['yes', 'no']
    \ , ['Yes', 'No']
    \ , ['right', 'left']
    \ , ['Right', 'Left']
    \ , ['Up', 'Down']
    \ , ['up', 'down']
    \ ]

let g:javascript_conceal_function  = "ƒ"
let g:javascript_conceal_null      = "ø"
let g:javascript_conceal_this      = "@"
let g:javascript_conceal_return    = "η"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN       = "ℕ"
let g:javascript_conceal_prototype = "¶"
let g:javascript_conceal_static    = "•"
let g:javascript_conceal_super     = "Ω"


nmap sh <Plug>(swap-prev)
nmap sl <Plug>(swap-next)
nmap ss <Plug>(swap-interactive)

let g:move_map_keys=0
" nmap sj <Plug>MoveLineDown
" nmap sk <Plug>MoveLineUp
" vmap <Down> <Plug>MoveBlockDown
" vmap <Up> <Plug>MoveBlockUp

nmap sj :m+1<cr>
nmap sk :m-2<cr>
vmap sj :m+1\|norm!gv<cr>
vmap sk :m-2\|norm!gv<cr>
vmap J :m'>+1\|norm!gv<cr>
vmap K :m'<-2\|norm!gv<cr>

vmap H <Plug>(expand_region_shrink)
vmap L <Plug>(expand_region_expand)

" nmap <silent><leader>p :norm viio<c-v><esc>?([^)]*) *\n* *{<c-v><cr>vi)o<c-v><esc><cr>
nmap <silent><leader>p ?([^()]*)<cr>:noh<cr>
" nmap <C-t> :CtrlPBufTag<cr>


" Stolen from and depends on tagbar
function! GetNearbyTags(all, forcecurrent, ...) abort
    let fileinfo = tagbar#state#get_current_file(a:forcecurrent)
    if empty(fileinfo)
        return {}
    endif

    let typeinfo = fileinfo.typeinfo
    if a:0 > 0
        let curline = a:1
    else
        let curline = line('.')
    endif

    let prev = {}
    let cur  = {}
    let nxt  = {}
    let done = 0

    for line in range(curline, 1, -1)
        if has_key(fileinfo.fline, line)
            let curtag = fileinfo.fline[line]

            if done
              let prev = curtag
              break
            endif

            let cur  = curtag
            let done = a:all || typeinfo.getKind(curtag.fields.kind).stl
        endif
    endfor

    for line in range(curline+1, line('$'), 1)
      if has_key(fileinfo.fline, line)
          let curtag = fileinfo.fline[line]

          if (a:all || typeinfo.getKind(curtag.fields.kind).stl) && (curtag != cur)
            let nxt = curtag
            break
          endif
      endif
    endfor

    return {'prev': prev, 'cur': cur, 'next': nxt}
endfunction

nmap <silent><leader>d :exec("tag ".matchstr(GetNearbyTags(0,0).cur.str(0,0), '\w*'))<cr>
nmap <silent>tn :exec("tag ".matchstr(GetNearbyTags(0,0).next.str(0,0), '\w*'))<cr>
nmap <silent>tp :exec("tag ".matchstr(GetNearbyTags(0,0).prev.str(0,0), '\w*'))<cr>


" function! CommaInList (eol)
"   " enforce eol?
"   let curLine = getline ('.')
"   let curPos  = getpos  ('.')
"   if a:eol && (curPos[2] < len(curLine))
"     norm! a\\\\\
"     return
"   endif
"
"   " current line must contain , or [
"   if (match(curLine, '^ *,[^,]*$') != 0) && (match(curLine, '\[[^\],]*$') == -1)
"     norm! o
"     return
"   endif
"
"   " Cursor must be inside an array
"   norm! m""ayip'"
"   if match(@a, '[^\[\]]*\[[^,\n]*\n[^\]]*\]') != 0
"     norm! o
"     return
"   endif
"
"   " Comma!
"   let line = repeat(' ', match (curLine, '[,\[][^,\[]*$')).", "
"   exec ('norm! "="'.line.'\n"\\\\\p$')
" endfunction
"
" nmap <silent>o :call CommaInList(0)<cr>a
" nmap <silent>O k:call CommaInList(0)<cr>a
" imap <silent><cr> <esc>:call CommaInList(1)<cr>a


let g:sandwich_no_default_key_mappings = 1
nmap sa <Plug>(operator-sandwich-add)
" vim-surround adds text objects- dis" is more intuitive than sdi"
" nmap sd <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-query-a)
" nmap sdb <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-auto-a)
nmap ds <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-query-a)
nmap dsb <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-auto-a)
nmap sr <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
nmap srb <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)

" nnoremap gm m

" nmap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>n <Plug>yankstack_substitute_newer_paste
" call yankstack#setup()
nmap Y y$
" nunm gp
" nunm gP
map gy "+y
map gY "+y$
map gp "+p
map gP "+P


let g:skip_default_textobj_word_column_mappings = 1

xnoremap <silent> ak :<C-u>call TextObjWordBasedColumn("aw")<cr>
xnoremap <silent> aK :<C-u>call TextObjWordBasedColumn("aW")<cr>
xnoremap <silent> ik :<C-u>call TextObjWordBasedColumn("iw")<cr>
xnoremap <silent> iK :<C-u>call TextObjWordBasedColumn("iW")<cr>
onoremap <silent> ak :call TextObjWordBasedColumn("aw")<cr>
onoremap <silent> aK :call TextObjWordBasedColumn("aW")<cr>
onoremap <silent> ik :call TextObjWordBasedColumn("iw")<cr>
onoremap <silent> iK :call TextObjWordBasedColumn("iW")<cr>

cmap <C-j> <Cr>
cmap <C-e> <Tab>


nmap <leader>c :e ~/.config/nvim/init.vim<cr>

" let g:haskell_indent_disable = 1

vnoremap gn :NR<CR>
nmap  <silent> gn <Plug>NrrwrgnDo

" noremap <silent>go :norm o<cr>
" noremap <silent>gO :norm O<cr>
" noremap ]] ]]%%
" noremap [[ ]]%%

noremap <leader>j ]]%%
noremap <leader>k [[%%



" Visual Multi
" nmap <A-j> <Plug>(VM-Add-Cursor-Down)
" nmap <A-k> <Plug>(VM-Add-Cursor-Up)
" nmap <A-h> <Plug>(VM-Add-Cursor-Left)
" nmap <A-l> <Plug>(VM-Add-Cursor-Right)

" nm <c-q> ZQ

let g:fzf_action = { 'space': 'accept' }


" ---------------


runtime after/colors.vim
runtime after/vifm.vim
runtime after/languages.vim
runtime after/sortgroup.vim
runtime after/fun.vim
runtime macros/matchit.vim
" runtime after/sync.vim


" ---------------

set autoindent
set autoread
set autowrite " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set completeopt=menu,preview

"set conceallevel=0
set conceallevel=2
set concealcursor=
set dictionary+=/usr/share/dict/words
set expandtab
set exrc
set fcs=eob:\ 
set foldmethod=manual
set hidden
set history=50
set ic
set incsearch
set laststatus=1
set lazyredraw
set linebreak
set list listchars=tab:»·,trail:·,nbsp:·
set noautochdir
set nobackup
set nofixendofline
set noshowcmd
set noshowmode
set noswapfile
"set nowrap
set nowritebackup
set number
set numberwidth=5
set relativenumber
set scrolljump=10
set scrolloff=4
set shadafile=/home/blackcap/.vim/shada
set shiftround
set shiftwidth=2
set shm+=sc
set shortmess+=c
set sidescrolloff=4
set signcolumn="no"
set smartindent
set splitbelow
set tabstop=2
set ttyfast
set undofile
set undolevels=1000
set undoreload=10000
set wildmode=longest:full,list:full
set noignorecase


function! OnEsc()
  let l:listed  = &buflisted
  let l:special = &buftype != ''

  if &filetype == 'nerdtree'
    quit
  endif


  if l:special && ! l:listed
    if winnr () == 1
      bl
    else
      quit
    endif
    return
  endif

  if winnr () == 1 && l:listed && ! l:special
    silent! only
  endif

  silent! hide
endfunction

nnoremap <silent><esc> :call OnEsc()<cr>

" ----------


func TrimCompare(i1, i2)
  let x = trim(a:i1)
  let y = trim(a:i2)
  return x == y ? 0 : x > y ? 1 : -1
endfunc

function! DeleteUniqueMotion(type)
  silent exec 'norm! `[v`]"=join(uniq(split(@@,"\n"), "TrimCompare"),"\n")p'
  silent exec 'let @/=@'
endfunction

function! SortMotion (type)
  echomsg (a:type)

  if (a:type == 'line')
    silent exec 'norm! `[V`]"=sort(split(@@, "\n"), "TrimCompare")p'
  elseif (a:type == 'block')
    " silent! exec 'norm! `[`]"=join(sort(split(@@, "\n"), "TrimCompare"), "\n")\p'
    silent! exec 'norm! `[`]y'
    exec setreg ('@@', join (sort (split (@@, "\n"), "TrimCompare"), "\n"), 'b')
    silent! exec 'norm! `[`]p'
  elseif (a:type == 'char')
    silent! exec 'norm! `[v`]"=join(sort(split(@@, " *,\\? \\+"), "TrimCompare"), ", ")p'
  endif

  silent exec 'let @/=@'
endfunction

nmap     <silent>du :set opfunc=DeleteUniqueMotion<CR>g@
nnoremap <silent>gs :set opfunc=SortMotion<CR>g@
xnoremap <silent>gs :<C-U>call SortMotion (visualmode())<CR>
vnoremap <silent>gs "=join(sort(split(@@, "\n"), "TrimCompare"), "\n")<cr>p


nnoremap <leader>n :NERDTreeFocus<cr>

" let g:NERDTreeQuitOnOpen = 1

" --------

" Tags refering to the current file
  " :set tagfunc=TagList
"   :lt /.
"
function! TagList(pattern, ...)
  let pth    = expand  ('%:p')
  let result = filter (taglist (a:pattern, pth), { i, ta -> fnamemodify (ta['filename'], ":p") == pth })
  call sort (result, { a, b -> eval (a['cmd']) >= eval (b['cmd'])})
  return result
endfunc

" nnoremap <leader>t :CtrlPBufTagAll<cr>
nnoremap tt :CtrlPTag<cr>
nnoremap TT :CtrlPTagBuffAll<cr>

" --------

" :h i_CTRL-G_u
"   break undo sequence, start new change
"
imap <CR> <C-g>u<CR>

imap <C-j> <End><cr>

" Trigger eol stuff
"
" input:
"   ifunc Foo (<esc>o
"
" result:
"   func Foo ()
"     |
"
" input:
"   ifunc Foo(<esc>A<cr>
"
" result:
"   func Foo ()
"     |
"   endfunc
"
nmap o A<cr>

" --------

func! Blink(...)
  if ! &l:cursorline
    let &l:cursorline=1
    call timer_start(300, Lam("let &l:cursorline=0"))
  endif
endf


func! CursorX(key)
  exec ("norm!".v:count1.a:key)
  if v:count > 5
    call Blink()
  endif
endf

nnoremap <silent>k :<C-U>call CursorX('k')<cr>
nnoremap <silent>j :<C-U>call CursorX('j')<cr>

" -------

func! HistNav(key)
  let l:cp = getcurpos()
  let &l:cursorline=0
  exec ("norm!".v:count1.a:key)
  if l:cp != getcurpos()
    call Blink()
  endif
endf

nnoremap <silent><C-i> :<C-U>call HistNav('	')<cr>
nnoremap <silent><C-o> :<C-U>call HistNav('')<cr>

" -------

func! SetWinLine(x,...)
  let l:y  = winline ()
  let l:p1 = getcurpos ()[1]

  if a:x > l:y
    exec ('norm!'.(a:x-l:y).'')
  elseif a:x < l:y
    exec ('norm!'.(l:y-a:x).'')
  endif

  " <c-e>/<c-y> will move the cursor when
  " used at the end of the screen

  let l:p2 = getcurpos ()[1]

  if l:p1 != l:p2
    exec (l:p1)

    if l:p1 < l:p2
      norm! zt
    else
      norm! zb
    endif
  endif
endfunc

function! JumpMRU(...)
  let l:off = winline ()
  exec ("e ".ctrlp#mrufiles#list()[v:count1])
  call SetWinLine (l:off)
endfunction

" [count]<leader><leader>
"
" Jump to the N-th most recently used file (default=1).
" Keep the cursor in the same position as before the jump.
"
nnoremap <silent><Leader><Leader> :<C-U>call JumpMRU()<CR>

" -------------

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-y>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" Coc changes my scrolloff!
"
augroup CocScrollOffFix
  au!
  au InsertEnter * let s:so=&l:scrolloff
  au InsertLeave * let &l:scrolloff=s:so
augroup END

