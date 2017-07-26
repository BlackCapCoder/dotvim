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
  call dein#add('ponko2/deoplete-fish')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('zchee/deoplete-jedi')

  " -- Snippets
  call dein#add('MarcWeber/vim-addon-mw-utils')
  " call dein#add('Shougo/neosnippet')
  " call dein#add('Shougo/neosnippet-snippets')
  call dein#add('garbas/vim-snipmate')
  call dein#add('honza/vim-snippets')
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
  call dein#add('joeytwiddle/sexy_scroller.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('justinmk/vim-sneak')
  call dein#add('kassio/neoterm')
  call dein#add('metakirby5/codi.vim')
  call dein#add('munshkr/vim-tidal')
  call dein#add('rbgrouleff/bclose.vim')
  call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})
  call dein#add('sjl/gundo.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  call dein#add('tweekmonster/braceless.vim')
  call dein#add('vim-scripts/mru.vim')
  " call dein#add('lucidstack/ctrlp-mpc.vim')
  call dein#add('jaxbot/browserlink.vim')

  call dein#add('michalliu/jsruntime.vim')
  call dein#add('michalliu/jsoncodecs.vim')
  call dein#add('michalliu/sourcebeautify.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('ironcamel/vimchat')
  " call dein#add('mitsuse/autocomplete-swift')
  call dein#add('Rip-Rip/clang_complete')
  call dein#add('OmniSharp/omnisharp-vim')
  call dein#add('tpope/vim-dispatch')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('junegunn/vim-emoji')
  call dein#add('vim-scripts/anwolib')


  " ======= Language specific specific
  call dein#add('w0rp/ale',
      \ { 'on_ft': ['hs', 'go'] })

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


set completeopt-=preview
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

" let g:OmniSharp_server_type = 'v1'
" let g:OmniSharp_server_type = 'roslyn'


augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  au BufRead * normal zR

  " Spellcheck text files
  autocmd FileType text,markdown setlocal spell spelllang=en
  autocmd FileType help setlocal nospell

  " filetype detection
  au BufRead,BufNewFile *.bf set filetype=brainfuck
  au BufRead,BufNewFile *.bef set filetype=befunge | source /home/blackcap/.config/nvim/ftplugin/befunge.vim
  au BufRead,BufNewFile *.pyth set filetype=pyth | set syntax=python
  au BufRead,BufNewFile *.joy set filetype=joy | set syntax=haskell
  au BufRead,BufNewFile *.abe set filetype=05AB1E | set syntax=haskell
  au BufRead,BufNewFile *.json setf json
  au BufRead,BufNewFile *.ts setf typescript
  au BufRead,BufNewFile *.vv setf V
  au BufRead,BufNewFile *.idr setf idris | set syntax=haskell
  au BufRead,BufNewFile *.emojic setf emojicode | set syntax=haskell
  au BufRead,BufNewFile *.agda setf Agda | set syntax=haskell

  " Running the buffer for various languages
  autocmd FileType go nnoremap <buffer> <C-j> :GoRun<CR>
  autocmd FileType rust nnoremap <buffer> <C-j> :! cargo run --release<CR>
  autocmd FileType brainfuck nnoremap <buffer> <C-j> :BFExecute<CR>
  autocmd FileType befunge nnoremap <buffer> <C-j> :! befungee %<CR>
  autocmd FileType pyth nnoremap <buffer> <C-j> :! python3 /home/blackcap/.config/nvim/interp/pyth/pyth.py %<CR>
  autocmd FileType 05AB1E nnoremap <buffer> <C-j> :! python3 /home/blackcap/.config/nvim/interp/05AB1E/05AB1E.py %<CR>
  autocmd FileType joy nnoremap <buffer> <C-j> :! joy %<CR>
  autocmd FileType emojicode set completefunc=emoji#complete |
        \ set omnifunc=emoji#complete|
        \ inoremap : :<C-x><C-o><C-p>|
        \ inoremap <Esc> <esc>:%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/ge<CR>g;:echo ''<CR>|
        \ nnoremap <buffer> <C-j> :! emojicodec % && emojicode %:r.emojib<CR>
  autocmd FileType Agda nnoremap <buffer> <C-j> :! agda %<CR>

  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


  autocmd FileType css
    \ vnoremap <buffer> <leader>ss :! css2sass<CR> |
    \ vnoremap <buffer> <leader>cs :! sassc -a \| beautify-css<CR>

  autocmd FileType css nnoremap <buffer> <leader>cc :%! cleancss % \| beautify-css<CR>:%s/,\n/, /g<CR>:nohl<CR>
  autocmd FileType css nnoremap <buffer>  <leader>ss mqggVG:! css2sass<CR>:set filetype=sass<CR>'q
  autocmd FileType sass nnoremap <buffer> <leader>ss mqggVG:! sassc -a \| beautify-css<CR>:set filetype=css<CR>'q

  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

  autocmd FileType html vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>
  autocmd FileType javascript vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>
  autocmd FileType css vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>
augroup END

let g:haskellmode_completion_ghc = 0

set number
set relativenumber
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

" I don't like themes with backgrounds
colorscheme molokai-transparent
hi TabLine ctermfg=white ctermbg=black
hi TabLineFill ctermfg=black



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
nmap <CR> :CtrlPBuffer<CR>
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

imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <C-j> <Plug>snipMateNextOrTrigger
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <C-M> <CR><CR><Up><Tab>
nmap q: :q

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

" let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif


nnoremap <Leader>t :!mpc clear; mpc search Any "" \| mpc add; mpc play<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

nnoremap <Leader>v :!python ~/golf/V/main.py %<CR>
