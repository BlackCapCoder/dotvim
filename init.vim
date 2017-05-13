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
  call dein#add('zchee/deoplete-jedi')
  call dein#add('sebastianmarkow/deoplete-rust')
  call dein#add('ponko2/deoplete-fish')
  call dein#add('Shougo/neco-vim')
  call dein#add('eagletmt/neco-ghc')

  " -- Snippets
  call dein#add('MarcWeber/vim-addon-mw-utils')
  call dein#add('tomtom/tlib_vim')
  call dein#add('honza/vim-snippets')
  call dein#add('garbas/vim-snipmate')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  imap <C-k> <Plug>(neosnippet_expand_or_jump)

  " -- Context awareness
  call dein#add('Shougo/context_filetype.vim')

  " -- Utils
  call dein#add('tpope/vim-surround')
  " call dein#add('tpope/vim-commentary')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('flazz/vim-colorschemes')
  " call dein#add('sheerun/vim-polyglot')
  call dein#add('metakirby5/codi.vim')
  call dein#add('munshkr/vim-tidal')

  call dein#add('floobits/floobits-neovim')

  call dein#add('rbgrouleff/bclose.vim')
  call dein#add('francoiscabrol/ranger.vim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('justinmk/vim-sneak')
  call dein#add('vim-scripts/mru.vim')
  call dein#add('tweekmonster/braceless.vim')
  call dein#add('joeytwiddle/sexy_scroller.vim')
  call dein#add('unblevable/quick-scope')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " Language specific specific
  call dein#add('fatih/vim-go',
      \{'on_ft': ['go']})
  call dein#add('zchee/deoplete-go',
      \{'on_ft': ['go'], 'build': 'make'})

  call dein#add('alvan/vim-php-manual',
      \{'on_ft': ['php']})
  call dein#add('2072/PHP-Indenting-for-VIm',
      \{'on_ft': ['php']})

  call dein#add('w0rp/ale', { 'for': 'haskell' })
  call dein#add('eagletmt/ghcmod-vim', { 'for': 'haskell' })

  call dein#add('thaerkh/vim-indentguides',
      \{'on_ft': ['go', 'html', 'css', 'js', 'php', 'py', 'c', 'cpp', 'h']})

  let g:indentguides_ignorelist = ['text', 'haskell', 'hs']

  call dein#add('enomsg/vim-haskellConcealPlus', { 'for': 'haskell' })
  " set concealcursor=nc

  call dein#add('alvan/vim-closetag')
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.php"
  call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})

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

set autoindent
set smartindent
set laststatus=1
" set mouse=a

set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set autowrite     " Automatically :write before running commands

" set nowrap
set linebreak

let g:Guifont="Monospace:h20"
set ic

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType go nnoremap <buffer> <C-j> :GoRun<CR>
  autocmd FileType text,markdown set spell spelllang=en

augroup END

colorscheme molokai-transparent
hi TabLine ctermfg=white ctermbg=black
hi TabLineFill ctermfg=black

" -- Keymaps
let mapleader = " "
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
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap Q <nop>

let g:ranger_map_keys = 0
noremap <leader>e :Ranger<CR>

au BufRead * normal zR


let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_refresh_delay = 0
let g:deoplete#auto_complete_delay = 0
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#enable_refresh_always = 1
set completeopt-=preview

nmap <C-p> :FuzzyOpen<CR>
nmap <leader>f :FuzzyGrep<CR>
nmap <leader>m :MRU<CR>
let g:ctrlp_map = ''

imap <C-j> <Plug>snipMateNextOrTrigger
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <C-M> <CR><CR><Up><Tab>
nmap q: :q



tnoremap <C-j> <C-\><C-n>
tnoremap <C-k> <C-\><C-n>:
