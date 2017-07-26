au BufNewFile,BufRead *.{js,jsm,es,es6},Jakefile setf javascript

fun! s:SourceFlowSyntax()
  if !exists('javascript_plugin_flow') && !exists('b:flow_active') &&
        \ search('\v\C%^\_s*%(//\s*|/\*[ \t\n*]*)\@flow>','nw')
    runtime extras/flow.vim
    let b:flow_active = 1
  endif
endfun
au FileType javascript au BufRead,BufWritePost <buffer> call s:SourceFlowSyntax()

fun! s:SelectJavascript()
  if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?node\>'
    set ft=javascript
  endif
endfun
au BufNewFile,BufRead * call s:SelectJavascript()
autocmd BufRead,BufNewFile *.rs setlocal filetype=rust
if has('nvim')
  aug set_repl_cmd
    au!
    " Ruby and Rails
    au FileType ruby,eruby
          \ if executable('bundle') && filereadable('config/application.rb') |
          \   call neoterm#repl#set('bundle exec rails console') |
          \ elseif executable(g:neoterm_repl_ruby) |
          \   call neoterm#repl#set(g:neoterm_repl_ruby) |
          \ end
    " Python
    au FileType python
          \ let s:argList = split(g:neoterm_repl_python) |
          \ if len(s:argList) > 0 && executable(s:argList[0]) |
          \   call neoterm#repl#set(g:neoterm_repl_python) |
          \ elseif executable('ipython') |
          \   call neoterm#repl#set('ipython --no-autoindent') |
          \ elseif executable('python') |
          \   call neoterm#repl#set('python') |
          \ end
    " JavaScript
    au FileType javascript
          \ if executable('node') |
          \   call neoterm#repl#set('node') |
          \ end
    " Elixir
    au FileType elixir
          \ if filereadable('config/config.exs') |
          \   call neoterm#repl#set('iex -S mix') |
          \ elseif &filetype == 'elixir' |
          \   call neoterm#repl#set('iex') |
          \ endif
    " Julia
    au FileType julia
          \ if executable('julia') |
          \   call neoterm#repl#set('julia') |
          \ end
    " PARI/GP
    au FileType gp
          \ if executable('gp') |
          \   call neoterm#repl#set('gp') |
          \ end
    " R
    au FileType r,rmd
          \ if executable('R') |
          \   call neoterm#repl#set('R') |
          \ end
    " Octave
    au FileType octave
          \ if executable('octave') |
          \   if executable('octave-cli') |
          \     if g:neoterm_repl_octave_qt |
          \       call neoterm#repl#set('octave --no-gui') |
          \     else |
          \       call neoterm#repl#set('octave-cli') |
          \     end |
          \   else |
          \     call neoterm#repl#set('octave') |
          \   end |
          \ end
    " MATLAB
    au FileType matlab
          \ if executable('matlab') |
          \   call neoterm#repl#set('matlab -nodesktop -nosplash') |
          \ end
    " Idris
    au FileType idris,lidris
          \ if executable('idris') |
          \   call neoterm#repl#set('idris') |
          \ end
    " Haskell
    au FileType haskell
          \ if executable('stack') |
          \ call neoterm#repl#set('stack ghci') |
          \ elseif executable('ghci') |
          \   call neoterm#repl#set('ghci') |
          \ end
    au FileType php
          \ let s:argList = split(g:neoterm_repl_php) |
          \ if len(s:argList) > 0 && executable(s:argList[0]) |
          \   call neoterm#repl#set(g:neoterm_repl_php) |
          \ elseif executable('psysh') |
          \   call neoterm#repl#set('psysh') |
          \ elseif executable('php') |
          \   call neoterm#repl#set('php -a') |
          \ end
    " Clojure
    au FileType clojure
          \ if executable('lein') |
          \   call neoterm#repl#set('lein repl') |
          \ end
    " Lua
    au FileType lua
          \ if executable('luap') |
          \   let s:lua_repl='luap' |
          \ elseif executable('lua') |
          \   let s:lua_repl='lua' |
          \ endif |
          \ if executable('luarocks') && exists("s:lua_repl") |
          \   call neoterm#repl#set(s:lua_repl . " -l\"luarocks.require\"") |
          \ endif
    " TCL
    au FileType tcl
          \ if executable('tclsh') |
          \   call neoterm#repl#set('tclsh') |
          \ endif
    " Standard ML (SML)
    au FileType sml
          \ if executable('sml') |
          \   if executable('rlwrap') |
          \     call neoterm#repl#set('rlwrap sml') |
          \   else |
          \     call neoterm#repl#set('sml') |
          \   endif |
          \ endif
  aug END
end
au BufRead,BufNewFile *.hsc set filetype=haskell
au BufRead,BufNewFile *.bpk set filetype=haskell
au BufRead,BufNewFile *.hsig set filetype=haskell
au BufRead,BufNewFile *.rs set filetype=rust
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
" We take care to preserve the user's fileencodings and fileformats,
" because those settings are global (not buffer local), yet we want
" to override them for loading Go files, which are defined to be UTF-8.
let s:current_fileformats = ''
let s:current_fileencodings = ''

" define fileencodings to open as utf-8 encoding even if it's ascii.
function! s:gofiletype_pre(type)
  let s:current_fileformats = &g:fileformats
  let s:current_fileencodings = &g:fileencodings
  set fileencodings=utf-8 fileformats=unix
  let &l:filetype = a:type
endfunction

" restore fileencodings as others
function! s:gofiletype_post()
  let &g:fileformats = s:current_fileformats
  let &g:fileencodings = s:current_fileencodings
endfunction

au BufNewFile *.go setfiletype go | setlocal fileencoding=utf-8 fileformat=unix
au BufRead *.go call s:gofiletype_pre("go")
au BufReadPost *.go call s:gofiletype_post()

au BufNewFile *.s setfiletype asm | setlocal fileencoding=utf-8 fileformat=unix
au BufRead *.s call s:gofiletype_pre("asm")
au BufReadPost *.s call s:gofiletype_post()

au BufRead,BufNewFile *.tmpl set filetype=gohtmltmpl

" vim: sw=2 ts=2 et
autocmd BufRead,BufNewFile *.tidal setfiletype haskell.tidal
" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} set filetype=markdown
" Detect syntax file.
autocmd BufNewFile,BufRead *.b,*.brainfuck  setfiletype brainfuck
