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
  " ncm2:
  " call dein#add('ncm2/ncm2')
  " call dein#add('roxma/nvim-yarp') " Dependency
  " call dein#add('ncm2/ncm2-pyclang')
  " call dein#add('ncm2/ncm2-ultisnips')
  " call dein#add('ncm2/ncm2-cssomni')
  " call dein#add('ncm2/ncm2-tern', {'build' : 'npm install'})
  " call dein#add('ncm2/ncm2-html-subscope')
  " call dein#add('ncm2/ncm2-markdown-subscope')
  " call dein#add('ncm2/ncm2-vim')
  " call dein#add('Shougo/neco-vim') " dependency
  " call dein#add('artur-shaik/vim-javacomplete2')
  " call dein#add('OmniSharp/omnisharp-vim')
  " call dein#add('ncm2/ncm2-racer')
  " coc:
  call dein#add('https://github.com/neoclide/coc.nvim')


  " -- Tags
  call dein#add('junegunn/vim-slash')
  call dein#add('majutsushi/tagbar')
  " call dein#add('xolox/vim-easytags')

  " -- Snippets
  call dein#add('SirVer/ultisnips')
  " call dein#add('honza/vim-snippets')
  call dein#add('MarcWeber/vim-addon-mw-utils')
  " call dein#add('autozimu/LanguageClient-neovim', {'build': 'bash install.sh', 'branch': 'next'})
  call dein#add('tomtom/tlib_vim')

  call dein#add('floobits/floobits-neovim')
  call dein#add('FrigoEU/psc-ide-vim')
  call dein#add('purescript-contrib/purescript-vim')
  call dein#add('jceb/vim-orgmode')
  call dein#add('yuratomo/w3m.vim')
  call dein#add('https://github.com/unblevable/quick-scope')

  " -- Context awareness
  call dein#add('Shougo/context_filetype.vim')

  " -- Utils
  call dein#add('https://github.com/chrisbra/NrrwRgn')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('alvan/vim-closetag')
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('euclio/vim-markdown-composer')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('https://github.com/vim-scripts/SyntaxRange')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('francoiscabrol/ranger.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('idris-hackers/idris-vim')
  call dein#add('junegunn/goyo.vim')
  call dein#add('metakirby5/codi.vim')
  call dein#add('munshkr/vim-tidal')
  call dein#add('rbgrouleff/bclose.vim')
  call dein#add('sjl/gundo.vim')
  " call dein#add('terryma/vim-multiple-cursors')
  call dein#add('https://github.com/mg979/vim-visual-multi')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('machakann/vim-sandwich')
  call dein#add('tweekmonster/braceless.vim')
  call dein#add('jaxbot/browserlink.vim')
  " call dein#add('BlackCapCoder/scrimba-vim')
  call dein#add('machakann/vim-highlightedyank')
  call dein#add('https://github.com/kana/vim-arpeggio')

  call dein#add('michalliu/jsruntime.vim')
  call dein#add('michalliu/jsoncodecs.vim')
  call dein#add('michalliu/sourcebeautify.vim')
  call dein#add('xolox/vim-colorscheme-switcher')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('Rip-Rip/clang_complete')
  call dein#add('tpope/vim-dispatch')
  " call dein#add('rhysd/clever-f.vim')
  call dein#add('junegunn/vim-emoji')
  call dein#add('vim-scripts/anwolib')
  call dein#add('tpope/vim-fugitive')
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-pyref')
  call dein#add('keith/swift.vim')
  call dein#add('ervandew/archive')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-repeat')
  " call dein#add('starcraftman/vim-eclim')
  " call dein#add('w0rp/ale')
  call dein#add ('sbdchd/neoformat')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('matze/vim-move')
  call dein#add('markonm/traces.vim')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tommcdo/vim-exchange')
  call dein#add('https://github.com/AndrewRadev/switch.vim')
  call dein#add('https://github.com/osyo-manga/vim-brightest')
  call dein#add('https://github.com/thinca/vim-quickrun')

  " call dein#add('https://github.com/tpope/vim-vinegar')
  call dein#add('https://github.com/andymass/vim-matchup')
  call dein#add('https://github.com/hauleth/sad.vim')
  call dein#add('https://github.com/wellle/targets.vim')
  call dein#add('https://github.com/yuttie/comfortable-motion.vim')
  call dein#add('https://github.com/skywind3000/vim-keysound')
  call dein#add('junegunn/fzf')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('https://github.com/sheerun/vim-polyglot')
  call dein#add('https://github.com/kshenoy/vim-signature')
  call dein#add('https://github.com/nelstrom/vim-visual-star-search')
  call dein#add('https://github.com/machakann/vim-swap')
  call dein#add('https://github.com/tpope/vim-speeddating')
  call dein#add('https://github.com/tpope/vim-endwise')
  " call dein#add('https://github.com/haya14busa/is.vim')
  call dein#add('https://github.com/haya14busa/incsearch.vim')


  " --- Text Objects
  call dein#add('michaeljsmith/vim-indent-object')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('glts/vim-textobj-comment')
  call dein#add('https://github.com/kana/vim-textobj-user')
  call dein#add('https://github.com/coderifous/textobj-word-column.vim')
  call dein#add('https://github.com/gibiansky/vim-textobj-haskell')

  call dein#add('https://github.com/terryma/vim-expand-region')
  call dein#add('https://github.com/ericcurtin/CurtineIncSw.vim')
  " call dein#add('https://github.com/maxbrunsfeld/vim-yankstack')
  call dein#add('https://github.com/andrewradev/splitjoin.vim')
  call dein#add('https://github.com/anschnapp/move-less')


  " ======= Language specific
  " call dein#add('enomsg/vim-haskellConcealPlus',
  "     \ { 'for': 'haskell' })
  " call dein#add('BlackCapCoder/haskellConceal',
  "     \ { 'for': 'haskell' })

  " call dein#add('itchyny/vim-haskell-indent',
  "     \ { 'for': 'haskell' })

  " call dein#add('bitc/vim-hdevtools',
  "     \ { 'for': 'haskell' })

  " call dein#add('autozimu/LanguageClient-neovim', {
  "     \ 'rev': 'next',
  "     \ 'build': 'bash install.sh',
  "     \ })


  call dein#add('fatih/vim-go',
      \{'on_ft': ['go']})

  call dein#add('zchee/deoplete-go',
      \{'on_ft': ['go'], 'build': 'make'})

  call dein#add('alvan/vim-php-manual',
      \{'on_ft': ['php']})

  call dein#add('2072/PHP-Indenting-for-VIm',
      \{'on_ft': ['php']})

  call dein#add('thaerkh/vim-indentguides',
      \{'on_ft': ['go', 'html', 'css', 'sass', 'js', 'php', 'py', 'c', 'cpp', 'h', 'hpp', 'rs', 'java', 'cs']})

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


runtime macros/matchit.vim


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
hi SpellCap ctermbg=black

hi PmenuSel ctermbg=0 ctermfg=1
hi MatchParen ctermfg=green ctermbg=none
hi clear SignColumn
hi HighlightedyankRegion ctermbg=black
hi Conceal ctermbg=none ctermfg=6
hi Noise ctermfg=237
" match Noise /[(){}\[\]]/


let g:gitgutter_map_keys = 0

set nofixendofline
set autoread
set number
set numberwidth=5
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
" set nojoinspaces
set foldmethod=manual
" nvim has default locations for these
" set directory^=$HOME/.vim/tmp//
" set undodir=~/.vim/undo/
set ttyfast
set lazyredraw
set undofile
set undolevels=1000
set undoreload=10000
set history=50
set autoindent
set smartindent
set laststatus=1
set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set noshowcmd
set incsearch
set autowrite " Automatically :write before running commands
set linebreak
set ic
set relativenumber
set splitbelow
set fcs=eob:\ 
set dictionary+=/usr/share/dict/words
set wildmode=longest:full,list:full
set shortmess+=c
set noshowmode
set scrolloff=4
set noautochdir
set conceallevel=1

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=80
let g:qs_lazy_highlight = 1

let g:neoterm_position            = 'horizontal'
let g:neoterm_automap_keys        = ',tt'
let g:closetag_filenames          = "*.html,*.xhtml,*.phtml,*.xml,*.php"
let g:ctrlp_map                   = ''
let g:ranger_map_keys             = 0
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

let g:loaded_matchparen = 1 " Disable parenteces matching for performance
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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <cr> <C-g>u<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! WrapLNext(direction)
  if a:direction == "up"
    try
      lprevious
    catch /^Vim\%((\a\+)\)\=:E553/
      llast
    endtry
  elseif a:direction == "down"
    try
      lnext
    catch /^Vim\%((\a\+)\)\=:E553/
      lfirst
    endtry
  endif
endfunction


" filetype detection and syntax markup
augroup filetypes
  autocmd!

  au BufRead,BufNewFile *.bf     set filetype=brainfuck
  au BufRead,BufNewFile *.bef    set filetype=befunge | source /home/blackcap/.config/nvim/ftplugin/befunge.vim
  au BufRead,BufNewFile *.pyth   set filetype=pyth | set syntax=python
  au BufRead,BufNewFile *.joy    set filetype=joy | set syntax=haskell
  au BufRead,BufNewFile *.abe    set filetype=05AB1E | set syntax=haskell
  au BufRead,BufNewFile *.fr     set filetype=frege | set syntax=haskell
  au BufRead,BufNewFile *.json   setf json
  au BufRead,BufNewFile *.ts     setf typescript
  au BufRead,BufNewFile *.vv     setf V
  au BufRead,BufNewFile *.emojic setf emojicode | set syntax=haskell
  au BufRead,BufNewFile *.agda   setf Agda | set syntax=haskell
  au BufRead,BufNewFile *.masc   setf mascarpone
  au BufRead,BufNewFile *.fmc    setf formality | set syntax=python

  " au BufRead,BufNewFile *.idr setf idris | set syntax=haskell
  au Syntax,BufReadPost,BufNewFile *.hs call SyntaxRange#Include('\[C.block|', '|]', 'c', 'haskell')
augroup END

augroup startup
  autocmd!
  au VimEnter *
    \ Arpeggio inoremap fj <Esc> |
    \ Arpeggio inoremap jk <C-n> |
    \ Arpeggio inoremap df <C-p>
augroup END


" execute buffer for various languages
augroup makeCmd
  autocmd!

  au FileType Agda       call SetComp ('', 'agda %')
  au FileType arduino    call SetComp ('', 'ardc . && ardup')
  au FileType befunge    call SetComp ('', 'befungee %')
  au FileType brainfuck  call SetComp ('', 'bfi %')
  au FileType c          call SetComp ('gcc', 'gcc -O3 % -o %:r && ./%:r')
  au FileType cs         call SetComp ('', 'dotnet run')
  au FileType cpp        call SetComp ('', 'g++ -O3 -std=c++2a -fconcepts % -o %:r && ./%:r')
  au FileType emojicode  call SetComp ('', 'emojicodec % && emojicode %:r.emojib')
  au FileType go         call SetComp ('go', 'go run %')
  au FileType haskell    call SetComp ('stack', 'stack run')
  au FileType idris      call SetComp ('', 'idris % -o %:r && ./%:r')
  au FileType java       call SetComp ('javac', 'javac *.java && java Main')
  au FileType kotlin     call SetComp ('', 'kotlinc *.kt -include-runtime -d Main.jar && java -jar Main.jar')
  au FileType javascript call SetComp ('', 'node %')
  au FileType joy        call SetComp ('', 'joy %')
  au FileType mascarpone call SetComp ('', 'mascarpone %')
  au FileType perl       call SetComp ('perl', 'perl %')
  au FileType php        call SetComp ('php', 'php %')
  au FileType python     call SetComp ('phyton', 'python %')
  au FileType rust       call SetComp ('cargo', 'cargo run %')
  au FileType swift      call SetComp ('', 'swift %')
  au FileType pyth       call SetComp ('', 'python3 /home/blackcap/.config/nvim/interp/pyth/pyth.py %')
  au FileType 05AB1E     call SetComp ('', 'python3 /home/blackcap/.config/nvim/interp/05AB1E/05AB1E.py %')
  au FileType sh         call SetComp ('', 'bash %')
  au FileType zsh        call SetComp ('', 'zsh %')
  au FileType formality  call SetComp ('', 'fmc %:r')

  au FileType c,cpp,java,javascript
        \ vmap <buffer><silent> = :ClangFormat<CR>|
        \ nmap <buffer><silent> = :set opfunc=ClangFormatMotion<CR>g@|
        \ nmap <buffer><silent> == V:ClangFormat<CR>|
        \ nmap <buffer><silent> <F4> :ClangFormat<CR>

augroup END

function! ClangFormatMotion(type)
  silent exec "'[,']ClangFormat"
  silent exec 'let @/=@'
endfunction

function! MakeTerm()
  let cmd='make run'
  if empty(glob("Makefile"))
    let cmd=&makeprg
  endif
  exec 'up|10sp term://'.cmd.' | nmap <buffer><Esc> ZQ'
endfunction

function! SetComp(comp, make)
  if !empty(a:comp)
    exec 'compiler '.a:comp
  endif
  if !empty(a:make)
    let &makeprg=a:make
  endif
endfunction

noremap <silent><C-j> :call MakeTerm()<CR>

let g:quickrun_no_default_key_mappings=1
let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':5sp'},}
noremap <silent><leader>r :QuickRun<CR>
vnoremap <silent><leader>r :QuickRun<CR>


autocmd FileType help setlocal nospell nolist norelativenumber
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " au FocusGained,BufEnter * :checktime

  " Spellcheck text files
  autocmd FileType text,markdown
      \ setlocal spell spelllang=en|
      \ inoremap <buffer> <C-k> <Esc>[s1z=``a|
      \ norm zR
      " \ inoremap <buffer> <bs> <c-w>|
      " \ inoremap <buffer> <C-l> <Esc>[sea<C-x><C-s><C-n>|

  " autocmd FileType text,markdown
  "     \ au InsertEnter * silent exe ":! stenoon" |
      " \ au InsertLeave * silent exe ":! stenooff"

  autocmd FileType emojicode set completefunc=emoji#complete |
        \ setlocal omnifunc=emoji#complete|
        \ inoremap : :<C-x><C-o><C-p>|
        \ inoremap <Esc> <esc>:%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/ge<CR>g;:echo ''<CR>


  autocmd FileType css
    \ vnoremap <buffer> <leader>ss :! css2sass<CR> |
    \ vnoremap <buffer> <leader>cs :! sassc -a \| beautify-css<CR>

  autocmd FileType css nnoremap <buffer> <leader>cc :%! cleancss % \| beautify-css<CR>:%s/,\n/, /g<CR>:nohl<CR>
  autocmd FileType css nnoremap <buffer>  <leader>ss mqggVG:! css2sass<CR>:set filetype=sass<CR>'q
  autocmd FileType sass nnoremap <buffer> <leader>ss mqggVG:! sassc -a \| beautify-css<CR>:set filetype=css<CR>'q

  au FileType html vnoremap <leader>j :BLEvaluateSelection<CR> |
                 \ noremap <leader>j V:BLEvaluateSelection<CR> |
                 \ noremap <leader>k :BLEvaluateWord<CR>

  autocmd FileType javascript vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>
  autocmd FileType css vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>

  " " autocmd FileType java setlocal omnifunc=javacomplete#Complete
  " au User Ncm2Plugin call ncm2#register_source({
  "       \ 'name': 'java',
  "       \ 'priority': 9,
  "       \ 'subscope_enable': 0,
  "       \ 'scope': ['java'],
  "       \ 'mark': 'java',
  "       \ 'on_complete': ['ncm2#on_complete#omni', 'javacomplete#Complete'],
  "       \ })
  "
  " " autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  " au User Ncm2Plugin call ncm2#register_source({
  "       \ 'name': 'cs',
  "       \ 'priority': 9,
  "       \ 'subscope_enable': 0,
  "       \ 'scope': ['cs'],
  "       \ 'mark': 'cs',
  "       \ 'on_complete': ['ncm2#on_complete#omni', 'OmniSharp#Complete'],
  "       \ })

  " autocmd BufWinLeave * silent! mkview
  " autocmd BufWinEnter * silent! loadview
  autocmd BufRead,BufNewFile * set signcolumn=yes

  " au BufEnter * call ncm2#enable_for_buffer()
  " au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  " au User Ncm2PopupClose set completeopt=menuone,preview " ,longest

  au TermOpen * setlocal nonumber norelativenumber noruler noshowmode laststatus=0
augroup END

augroup CapsLockLED
  autocmd!
  autocmd InsertEnter * :silent !xset  led named 'Caps Lock'
  autocmd InsertLeave * :silent !xset -led named 'Caps Lock'
  autocmd VimLeave    * :silent !xset -led named 'Caps Lock'
augroup END

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" ---- Keymaps

" map <leader>i :tabp<cr>
" map <leader>o :tabn<cr>
map <silent><C-l> :call WrapLNext("up")<cr>
map <silent><C-h> :call WrapLNext("down")<cr>
command WQ wq
command Wq wq
command W w
command Q q
command Bo !chromium % &
nmap <F3> :retab<CR>:%s/\s\+$//e<CR>``
" nmap <CR> :CtrlPBuffer<CR>
" nnoremap <Leader><Leader> <C-^>
nnoremap <silent><Leader><Leader> :execute("e ".ctrlp#mrufiles#list()[1])<CR>
nnoremap <silent><C-p> :CtrlP<CR>:<CR>
" nnoremap <Leader>y "+y
" nnoremap <Leader>p "+p

noremap <leader>e :Ranger<CR>

nmap <silent><leader>o :FuzzyOpen<CR>
nmap <silent><leader>f :FuzzyGrep<CR>
" nmap <leader>m :MRU<CR>:nmap <buffer> <Esc <backspace>> ZQ<CR>
nmap <silent><leader>m :CtrlPMRUFiles<CR>

nnoremap Q <nop>
nmap q: :q
nmap Q: :q
cnoremap Q! q!

nnoremap <silent><leader>g :GundoToggle<cr>
" nnoremap <silent><leader>r :TREPLSendFile<cr>
" vnoremap <silent><leader>r :TREPLSendFile<cr>
" nnoremap <silent><leader>l :TREPLSendLine<cr>
" vnoremap <silent><leader>l :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

tnoremap <a-J> <C-\><C-n>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <silent><Leader>c :CodiUpdate<CR>

noremap <silent><leader>hh :%!xxd<CR>
noremap <silent><leader>hr :%!xxd -r<CR>

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
noremap <Left> g;
noremap <Right> g,


" Comfortable motion
let g:comfortable_motion_friction = 400.0
let g:comfortable_motion_air_drag = 4.0
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 0.5  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flickDist(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>

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
nmap sj <Plug>MoveLineDown
nmap sk <Plug>MoveLineUp
vmap <Down> <Plug>MoveBlockDown
vmap <Up> <Plug>MoveBlockUp

vmap H <Plug>(expand_region_shrink)
vmap L <Plug>(expand_region_expand)

" nmap <silent><leader>p :norm viio<c-v><esc>?([^)]*) *\n* *{<c-v><cr>vi)o<c-v><esc><cr>
nmap <silent><leader>p ?([^()]*)<cr>:noh<cr>
nmap <C-t> :CtrlPBufTag<cr>


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

" nmap gm m':call MoveLessMode()<cr>
map gm :call MoveLessMode()<cr>

nmap <leader>c :e ~/.config/nvim/init.vim<cr>
nmap <silent><esc> :silent! onl<cr>

highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 200

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" let g:haskell_indent_disable = 1

vnoremap gn :NR<CR>
nmap  <silent> gn <Plug>NrrwrgnDo

noremap <silent>go :norm o<cr>
noremap <silent>gO :norm O<cr>
