"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=/home/blackcap/.config/nvim/dein/./repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/blackcap/.config/nvim/dein/.')
  call dein#begin('/home/blackcap/.config/nvim/dein/.')

  " Let dein manage dein
  " Required:
  call dein#add('/home/blackcap/.config/nvim/dein/./repos/github.com/Shougo/dein.vim')

  " -- Auto completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-vim')
  call dein#add('eagletmt/neco-ghc')
  " call dein#add('mkasa/neco-ghc-lushtags')
  call dein#add('ponko2/deoplete-fish')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('junegunn/vim-slash')

  " -- Snippets
  call dein#add('MarcWeber/vim-addon-mw-utils')
  " call dein#add('Shougo/neosnippet')
  " call dein#add('Shougo/neosnippet-snippets')
  " call dein#add('garbas/vim-snipmate')
  call dein#add('SirVer/ultisnips')
  " call dein#add('honza/vim-snippets')
  call dein#add('tomtom/tlib_vim')

  " -- Context awareness
  call dein#add('Shougo/context_filetype.vim')

  " -- Utils
  " call dein#add('sheerun/vim-polyglot')
  " call dein#add('unblevable/quick-scope')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('alvan/vim-closetag')
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('euclio/vim-markdown-composer')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('floobits/floobits-neovim')
  call dein#add('francoiscabrol/ranger.vim')
  call dein#add('jiangmiao/auto-pairs')
  " call dein#add('joeytwiddle/sexy_scroller.vim')
  call dein#add('junegunn/vim-easy-align')
  " call dein#add('justinmk/vim-sneak')
  " call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('idris-hackers/idris-vim')
  call dein#add('kassio/neoterm')
  call dein#add('metakirby5/codi.vim')
  call dein#add('munshkr/vim-tidal')
  call dein#add('rbgrouleff/bclose.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tomtom/tcomment_vim')
  " call dein#add('tpope/vim-surround')
  call dein#add('machakann/vim-sandwich')
  call dein#add('tweekmonster/braceless.vim')
  call dein#add('vim-scripts/mru.vim')
  " call dein#add('lucidstack/ctrlp-mpc.vim')
  call dein#add('jaxbot/browserlink.vim')
  call dein#add('BlackCapCoder/scrimba-vim')
  call dein#add('machakann/vim-highlightedyank')

  call dein#add('michalliu/jsruntime.vim')
  call dein#add('michalliu/jsoncodecs.vim')
  call dein#add('michalliu/sourcebeautify.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('HerringtonDarkholme/yats.vim')
  " call dein#add('ironcamel/vimchat')
  " call dein#add('mitsuse/autocomplete-swift')
  call dein#add('Rip-Rip/clang_complete')
  call dein#add('OmniSharp/omnisharp-vim')
  call dein#add('tpope/vim-dispatch')
  call dein#add('rhysd/clever-f.vim')
  " call dein#add('mhinz/vim-startify')
  call dein#add('junegunn/vim-emoji')
  call dein#add('vim-scripts/anwolib')
  call dein#add('tpope/vim-fugitive')
  call dein#add('xolox/vim-easytags')
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-pyref')
  call dein#add('keith/swift.vim')
  call dein#add('ervandew/archive')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-repeat')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('neomake/neomake')
  call dein#add('sbdchd/neoformat')
  call dein#add('gko/vim-coloresque')
  call dein#add('airblade/vim-gitgutter')


  " ======= Language specific specific
  " call dein#add('w0rp/ale',
  "     \ { 'on_ft': ['hs', 'go'] })
  " call dein#add('w0rp/ale')

  call dein#add('eagletmt/ghcmod-vim',
      \ { 'for': 'haskell' })

  call dein#add('neovimhaskell/haskell-vim',
      \ { 'for': 'haskell' })

  call dein#add('enomsg/vim-haskellConcealPlus',
      \ { 'for': 'haskell' })

  call dein#add('Twinside/vim-hoogle',
      \ { 'for': 'haskell' })

  call dein#add('itchyny/vim-haskell-indent',
      \ { 'for': 'haskell' })

  call dein#add('fatih/vim-go',
      \{'on_ft': ['go']})

  call dein#add('zchee/deoplete-go',
      \{'on_ft': ['go'], 'build': 'make'})

  call dein#add('alvan/vim-php-manual',
      \{'on_ft': ['php']})

  call dein#add('2072/PHP-Indenting-for-VIm',
      \{'on_ft': ['php']})

  call dein#add('thaerkh/vim-indentguides',
      \{'on_ft': ['go', 'html', 'css', 'js', 'php', 'py', 'c', 'cpp', 'h', 'sass']})

  call dein#add('rust-lang/rust.vim',
      \{'for': 'rust'})

  call dein#add('koturn/vim-brainfuck',
      \{'for': 'brainfuck'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------


set nofixendofline
set completeopt-=preview
set autoread
set number
set numberwidth=5
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
" autocmd BufNewFile,BufRead *.go set list listchars=tab:  
set nojoinspaces
set foldmethod=syntax
" set nofoldenable
set directory^=$HOME/.vim/tmp//
set ttyfast
set lazyredraw
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000
set history=50
set autoindent
set smartindent
set laststatus=1
" set mouse=a
set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " Automatically :write before running commands
" set nowrap
set linebreak
set ic
set relativenumber


let g:deoplete#enable_at_startup        = 1
let g:deoplete#enable_smart_case        = 1
let g:deoplete#auto_refresh_delay       = 0
let g:deoplete#auto_complete_delay      = 0
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#enable_refresh_always    = 1
let g:neoterm_position                  = 'horizontal'
let g:neoterm_automap_keys              = ',tt'
let g:closetag_filenames                = "*.html,*.xhtml,*.phtml,*.xml,*.php"

let g:ctrlp_map                   = ''
let g:ranger_map_keys             = 0
let mapleader                     = " "
let g:Guifont                     = "Monospace:h20"
let g:indentguides_ignorelist     = ['text', 'haskell', 'hs']
let g:markdown_composer_autostart = 0

let g:table_mode_corner="|"

let g:haskellmode_completion_ghc = 0

" let g:OmniSharp_server_type = 'v1'
" let g:OmniSharp_server_type = 'roslyn'

let g:clang_library_path='/usr/lib/libclang.so'
let g:codi#autocmd   = "InsertLeave"
let g:codi#autoclose = 1
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

let g:loaded_matchparen = 1 " Disable parenteces matching for performance
let g:necoghc_use_stack = 1
let g:highlightedyank_highlight_duration = 300


" I don't like themes with backgrounds
colorscheme molokai-transparent
hi TabLine ctermfg=white ctermbg=black
hi TabLineFill ctermfg=black

" I change the terminal colors based on the system background image
hi Type ctermfg=blue
hi Number ctermfg=magenta
hi Operator ctermfg=red
hi Keyword ctermfg=red
hi Structure ctermfg=red
hi String ctermfg=green
hi preProc ctermfg=green


" filetype detection and syntax markup
augroup filetypes
  autocmd!

  au BufRead,BufNewFile *.bf     set filetype=brainfuck
  au BufRead,BufNewFile *.bef    set filetype=befunge | source /home/blackcap/.config/nvim/ftplugin/befunge.vim
  au BufRead,BufNewFile *.pyth   set filetype=pyth | set syntax=python
  au BufRead,BufNewFile *.joy    set filetype=joy | set syntax=haskell
  au BufRead,BufNewFile *.abe    set filetype=05AB1E | set syntax=haskell
  au BufRead,BufNewFile *.json   setf json
  au BufRead,BufNewFile *.ts     setf typescript
  au BufRead,BufNewFile *.vv     setf V
  au BufRead,BufNewFile *.emojic setf emojicode | set syntax=haskell
  au BufRead,BufNewFile *.agda   setf Agda | set syntax=haskell

  " au BufRead,BufNewFile *.idr setf idris | set syntax=haskell
augroup END

" execute buffer for various languages
augroup makeCmd
  autocmd!

  au FileType python set makeprg=python\ %
  au FileType swift  set makeprg=swift\ %
  au FileType javascript set makeprg=node\ %
  au FileType go set makeprg=go\ run\ %
  au FileType rust set makeprg=cargo\ run\ %
  au FileType brainfuck set makeprg=bfi\ %
  au FileType befunge set makeprg=befungee\ %
  au FileType joy set makeprg=joy\ %
  au FileType emojicode set makeprg=emojicodec\ %\ &&\ emojicode\ %:r.emojib
  au FileType Agda set makeprg=agda\ %
  au FileType php set makeprg=php\ %
  au FileType idris set makeprg=idris\ %\ -o\ %:r\ &&\ ./%:r
  au FileType haskell set makeprg=stack\ run
  au FileType java set makeprg=javac\ %\ &&\ java\ %:r
augroup END

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \   set relativenumber |
    \ endif

  au BufRead * normal zR
  au FocusGained,BufEnter * :checktime

  au CursorHold,CursorHoldI,InsertLeave * :NeomakeFile

  " Spellcheck text files
  autocmd FileType text,markdown
      \ setlocal spell spelllang=en |
      \
      \ imap <C-k> <Esc>[s1z=`]a|
      \ imap <C-l> <Esc>[sea<C-x><C-s>
  autocmd FileType help setlocal nospell

  " autocmd FileType text,markdown
  "     \ au InsertEnter * silent exe ":! stenoon" |
      " \ au InsertLeave * silent exe ":! stenooff"


  " autocmd FileType pyth nnoremap <buffer> <C-j> :! python3 /home/blackcap/.config/nvim/interp/pyth/pyth.py %<CR>
  " autocmd FileType 05AB1E nnoremap <buffer> <C-j> :! python3 /home/blackcap/.config/nvim/interp/05AB1E/05AB1E.py %<CR>
  autocmd FileType emojicode set completefunc=emoji#complete |
        \ set omnifunc=emoji#complete|
        \ inoremap : :<C-x><C-o><C-p>|
        \ inoremap <Esc> <esc>:%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/ge<CR>g;:echo ''<CR>

  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

  autocmd FileType css
    \ vnoremap <buffer> <leader>ss :! css2sass<CR> |
    \ vnoremap <buffer> <leader>cs :! sassc -a \| beautify-css<CR>

  autocmd FileType css nnoremap <buffer> <leader>cc :%! cleancss % \| beautify-css<CR>:%s/,\n/, /g<CR>:nohl<CR>
  autocmd FileType css nnoremap <buffer>  <leader>ss mqggVG:! css2sass<CR>:set filetype=sass<CR>'q
  autocmd FileType sass nnoremap <buffer> <leader>ss mqggVG:! sassc -a \| beautify-css<CR>:set filetype=css<CR>'q

  autocmd FileType java
    \ setlocal omnifunc=javacomplete#Complete

  autocmd FileType javascript vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>
  autocmd FileType css vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>

  autocmd! BufWritePost * Neomake

  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END


" Fixes various issues with interactions between multiplecursor and other
" plugins
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
  if exists(':NeomakeDisableBuffer')==2
    exe 'NeomakeDisableBuffer'
  endif

  call deoplete#disable()
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
  if exists(':NeomakeDisableBuffer')==2
    exe 'NeomakeDisableBuffer'
  endif

  call deoplete#enable()
endfunction


" -- Keymaps
map <leader>i :tabp<cr>
map <leader>o :tabn<cr>
command WQ wq
command Wq wq
command W w
command Q q
nnoremap ø }
nnoremap Ø {
map ø }
map Ø {
nnoremap æ <C-d>
nnoremap Æ <C-u>
nmap <F3> mp:retab<CR>:%s/\s\+$//e<CR>'p
" nmap <CR> :CtrlPBuffer<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <M-J> <C-W>j
nnoremap <M-K> <C-W>k
nnoremap <M-L> <C-W>l
nnoremap <M-H> <C-W>h
nnoremap Q <nop>

noremap <leader>e :Ranger<CR>

nmap <C-p> :FuzzyOpen<CR>
nmap <leader>f :FuzzyGrep<CR>
nmap <leader>m :MRU<CR>

" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" imap <C-J> <Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger
let g:UltiSnipsExpandTriggerOrJump="<C-i>"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <C-M> <CR><CR><Up><Tab>
nmap q: :q
nmap Q: :q
cnoremap Q! q!

nnoremap <leader>g :GundoToggle<cr>
nnoremap <leader>r :TREPLSendFile<cr>
nnoremap <leader>r :TREPLSendFile<cr>
nnoremap <leader>l :TREPLSendLine<cr>
vnoremap <leader>l :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" nnoremap vic vi}

tnoremap <C-j> <C-\><C-n>
tnoremap <C-k> <C-\><C-n>:

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <Leader>c :CodiUpdate<CR>

vnoremap <leader>5 :!babel --presets "/usr/lib/node_modules/babel-preset-es2015/"<CR>dj
vnoremap <leader>6 :!babel --presets "/usr/lib/node_modules/babel-preset-es2016/"<CR>


" let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif


" nnoremap <Leader>t :!mpc clear; mpc search Any "" \| mpc add; mpc play<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

nnoremap <Leader>v :!python ~/golf/V/main.py %<CR>

" let g:ale_linters = {
" \   'haskell': ['stack-ghc', 'stack-build', 'ghc-mod', 'hlint'],
" \}
" let g:ale_enabled = 0


command! RandomLine execute 'normal! '.(system('/bin/bash -c "echo -n $RANDOM"') % line('$')).'G'

noremap <leader>hh :%!xxd<CR>
noremap <leader>hr :%!xxd -r<CR>

hi HighlightedyankRegion ctermbg=black

autocmd BufRead,BufNewFile * set signcolumn=yes
hi clear SignColumn

" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

runtime macros/matchit.vim

" nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
" let g:comfortable_motion_interval = 50
" let g:comfortable_motion_friction = 140
" let g:comfortable_motion_air_drag = 4.0

noremap <C-j> :make<CR>
