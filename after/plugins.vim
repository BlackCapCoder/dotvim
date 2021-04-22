if exists('g:loaded_runtime_plugins')
  finish
endif
" let g:loaded_runtime_plugins = 1


" " Required:
" if dein#load_state('/home/blackcap/.config/nvim/dein/.')
"   call dein#begin('/home/blackcap/.config/nvim/dein/.')
"
"   " Let dein manage dein
"   " Required:
"   call dein#add('/home/blackcap/.config/nvim/dein/./repos/github.com/Shougo/dein.vim')

if dein#load_state('/home/blackcap/.cache/dein')
  call dein#begin('/home/blackcap/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/blackcap/.cache/dein/repos/github.com/Shougo/dein.vim')


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
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})


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

  " call dein#add('floobits/floobits-neovim')
  call dein#add('FrigoEU/psc-ide-vim')
  call dein#add('purescript-contrib/purescript-vim')
  call dein#add('jceb/vim-orgmode')
  " call dein#add('yuratomo/w3m.vim')
  call dein#add('https://github.com/unblevable/quick-scope')

  " -- Context awareness
  call dein#add('Shougo/context_filetype.vim')

  " -- Utils
  " call dein#add('https://github.com/typeintandem/nvim')
  call dein#add('https://github.com/chrisbra/NrrwRgn')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('alvan/vim-closetag')
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('ctrlpvim/ctrlp.vim')
  " call dein#add('euclio/vim-markdown-composer')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('https://github.com/vim-scripts/SyntaxRange')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('jiangmiao/auto-pairs')
  " call dein#add('francoiscabrol/ranger.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('idris-hackers/idris-vim')
  " call dein#add('bilalq/lite-dfm')
  " call dein#add('metakirby5/codi.vim')
  " call dein#add('munshkr/vim-tidal')
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
  " call dein#add('https://github.com/kana/vim-arpeggio')

  call dein#add('michalliu/jsruntime.vim')
  call dein#add('michalliu/jsoncodecs.vim')
  " call dein#add('michalliu/sourcebeautify.vim')
  call dein#add('xolox/vim-colorscheme-switcher')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('Rip-Rip/clang_complete')
  " call dein#add('tpope/vim-dispatch')
  " call dein#add('rhysd/clever-f.vim')
  " call dein#add('junegunn/vim-emoji')
  call dein#add('vim-scripts/anwolib')
  call dein#add('tpope/vim-fugitive')
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-pyref')
  call dein#add('keith/swift.vim')
  call dein#add('ervandew/archive')
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-repeat')
  call dein#add ('sbdchd/neoformat')
  " call dein#add('airblade/vim-gitgutter')
  " call dein#add('matze/vim-move')
  call dein#add('markonm/traces.vim')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tommcdo/vim-exchange')
  call dein#add('https://github.com/AndrewRadev/switch.vim')
  call dein#add('https://github.com/osyo-manga/vim-brightest')
  call dein#add('https://github.com/thinca/vim-quickrun')
  call dein#add('vmchale/dhall-vim')

  call dein#add('https://github.com/andymass/vim-matchup')
  call dein#add('https://github.com/hauleth/sad.vim')
  call dein#add('https://github.com/wellle/targets.vim')

  call dein#add('junegunn/fzf')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('https://github.com/sheerun/vim-polyglot')
  " call dein#add('https://github.com/kshenoy/vim-signature')
  call dein#add('https://github.com/nelstrom/vim-visual-star-search')
  call dein#add('https://github.com/machakann/vim-swap')
  call dein#add('https://github.com/tpope/vim-speeddating')
  call dein#add('https://github.com/tpope/vim-endwise')
  call dein#add('https://github.com/haya14busa/incsearch.vim')
  " call dein#add('https://github.com/haya14busa/is.vim')

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
  call dein#add('https://github.com/yuttie/comfortable-motion.vim')

  call dein#add('https://github.com/preservim/vim-pencil')
  call dein#add('https://github.com/preservim/vim-wheel')

  call dein#add('https://github.com/t9md/vim-textmanip')
  call dein#add('https://github.com/b4winckler/vim-angry')

  " call dein#add('https://github.com/bounceme/poppy.vim')
  " call dein#add('https://github.com/luochen1990/rainbow')
  "
  call dein#add('https://github.com/preservim/nerdtree')


  " ======= Language specific
  " call dein#add('enomsg/vim-haskellConcealPlus',
  "     \ { 'for': 'haskell' )
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

  " call dein#add('thaerkh/vim-indentguides',
  "     \{'on_ft': ['go', 'html', 'css', 'sass', 'js', 'php', 'py', 'c', 'cpp', 'h', 'hpp', 'rs', 'java', 'cs']})

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

