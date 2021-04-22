if exists('g:loaded_runtime_language')
  finish
endif
let g:loaded_runtime_language = 1


" filetype detection and syntax markup
augroup filetypes
  autocmd!

  function! DHall()
    set filetype=dhall
    set syntax=haskell
    ia -> →
    " ia \( λ(
  endfunction

  au BufRead,BufNewFile *.bf     set filetype=brainfuck
  au BufRead,BufNewFile *.bef    set filetype=befunge | source /home/blackcap/.config/nvim/ftplugin/befunge.vim
  au BufRead,BufNewFile *.dhall  exec DHall()
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
  au BufRead,BufNewFile *.rs     set shiftwidth=2
  au BufRead,BufNewFile *.py     set shiftwidth=2
  au BufRead,BufNewFile .clang-format setf yaml

  " au BufRead,BufNewFile *.idr setf idris | set syntax=haskell
  au Syntax,BufReadPost,BufNewFile *.hs call SyntaxRange#Include('\[C.block|', '|]', 'c', 'haskell')
  au Syntax,BufReadPost,BufNewFile *.hs call SyntaxRange#Include('\[bf|', '|]', 'brainfuck', 'NonText')
augroup END


" execute buffer for various languages
augroup makeCmd
  autocmd!

  function! Liquid()
    exec 'up|10sp term://liquid '.expand('%').'' | nmap <buffer><Esc> ZQ
    norm! G
  endfunction

  function! HaskellBuffer()

    setlocal includeexpr=substitute(v:fname,'\\.','/','g').'\.hs'
    setlocal include=^import
    setlocal path+=~/.cabal/packages/hackage.haskell.org/**/

    let opts=''
    let cmd='build'

    let cmd_test='test'
    let cmd_build='build'
    let cmd_run='run'


    if (empty(glob("stack.yaml")))
      let proj='hpack; cabal --allow-newer'
      let comp='ghc'
      let cmd_build='new-build'
      let cmd_run='new-run'
      let cmd_test='new-test'
    else
      let comp='stack'
      let proj='stack'
    end


    if (expand('%:h') == 'test')
      let cmd=cmd_test
    elseif (expand('%:h') == 'app')
      let cmd=cmd_run
    else
      let cmd=cmd_build
    endif

    call SetComp ('ghc', proj.' '.cmd.' '.opts)
    " nm <buffer>gl :call Liquid()<cr>

    " hi link UnicodeKeyword haskellKeyword
    hi link UnicodeKeyword Operator
    syn match UnicodeKeyword /[∀λ∷⇒→←⤙⤚⤛⤜★¬∴∀∁∂∃∄∅∆∇∈∉∊∋∌∍∎∏∐∑−∓∔∕∖∗∘∙√∛∜∝∞∟∠∡∢∣∤∥∦∧∨∩∪∫∬∭∮∯∰∱∲∳∴∵∶∷∸∹∺∻∼∽∾∿≀≁≂≃≄≅≆≇≈≉≊≋≌≍≎≏≐≑≒≓≔≕≖≗≘≙≚≛≜≝≞≟≠≡≢≣≤≥≦≧≨≩≪≫≬≭≮≯≰≱≲≳≴≵≶≷≸≹≺≻≼≽≾≿⊀⊁⊂⊃⊄⊅⊆⊇⊈⊉⊊⊋⊌⊍⊎⊏⊐⊑⊒⊓⊔⊕⊖⊗⊘⊙⊚⊛⊜⊝⊞⊟⊠⊡⊢⊣⊤⊥⊦⊧⊨⊩⊪⊫⊬⊭⊮⊯⊰⊱⊲⊳⊴⊵⊶⊷⊸⊹⊺⊻⊼⊽⊾⊿⋀⋁⋂⋃⋄⋅⋆⋇⋈⋉⋊⋋⋌⋍⋎⋏⋐⋑⋒⋓⋔⋕⋖⋗⋘⋙⋚⋛⋜⋝⋞⋟⋠⋡⋢⋣⋤⋥⋦⋧⋨⋩⋪⋫⋬⋭⋮⋯⋰⋱⋲⋳⋴⋵⋶⋷⋸⋹⋺⋻⋼⋽⋾⋿↫↬ஃ⁂⛬¿]/

    " syn keyword  ∧ ∨ ≡ ≠ ≢ ≤ ≯ ≥ ≮ π / ÷ * ⋅ . ∘ ⧺ ∈ ∉ ⊥

    hi link CustomKeywords HaskellLet
    syn keyword CustomKeyWords signature


    " ia Type ★
    " ia => ⇒
    " ia => ⇒
    " ia :: ∷
    " ia -> →

    ia fa ∀
    ia exi ∃
    ia nexi ∄
    ia ots ⊦

    " ----------

    ia alpha α
    ia beta β
    ia gamma γ
    ia delta δ
    ia epsilon ε
    ia zeta ζ
    ia eta η
    ia theta θ
    ia iota ι
    ia kappa κ
    ia lambda λ
    ia mu μ
    ia nu ν
    ia xi ξ
    ia omicron ο
    ia pi π
    ia rho ρ
    ia sigma σ
    ia sigmac ς
    ia tau τ
    ia upsilon υ
    ia phi φ
    ia chi χ
    ia psi ψ
    ia omega ω

    ia Alpha Α
    ia Beta Β
    ia Gamma Γ
    ia Delta Δ
    ia Epsilon Ε
    ia Zeta Ζ
    ia Eta Η
    ia Theta Θ
    ia Iota Ι
    ia Kappa Κ
    ia Lambda Λ
    ia Mu Μ
    ia Nu Ν
    ia Xi Ξ
    ia Omicron Ο
    ia Pi Π
    ia Rho Ρ
    ia Sigma Σ
    ia Tau Τ
    ia Upsilon Υ
    ia Phi Φ
    ia Chi Χ
    ia Psi Ψ
    ia Omega Ω

    ia A; Α
    ia B; Β
    ia G; Γ
    ia D; Δ
    ia E; Ε
    ia Z; Ζ
    ia I; Ι
    ia K; Κ
    ia L; Λ
    ia M; Μ
    ia N; Ν
    ia O; Ο
    ia P; Π
    ia R; Ρ
    ia S; Σ
    ia T; Τ
    ia Y; Υ
    ia F; Φ
    ia X; Χ
    ia H; Η
    ia W; Ψ
    ia Th; Θ
    ia Xi; Ξ
    ia Om; Ω

    ia a; α
    ia b; β
    ia g; γ
    ia d; δ
    ia e; ε
    ia z; ζ
    ia i; ι
    ia k; κ
    ia l; λ
    ia m; μ
    ia n; ν
    ia o; ο
    ia p; π
    ia r; ρ
    ia s; σ
    ia sc; ς
    ia t; τ
    ia y; υ
    ia f; φ
    ia x; χ
    ia h; η
    ia w; ψ
    ia th; θ
    ia xi; ξ
    ia om; ω

    " --------------

    ia sup0 ⁰
    ia sup1 ¹
    ia sup2 ²
    ia sup3 ³
    ia sup4 ⁴
    ia sup5 ⁵
    ia sup6 ⁶
    ia sup7 ⁶
    ia sup8 ⁸
    ia sup9 ⁹

    ia sub0 ₀
    ia sub1 ₁
    ia sub2 ₂
    ia sub3 ₃
    ia sub4 ₄
    ia sub5 ₅
    ia sub6 ₆
    ia sub7 ₇
    ia sub8 ₈
    ia sub9 ₉

    " --------------

    ia sub ⊂
    ia nsub ⊄
    ia subeq ⊆
    ia nsubeq ⊈
    ia subneq ⊊

    ia sup ⊃
    ia nsup ⊅
    ia supeq ⊇
    ia nsupeq ⊉
    ia supneq ⊋

    ia el ∈
    ia nel ∉

    " ia have ∋
    " ia nhave ∌
    ia uni ∪
    ia isec ∩

    ia lloop ↫
    ia rloop ↬

    ia ori ∘
    ia osta ∗
    ia osun ★
    ia otri ⋄
    ia odot ∙
    ia oand ∧
    ia oor ∨
    ia onot ¬
    ia oeq ≡
    ia oneq ≠
    ia oq ¿
    ia oimp ⇒
    ia oinf ∞
    ia ocube ∛
    ia osqrt √
    ia obot ⊥
    ia otop ⊤
    ia osig ∑
    ia owhe ∴
    ia ogte ≥
    ia olte ≤
    ia ogtne ≩
    ia oltne ≨
    ia onil ∅
    ia odiff ∖
    ia odiv ÷
    ia omult ×

    ia tild ~
    ia perc %
    ia btic `
    ia ope ``
    ia oexp ^
    ia opow ^
    ia bsla \

    ia _k ♔
    ia _q ♕
    ia _r ♖
    ia _b ♗
    ia _n ♘
    ia _p ♙

    ia _K ♚
    ia _Q ♛
    ia _R ♜
    ia _B ♝
    ia _N ♞
    ia _P ♟

    ia ae; æ
    ia aE; Æ
    ia oe; ø
    ia oE; Ø
    ia aa; å
    ia aA; Å


    ia dr deriving
    ia ist instance
    ia dnt deriving newtype instance
    ia dst deriving stock instance
    ia dv deriving via
    ia qua qualified as

    ia jf Functor
    ia ja Applicative
    ia jm Monad
    ia jc Category
    ia jse Semigroup
    ia jmo Monoid
    ia jpo Pointed
    ia jcp Copointed
    ia jcom Comonad
    ia jcoe Coercible
    ia jal Alternative
    ia jfo Foldable
    ia jtr Traversable
    ia jsh Show,
    ia jeq Eq, Ord,
    ia jfft Functor, Foldable, Traversable,
    " ia ;am Applicative, Monad

  endfunction

  function! HaskellYaml()
    if !empty(glob('stack.yaml'))
      call SetComp ('stack', 'stack build')
    endif
  endfunction

  function! HaskellNewFile()
    put='module '.substitute(substitute(expand('%:r'), '[/\\]','.','g'),'^\%(\l*\.\)\?','','').' where'
    1d
    if expand('%') =~ 'Main'
      append

main :: IO ()
main = pure ()
.

    endif
  endfunction

  function! HSigNewFile()
    put='signature '.substitute(substitute(expand('%:r'), '[/\\]','.','g'),'^\%(\l*\.\)\?','','').' where'
    1d
    put=''
  endfunction


  au BufEnter,BufReadPost,FileType haskell call HaskellBuffer()
  au BufReadPost,BufNewFile stack.yaml,package.yaml,*.cabal call HaskellYaml ()
  au BufNewFile *.hs call HaskellNewFile()
  au BufNewFile *.hsig call HSigNewFile()

  au FileType Agda       call SetComp ('', 'agda %')
  au FileType arduino    call SetComp ('', 'ardc . && ardup .')
  au FileType befunge    call SetComp ('', 'befungee %')
  au FileType brainfuck  call SetComp ('', 'bfi %')
  au FileType c          call SetComp ('gcc', 'gcc -O3 % -o %:r && ./%:r')
  au FileType cs         call SetComp ('', 'dotnet run')
  " au FileType cpp        call SetComp ('', 'g++ -O3 -std=c++17 -fconcepts % -o %:r && ./%:r')
  " au FileType cpp        call SetComp ('', 'g++ -O3 -std=c++2a -fconcepts % -o %:r && ./%:r')
  au FileType cpp        call SetComp ('', 'clang++ -O2 -std=c++20 % -o %:r && ./%:r')
  au FileType emojicode  call SetComp ('', 'emojicodec % && emojicode %:r.emojib')
  au FileType go         call SetComp ('go', 'go run %')
  au FileType idris      call SetComp ('', 'idris % -o %:r && ./%:r')
  au FileType java       call SetComp ('javac', 'javac *.java && java Main')
  au FileType kotlin     call SetComp ('', 'kotlinc *.kt -include-runtime -d Main.jar && java -jar Main.jar')
  au FileType javascript call SetComp ('', 'node %')
  au FileType joy        call SetComp ('', 'cat % \| joy')
  au FileType mascarpone call SetComp ('', 'mascarpone %')
  au FileType perl       call SetComp ('perl', 'perl %')
  au FileType php        call SetComp ('php', 'php %')
  au FileType python     call SetComp ('', 'python %')
  au FileType pony       call SetComp ('', 'ponyc -V 0 -b %:t:r && ./%:t:r')
  au FileType rust       call SetComp ('cargo', 'cargo run %')
  au FileType swift      call SetComp ('', 'swift %')
  au FileType pyth       call SetComp ('', 'python3 /home/blackcap/.config/nvim/interp/pyth/pyth.py %')
  au FileType 05AB1E     call SetComp ('', 'python3 /home/blackcap/.config/nvim/interp/05AB1E/05AB1E.py %')
  au FileType sh         call SetComp ('', 'bash %')
  au FileType zsh        call SetComp ('', 'zsh %')
  au FileType formality  call SetComp ('', 'fmc %:r')
  " au FileType llvm       call SetComp ('', 'llc % -o - \| gcc -fPIC -x assembler - -o %:t:r && ./%:t:r')
  au FileType llvm       call SetComp ('', 'clang -Ofast % -o %:t:r && ./%:t:r')
  au FileType asm        call SetComp ('', 'clang -Ofast % -o %:t:r && ./%:t:r')
  au FileType tex        call SetComp ('', 'pdflatex % && pkill -1 mupdf')
  au FileType dhall      call SetComp ('', 'cat % \| dhall')


  au FileType c,cpp,java,javascript
        \ vmap <buffer><silent> = :ClangFormat<CR>|
        \ nmap <buffer><silent> = :set opfunc=ClangFormatMotion<CR>g@|
        \ nmap <buffer><silent> == V:ClangFormat<CR>|
        \ nmap <buffer><silent> <F4> :ClangFormat<CR>


  function! CppNewFile()
    if expand('%') =~ 'main'

      if expand('%:e') == 'cpp'
        0put='#include <iostream>'
      else
        0put='#include <stdio.h>'
      endif

      %put='int main (int argc, const char * argv[])'
      %put='{'
      %put='  return 0;'
      %put='}'
      -1
    endif
  endfunction

  au BufNewFile *.c,*.cpp call CppNewFile()


  function! HeaderNewFile()
    0put='#ifndef '.toupper(expand('%:r')).'_H'
    put='#define '.toupper(expand('%:r')).'_H'
    put=''
    put=''
    $put='#endif // '.toupper(expand('%:r')).'_H'
    4
  endfunction

  au BufNewFile *.h,*.hpp call HeaderNewFile()

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
  exec 'up|10sp term://'.cmd.' | nmap <buffer><Esc> ZQ | norm! G'
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


function! s:show_documentation()
  if (index(['vim','help'], &ft) >= 0)
    execute 'h '.expand('<cword>')
  elseif (index(['c', 'cpp'], &ft) >= 0)
    if execute(':!man -w '.expand('<cword>')) =~ 'No manual entry for'
      call CocAction('doHover')
    else
      norm! K
    endif
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>



let g:quickrun_no_default_key_mappings=1
let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':5sp'},}
noremap <silent><leader>r :QuickRun<CR>
vnoremap <silent><leader>r :QuickRun<CR>


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

  " au FileType html vnoremap <leader>j :BLEvaluateSelection<CR> |
  "                \ noremap <leader>j V:BLEvaluateSelection<CR> |
  "                \ noremap <leader>k :BLEvaluateWord<CR>

  " autocmd FileType javascript vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>
  " autocmd FileType css vmap <leader>j :BLEvaluateSelection<CR> | noremap <leader>j V:BLEvaluateSelection<CR> | noremap <leader>k :BLEvaluateWord<CR>

  " autocmd BufWinLeave * silent! mkview
  " autocmd BufWinEnter * silent! loadview
  " autocmd BufRead,BufNewFile * set signcolumn=yes

  au TermOpen * setlocal nonumber norelativenumber noruler noshowmode laststatus=0
augroup END

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


autocmd FileType help,qf,man call OnHelpBuffer()
function! OnHelpBuffer()
  setlocal nospell nolist norelativenumber nobuflisted
  nmap <buffer> <cr> <c-]>
  " nmap <buffer> <cr> V<c-]>
endfunction


" max scrolloff in help file
" https://github.com/neovim/neovim/issues/11006
autocmd FileType man let orig_scroll_off = &scrolloff | let &scrolloff = 999
autocmd BufEnter * if (index(['help','man'], &ft) >= 0) | let orig_scroll_off = &scrolloff | let &scrolloff = 999 | endif
autocmd BufLeave * if (index(['help','man'], &ft) >= 0) | let &scrolloff = orig_scroll_off | endif

nnoremap <silent>gK :call CocAction('doHover', 'preview')<cr>

" --------

augroup pencil
  autocmd!
  autocmd FileType mardown,mkd call pencil#init({'wrap': 'hard'})
  autocmd FileType text        call pencil#init({'wrap': 'hard'})
augroup END

let g:pencil#autoformat = 1

xmap <A-j> <Plug>(textmanip-move-down-r)
xmap <A-k> <Plug>(textmanip-move-up-r)
xmap <A-h> <Plug>(textmanip-move-left-r)
xmap <A-l> <Plug>(textmanip-move-right-r)

let g:AutoPairsFlyMode = 1
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutBackInsert = '<a-b>'

let g:wheel_no_mappings = 1
nmap <silent> <up> <Plug>(WheelUp)
nmap <silent> <down> <Plug>(WheelDown)

" -----------

function! Lam(...)
  let l:cmd = join (['fu! LAM(...)']+a:000+['endf'], "\n")
  exec l:cmd
  return "LAM"
endfunction

