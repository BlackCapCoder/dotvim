if exists('g:loaded_runtime_colors')
  finish
endif
let g:loaded_runtime_colors = 1


" I don't like themes with backgrounds
colorscheme molokai-transparent
hi TabLine ctermfg=white ctermbg=black
hi TabLineFill ctermfg=black


" I change the terminal colors based on the system background image
hi Identifier cterm=bold
hi Function cterm=bold
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

" hi Noise ctermfg=237
hi Noise ctermfg=4
" match Noise /[(){}\[\]]/

highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:highlightedyank_highlight_duration = 200

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
