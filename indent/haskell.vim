if exists('g:polyglot_disabled') && index(g:polyglot_disabled, 'haskell') != -1
  finish
endif
finish

" indentation for haskell
"
" author: raichoo (raichoo@googlemail.com)
"
" Modify g:haskell_indent_if and g:haskell_indent_case to
" change indentation for `if'(default 3) and `case'(default 5).
" Example (in .vimrc):
" > let g:haskell_indent_if = 2

if exists('b:did_indent')
  finish
endif

if get(g:, 'haskell_indent_disable', 0)
  finish
endif

let b:did_indent = 1



" if !exists('g:haskell_indent_if')
"   " if x
"   " >>>then ...
"   " >>>else ...
"   let g:haskell_indent_if = 3
" endif
"
" if !exists('g:haskell_indent_case')
"   " case xs of
"   " >>[]     -> ...
"   " >>(y:ys) -> ...
"   let g:haskell_indent_case = 2
" endif
"
" if !exists('g:haskell_indent_let')
"   " let x = 0 in
"   " >>>>x
"   "
"   " let x = 0
"   "     y = 1
"   let g:haskell_indent_let = 4
" endif
"
" if !exists('g:haskell_indent_where')
"   " where f :: Int -> Int
"   " >>>>>>f x = x
"   let g:haskell_indent_where = 6
" endif
"
" if !exists('g:haskell_indent_do')
"   " do x <- a
"   " >>>y <- b
"   let g:haskell_indent_do = 3
" endif
"
" if !exists('g:haskell_indent_in')
"   " let x = 1
"   " >in x
"   let g:haskell_indent_in = 1
" endif
"
" if !exists('g:haskell_indent_guard')
"   " f x y
"   " >>|
"   let g:haskell_indent_guard = 2
" endif
"
" setlocal indentexpr=GetHaskellIndent()
" setlocal indentkeys=!^F,o,O,0{,0},0(,0),0[,0],0,,0=where,0=let,0=deriving,0=in\ ,0=::\ ,0=\-\>\ ,0=\=\>\ ,0=\|\ ,=\=\ 
"
" function! s:isInBlock(hlstack)
"   return index(a:hlstack, 'haskellDelimiter') > -1 || index(a:hlstack, 'haskellParens') > -1 || index(a:hlstack, 'haskellBrackets') > -1 || index(a:hlstack, 'haskellBlock') > -1 || index(a:hlstack, 'haskellBlockComment') > -1 || index(a:hlstack, 'haskellPragma') > -1
" endfunction
"
" function! s:stripComment(line)
"   if a:line =~ '^\s*--\(-*\s\+\|$\)'
"     return ''
"   else
"     let l:stripped = split(a:line, '-- ')
"     if len(l:stripped) > 1
"       return substitute(l:stripped[0], '\s*$', '', '')
"     else
"       return a:line
"     endif
"   endif
" endfunction
"
" function! s:isSYN(grp, line, col)
"   return index(s:getHLStack(a:line, a:col), a:grp) != -1
" endfunction
"
" function! s:getNesting(hlstack)
"   return filter(a:hlstack, 'v:val == "haskellBlock" || v:val == "haskellBrackets" || v:val == "haskellParens" || v:val == "haskellBlockComment" || v:val == "haskellPragma" ')
" endfunction
"
" function! s:getHLStack(line, col)
"   return map(synstack(a:line, a:col), 'synIDattr(v:val, "name")')
" endfunction
"
" " indent matching character
" function! s:indentMatching(char)
"   normal! 0
"   call search(a:char, 'cW')
"   normal! %
"   return col('.') - 1
" endfunction
"
" " backtrack to find guard clause
" function! s:indentGuard(pos, prevline)
"   let l:l = a:prevline
"   let l:c = v:lnum - 1
"   let l:s = indent(l:c)
"
"   while l:c >= 1
"     if l:s == 0 && strlen(l:l) > 0
"       " top-level start, stop looking
"       return g:haskell_indent_guard
"     elseif l:l =~ '^\s\+[|,=]\s\+'
"       " guard block found
"       return match(l:l, '[|,=]')
"     else
"       if l:s > 0 && l:s <= a:pos
"         " found less deeper indentation (not starting with `,` or `=`)
"         " stop looking
"         return l:s + g:haskell_indent_guard
"       endif
"     endif
"     let l:c -= 1
"     let l:l = getline(l:c)
"     let l:s = indent(l:c)
"   endwhile
"
"   return -1
" endfunction
"
" function! GetHaskellIndent()
"   let l:hlstack = s:getHLStack(line('.'), col('.'))
"
"   " do not indent in strings and quasiquotes
"   if index(l:hlstack, 'haskellQuasiQuote') > -1 || index(l:hlstack, 'haskellBlockComment') > -1
"     return -1
"   endif
"
"   let l:prevline = s:stripComment(getline(v:lnum - 1))
"   let l:line     = getline(v:lnum)
"
"   " indent multiline strings
"   if index(l:hlstack, 'haskellString') > -1
"     if l:line =~ '^\s*\\'
"       return match(l:prevline, '["\\]')
"     else
"       return - 1
"     endif
"   endif
"
"   " reset
"   if l:prevline =~ '^\s*$' && l:line !~ '^\s*\S'
"     return 0
"   endif
"
"   "   { foo :: Int
"   " >>,
"   "
"   "   |
"   "   ...
"   " >>,
"   if l:line =~ '^\s*,'
"     if s:isInBlock(s:getHLStack(line('.'), col('.')))
"       normal! 0
"       call search(',', 'cW')
"       let l:n = s:getNesting(s:getHLStack(line('.'), col('.')))
"       call search('[([{]', 'bW')
"       let l:cl = line('.')
"       let l:cc = col('.')
"
"       while l:n != s:getNesting(s:getHLStack(l:cl, l:cc)) || s:isSYN('haskellString', l:cl, l:cc) || s:isSYN('haskellChar', l:cl, l:cc)
"         call search('[([{]', 'bW')
"         let l:cl = line('.')
"         let l:cc = col('.')
"       endwhile
"
"       return l:cc - 1
"     else
"       let l:s = s:indentGuard(match(l:line, ','), l:prevline)
"       if l:s > -1
"         return l:s
"       end
"     endif
"   endif
"
"   " operator at end of previous line
"   if l:prevline =~ '[!#$%&*+./<>?@\\^|~-]\s*$'
"     return indent(v:lnum - 1) + &shiftwidth
"   endif
"
"   " let foo =
"   " >>>>>>bar
"   if l:prevline =~ '\C\<let\>\s\+[^=]\+=\s*$'
"     return match(l:prevline, '\C\<let\>') + g:haskell_indent_let + &shiftwidth
"   endif
"
"   " let x = 1 in
"   " >>>>x
"   if l:prevline =~ '\C\<let\>.\{-}\<in\>\s*$' && l:line !~ '\C^\s*\<in\>'
"     return match(l:prevline, '\C\<let\>') + g:haskell_indent_let
"   endif
"
"   " let x = 1
"   " let y = 2
"   "
"   " let x = 1
"   " >>>>y = 2
"   "
"   " let x = 1
"   " y 2
"   if l:prevline =~ '\C\<let\>\s\+.\+$'
"     if l:line =~ '\C^\s*\<let\>'
"       let l:s = match(l:prevline, '\C\<let\>')
"       if s:isSYN('haskellLet', v:lnum - 1, l:s + 1)
"         return l:s
"       endif
"     elseif l:line =~ '\s=\s'
"       let l:s = match(l:prevline, '\C\<let\>')
"       if s:isSYN('haskellLet', v:lnum - 1, l:s + 1)
"         return l:s + g:haskell_indent_let
"       endif
"     endif
"   endif
"
"   " if handling
"   if l:prevline !~ '\C\<else\>'
"     let l:s = match(l:prevline, '\C\<if\>.*\&.*\zs\<then\>')
"     if l:s > 0
"       return l:s
"     endif
"
"     let l:s = match(l:prevline, '\C\<if\>')
"     if l:s > 0
"       return l:s + g:haskell_indent_if
"     endif
"   endif
"
"   " where
"   " >>foo
"   "
"   if l:prevline =~ '\C\<where\>\s*$'
"     return indent(v:lnum - 1) + get(g:, 'haskell_indent_after_bare_where', &shiftwidth)
"   endif
"
"   " do
"   " >>foo
"   "
"   " foo =
"   " >>bar
"   if l:prevline =~ '\C\(\<do\>\|=\)\s*$'
"     return indent(v:lnum - 1) + &shiftwidth
"   endif
"
"   " do foo
"   " >>>bar
"   if l:prevline =~ '\C\<do\>\s\+\S\+.*$'
"     let l:s = match(l:prevline, '\C\<do\>')
"     if s:isSYN('haskellKeyword', v:lnum - 1, l:s + 1)
"       return l:s + g:haskell_indent_do
"     endif
"   endif
"
"   " case foo of
"   " >>bar -> quux
"   if l:prevline =~ '\C\<case\>.\+\<of\>\s*$'
"     if get(g:,'haskell_indent_case_alternative', 0)
"       return indent(v:lnum - 1) + &shiftwidth
"     else
"       return match(l:prevline, '\C\<case\>') + g:haskell_indent_case
"     endif
"   endif
"
"   "" where foo
"   "" >>>>>>bar
"   ""
"   "" where foo :: Int
"   "" >>>>>>>>>>-> Int
"   ""
"   "" where foo x
"   "" >>>>>>>>|
"   if l:prevline =~ '\C\<where\>\s\+\S\+.*$'
"     if  l:line =~ '^\s*[=-]>\s' && l:prevline =~ ' :: '
"       return match(l:prevline, ':: ')
"     elseif  l:line =~ '^\s*|\s'
"       let l:s = match(l:prevline, '\C\<where\>')
"       if s:isSYN('haskellWhere', v:lnum - 1, l:s + 1)
"         return l:s + g:haskell_indent_where + g:haskell_indent_guard
"       endif
"     else
"       let l:s = match(l:prevline, '\C\<where\>')
"       if s:isSYN('haskellWhere', v:lnum - 1, l:s + 1)
"         return l:s + g:haskell_indent_where
"       endif
"     endif
"   endif
"
"   " newtype Foo = Foo
"   " >>deriving
"   if l:prevline =~ '\C^\s*\<\(newtype\|data\)\>[^{]\+' && l:line =~ '\C^\s*\<deriving\>'
"     return indent(v:lnum - 1) + &shiftwidth
"   endif
"
"   " foo :: Int
"   " >>>>-> Int
"   "
"   " foo
"   "   :: Int
"   " foo
"   if l:prevline =~ '\s::\s'
"     if l:line =~ '^\s*[-=]>'
"       return match(l:prevline, '::\s')
"     elseif match(l:prevline, '^\s\+::') > -1
"       return match(l:prevline, '::\s') - &shiftwidth
"     endif
"   endif
"
"   " foo :: Int
"   "     -> Int
"   " >>>>-> Int
"   "
"   " foo :: Monad m
"   "     => Functor f
"   " >>>>=> Int
"   "
"   " foo :: Int
"   "     -> Int
"   " foo x
"   "
"   " foo
"   "   :: Int
"   "   -> Int
"   " foo x
"   if l:prevline =~ '^\s*[-=]>'
"     if l:line =~ '^\s*[-=]>'
"       return match(l:prevline, '[-=]')
"     else
"       if s:isInBlock(l:hlstack)
"         return match(l:prevline, '[^-=]')
"       else
"         let l:m = matchstr(l:line, '^\s*\zs\<\S\+\>\ze')
"         let l:l = l:prevline
"         let l:c = v:lnum - 1
"
"         while l:c >= 1
"           " fun decl
"           if l:l =~ ('^\s*' . l:m . '\(\s*::\|\n\s\+::\)')
"             let l:s = match(l:l, l:m)
"             if match(l:l, '\C^\s*\<default\>') > -1
"               return l:s - 8
"             else
"               return l:s
"             endif
"           " empty line, stop looking
"           elseif l:l =~ '^$'
"              return 0
"           endif
"           let l:c -= 1
"           let l:l = getline(l:c)
"         endwhile
"
"         return 0
"       endif
"     endif
"   endif
"
"   "   | otherwise = ...
"   " foo
"   "
"   "   | foo
"   " >>, bar
"   "
"   "   | foo
"   " >>= bar
"   "
"   "   | Foo
"   " >>deriving
"   if l:prevline =~ '^\s\+|' && !s:isInBlock(l:hlstack)
"     if l:line =~ '\s*[,=]'
"       return match(l:prevline, '|')
"     elseif l:line =~ '\C^\s*\<deriving\>'
"       return match(l:prevline, '|')
"     elseif l:line !~ '^\s*|'
"       return match(l:prevline, '|') - g:haskell_indent_guard
"     endif
"   endif
"
"   " foo :: ( Monad m
"   "        , Functor f
"   "        )
"   ">>>>>=> Int
"   if l:prevline =~ '^\s*)' && l:line =~ '^\s*=>'
"     let l:s = match(l:prevline, ')')
"     return l:s - (&shiftwidth + 1)
"   endif
"
"   " module Foo
"   " >>( bar
"   if l:prevline =~ '\C^\<module\>'
"     return &shiftwidth
"   endif
"
"   " foo
"   " >>{
"   if l:line =~ '^\s*{'
"     let l:s = indent(v:lnum - 1)
"     if l:s >= 0
"       return l:s + &shiftwidth
"     endif
"   endif
"
"   "  in foo
"   " where bar
"   "
"   " or
"   "
"   " foo
"   " >>where
"   if l:line =~ '\C^\s*\<where\>'
"     if match(l:prevline, '\C^\s\+in\s\+') == 0
"       return match(l:prevline, 'in') - g:haskell_indent_in
"     endif
"
"     return indent(v:lnum - 1) + get(g:, 'haskell_indent_before_where', &shiftwidth)
"   endif
"
"   " let x = 1
"   "     y = 2
"   " >in x + 1
"   if l:line =~ '\C^\s*\<in\>'
"     let l:s = 0
"     let l:c = v:lnum - 1
"
"     while l:s <= 0 && l:c >= 1
"       let l:l = getline(l:c)
"       let l:s = match(l:l, '\C\<let\>')
"       if l:s >= 1 && s:isSYN('haskellLet', l:c, l:s + 1)
"         break
"       elseif l:l =~ '^\S'
"         return -1
"       endif
"       let l:c -= 1
"     endwhile
"     return l:s + g:haskell_indent_in
"   endif
"
"   " data Foo
"   " >>= Bar
"   "
"   "   |
"   "   ...
"   " >>=
"   "
"   " foo
"   " >>=
"   if l:line =~ '^\s*='
"     if l:prevline =~ '\C^\<data\>\s\+[^=]\+\s*$'
"       return match(l:prevline, '\C\<data\>') + &shiftwidth
"     else
"       let l:s = s:indentGuard(match(l:line, '='), l:prevline)
"       if l:s > 0
"         return l:s
"       else
"         return &shiftwidth
"       endif
"     endif
"   endif
"
"   "   |
"   "   ...
"   " >>|
"   "
"   " data Foo = Bar
"   " >>>>>>>>>|
"   if l:line =~ '^\s*|\s'
"     if l:prevline =~ '\C^\s*\<data\>.\+=.\+$'
"       return match(l:prevline, '=')
"     else
"       let l:s = s:indentGuard(match(l:line, '|'), l:prevline)
"       if l:s > -1
"         return l:s
"       endif
"     endif
"   endif
"
"   " foo
"   " >>:: Int
"   if l:line =~ '^\s*::\s'
"     return indent(v:lnum - 1) + &shiftwidth
"   endif
"
"   " indent closing brace, paren or bracket
"   if l:line =~ '^\s*}'
"     return s:indentMatching('}')
"   endif
"
"   if l:line =~ '^\s*)'
"     return s:indentMatching(')')
"   endif
"
"   if l:line =~ '^\s*]'
"     return s:indentMatching(']')
"   endif
"
"   return -1
" endfunction
"

setlocal indentexpr=GetHaskellIndent()
setlocal indentkeys=!^F,o,O,=wher,=deri,0=in,0=class,0=instance,0=data,0=type,0<bar>,0},0],0(,0),0#,0,0==

let s:save_cpo = &cpo
set cpo&vim

function! GetHaskellIndent() abort

  let line = getline(v:lnum)

  " comment
  if s:in_comment()
    let i = s:indent_comment()
    if i >= 0
      return i
    endif
  endif

  " #if, #else, #endif, #include
  if line =~# '\v^\s*(#$|#\s*\w+)'
    return 0
  endif

  " where
  if line =~# '\v<wher%[e]>'
    let i = s:indent_where()
    if i >= 0
      return i
    endif
  endif

  " deriving
  if line =~# '\v<deri%[ving]>'
    if line =~# '\v}\s*deri%[ving]>'
      return s:indent_parenthesis()
    endif
    return s:indent('\v<deri%[ving]>', '\v^.*<data>.*\zs\=', 0)
  endif

  " class, instance
  if line =~# '\v^\s*<(class|instance)>'
    return 0
  endif

  " |
  if line =~# '\v^\s*\||\|(\s*--.*)?$'
    return s:indent_bar()
  endif

  " in
  if line =~# '\v^\s*<in>'
    return s:indent('\v^\s*<in>', '\v^.*<let>\s*\zs', 0, -1)
  endif

  " =
  if line =~# '\v^\s*\='
    return s:indent_eq()
  endif

  " }, ], )
  if line =~# '\v^\s*[})\]]'
    return s:indent_parenthesis()
  endif

  if s:prevnonblank(v:lnum - 1) == 0
    return 0
  endif

  let nonblankline = getline(s:prevnonblank(v:lnum - 1))

  " data, type
  if line =~# '\v^\s*<(data|type)>' && nonblankline !~# '\v<(class|instance)>.*<where>'
    return 0
  endif

  if line =~# '\v^\s*,([^()[\]{}]*|\([^()[\]{}]*\)|\[[^()[\]{}]*\])*(\s*--.*)?$' && nonblankline =~# '\v^\s*,'
    return match(nonblankline, '^\s*\zs,')
  endif

  let line = getline(v:lnum - 1)

  " #if, #else, #endif, #include
  if nonblankline =~# '^\s*#'
    return 0
  endif

  if nonblankline =~# '^\s*--'
    return match(nonblankline, '^\s*\zs--')
  endif

  if nonblankline =~# '\v^\s*}?[^()[\]{}]*[([{]([^()[\]{}]*|\([^()[\]{}]*\)|\[[^()[\]{}]*\])*[-+/*\$&<>,]?(\s*--.*)?$'
    if nonblankline =~# '\v[([{](\s*--.*)?$'
      return match(nonblankline, '\v^\s*(<where>|.*<let>)?\s*\zs') + &shiftwidth
    elseif nonblankline =~# '\v[-+/*\$&<>,](\s*--.*)?$'
      return match(nonblankline, '\v^\s*}?[^()[\]{}]*(\[.*\|\s*\zs|[([{]\s*\zs)')
    elseif nonblankline =~# '\v^[^[\]]*\[([^[\]]*|\[[^[\]]*\])*\|([^[\]]*|\[[^[\]]*\])*(\s*--.*)?$'
      return match(nonblankline, '\v^[^[\]]*\[([^[\]]*|\[[^[\]]*\])*\zs\|')
    else
      return match(nonblankline, '\v^\s*}?[^()[\]{}]*\zs[([{]')
    endif
  endif

  " (
  if getline(v:lnum) =~# '\v^\s*\('
    let lnum = s:prevnonblank(v:lnum - 1)
    if lnum == 0
      return -1
    elseif nonblankline =~# '\v^\s*(<where>|.*<let>).*([-+/*\$&<>=,]+|`\k+`)(\s*--.*)?$'
      return match(nonblankline, '\v^\s*(<where>|<let>)\s*\zs') + &shiftwidth
    elseif nonblankline =~# '\v^\s*(<where>|<let>)'
      return match(nonblankline, '\v^\s*(<where>|<let>)?\s*\zs')
    elseif nonblankline =~# '\v^\s*<import>'
      return indent(lnum) + &shiftwidth
    endif
  endif

  if nonblankline =~# '\v^\s*<infix[rl]?>'
    return match(nonblankline, '\S')
  endif

  if nonblankline =~# '\v^\s*<instance>.*\=\>(\s*--.*)?$'
    return match(nonblankline, '\v^\s*\zs<instance>') + &shiftwidth
  endif

  if nonblankline =~# '\v<do>(\s*--.*)?$'
    return match(nonblankline, '\v^\s*(<where>|.*<let>)?\s*\zs') + &shiftwidth
  endif

  if nonblankline =~# '\v<deriving>'
    return s:indent('', '\v^\s*\zs<data>', 0)
  endif

  if line =~# '\v<if>' && line !~# '\v^\s*#'
    if line !~# '\v<then>'
      return match(line, '\v.*<if>\s*\zs')
    elseif line !~# '\v<else>'
      return match(line, '\v.*\zs<then>')
    endif
  endif

  if line =~# '\v<case>.*<of>.*(\s*--.*)?$' && line !~# '^\s*#'
    if get(g:, 'haskell_indent_disable_case', 0)
      if line =~# '\v^\s*<where>'
        return match(line, '\v^\s*(<where>)?\s*\zs') + &shiftwidth
      else
        return indent(s:prevnonblank(v:lnum - 1)) + &shiftwidth
      endif
    else
      return line =~# '\v<case>.*<of>\s*[[:alnum:](]'
            \ ? match(line, '\v<case>.*<of>\s*\zs\S')
            \ : match(line, '\v.*<case>\s*\zs')
    endif
  endif

  if nonblankline =~# '\v^.*[^|]\|[^|].*\='
    return s:after_guard()
  endif

  if nonblankline =~# '\v[)}\]](\s*--.*)?$'
    return s:unindent_after_parenthesis(s:prevnonblank(v:lnum - 1), match(nonblankline, '\v[)}\]](\s*--.*)?$'))
  endif

  if nonblankline =~# '\v^\s*\|\s*.*\<-\s*.*,(\s*--.*)?$'
    return match(nonblankline, '\v^\s*\|\s*\zs.*\<-\s*.*,(\s*--.*)?$')
  endif

  if nonblankline =~# '\v([-+/*\$&<>=,]+|`\k+`)(\s*--.*)?$'
    if nonblankline =~# '\v^\s*<let>.*,(\s*--.*)?$'
      return match(nonblankline, '\S')
    else
      return match(nonblankline, '\v^\s*(<where>|.*<let>)?\s*\zs') +
            \ (nonblankline =~# '\v(<where>|<let>)|^\s*\k+\s*\=.*([-+/*\$&<>]|`\k+`)(\s*--.*)?$|(\=|-\>)(\s*--.*)?$' ? &shiftwidth : 0)
    endif
  endif

  if nonblankline =~# '\v<where>'
    return s:after_where()
  endif

  if nonblankline =~# '\v<module>' && nonblankline !~# '\v,(\s*--.*)?$' && indent(s:prevnonblank(v:lnum - 1)) < &shiftwidth
    return &shiftwidth
  endif

  if nonblankline =~# '\v<else>'
    let i = s:prevnonblank(v:lnum - 1)
    while i
      let line = getline(i)
      if getline(i) =~# '\v<if>'
        if getline(i) =~# '\v^\s*_\s*-\>'
          let nonblankline = getline(i)
          break
        endif
        return match(line, '\v^\s*\zs')
      endif
      let i -= 1
    endwhile
  endif

  if nonblankline =~# '\v-\>' && line =~# '\v^(\s*--.*)?$' || nonblankline =~# '\v^\s*_\s*-\>'
    let i = s:prevnonblank(v:lnum - 1)
    while i
      let line = getline(i)
      if getline(i) =~# '\v<case>'
        return match(line, '\v^\s*(where\s+)?\zs')
      endif
      let i -= 1
    endwhile
  endif

  if nonblankline =~# '\v^\s*<data>.*\='
    if nonblankline =~# '\v\{-#\s*UNPACK\s*#-}' && getline(v:lnum) =~# '\v^\s*\{-#\s*UNPACK\s*#-}'
      return match(nonblankline, '\v\{-#\s*UNPACK\s*#-}')
    endif
    return s:indent('', '\v^.*<data>.*\zs\=', 0)
  endif

  if nonblankline =~# '\v<let>\s+.*\=' && nonblankline !~# '\v<let>\s+.*\=.*<in>'
    return s:indent('', getline(v:lnum) =~# '\v^\s*(<in>|\S+\s*\=)' ? '\v<let>\s+\zs\S' : '\v<let>', 0)
  endif

  " in
  if nonblankline =~# '\v^\s*<in>'
    return s:indent('', '\v^\s*\zs.*<let>', 0, -1)
  endif

  if nonblankline =~# '::'
    return s:indent('', nonblankline =~# '\v,(\s*--.*)?$' ? '\S' : '\v\{\s*\<\w+\s*::', 0, match(nonblankline, '\S'))
  endif

  if s:prevnonblank(v:lnum - 1) < v:lnum - 2 && line !~# '^\s*#'
    return 0
  elseif s:prevnonblank(v:lnum - 1) < v:lnum - 1 && line !~# '^\s*#'
    let i = s:prevnonblank(v:lnum - 1)
    let where_clause = 0
    let found_where = 0
    let indent = indent(s:prevnonblank(v:lnum - 1))
    while i
      let line = getline(i)
      if substitute(line, '--.*', '', 'g') =~# '\v<where>'
        let found_where = 1
        if indent(i) <= indent
          let where_clause += 1
          if where_clause == v:lnum - s:prevnonblank(v:lnum - 1)
            return match(line, '\v^.*<where>\s*\zs')
          endif
        endif
      endif
      if 0 <= indent(i) && indent(i) < indent && line !~# '\v<where>|^\s*\||^$'
        return line =~# '\v^\s*[([{]' ? indent : indent(i)
      endif
      if line =~# '\v^\s*<(class|instance)>' && found_where
        return match(line, '\v^\s*<(class|instance)>') + &shiftwidth
      elseif line =~# '^\S'
        return 0
      endif
      let i -= 1
    endwhile
    return 0
  endif

  if indent(s:prevnonblank(s:prevnonblank(v:lnum - 1) - 1)) < indent(s:prevnonblank(v:lnum - 1))
        \ && nonblankline =~# '\v^\s*[-+/*$&<>=]' || getline(s:prevnonblank(s:prevnonblank(v:lnum - 1) - 1)) =~# '\v\=(\s*--.*)?$'
    return indent(s:prevnonblank(s:prevnonblank(v:lnum - 1) - 1))
  endif

  return indent(s:prevnonblank(v:lnum - 1))

endfunction

" prevnonblank with skipping macros
function! s:prevnonblank(lnum) abort
  let i = a:lnum
  while i > 0
    let i = prevnonblank(i)
    if getline(i) !~# '\v^\s*#\s*\w+'
      return i
    endif
    let i -= 1
  endwhile
  return 0
endfunction

" a general indent function by searching the pattern upward
function! s:indent(linepattern, pattern, diff, ...) abort
  let i = s:prevnonblank(v:lnum - 1)
  if i < v:lnum - 1
    return 0
  endif
  if getline(v:lnum) =~# a:linepattern
    while i > 0
      let line = getline(i)
      if line =~# a:pattern
        return match(line, a:pattern) + a:diff
      elseif line =~# '^\S'
        return a:0 ? a:1 : -1
      endif
      let i -= 1
    endwhile
  endif
  return -1
endfunction

" the cursor is in comment
function! s:in_comment() abort
  if getline(v:lnum) =~# '^\s*--'
    return 1
  endif
  let start = searchpos('\v(--.*)@<!\{-', 'bcnW')
  let pos = getpos('.')
  let end = searchpos('-}', 'bcnW')
  return start != [0, 0] && (start[0] < pos[1] || start[0] == pos[1] && start[1] <= pos[2])
        \ && (end == [0, 0] || end[0] < start[0] || end[0] == start[0] && end[1] < start[1])
endfunction

" comment
function! s:indent_comment() abort
  if getline(s:prevnonblank(v:lnum - 1)) =~# '\v\{-#\s*UNPACK\s*#-}' && getline(v:lnum) =~# '\v^\s*\{-#\s*UNPACK\s*#-}'
    return match(getline(s:prevnonblank(v:lnum - 1)), '\v\{-#\s*UNPACK\s*#-}')
  elseif getline(v:lnum) =~# '\v^\s*\{-#\s*<RULES>(\s*--.*)?$'
    let name = matchstr(getline(v:lnum + 1), '\v^\s*"\zs\k+\ze(/\k+)*"')
    if name !=# ''
      let i = v:lnum - 1
      while i
        if getline(i) =~# '\v^\s*(where\s+)?<' . name . '>.*\='
          return match(getline(i), '\v^\s*(<where>)?\s*\zs')
        endif
        let i -= 1
      endwhile
    endif
  endif
  if getline(v:lnum) =~# '\v^\s*\{-#\s*<(INLINE|RULES)>'
    return -1
  elseif getline(v:lnum) =~# '\v^\s*(\{- \||\{-#.*#-}(\s*--.*)?$|-- -{10,})'
    return 0
  endif
  if getline(v:lnum) =~# '^\s*[-{]-'
    let i = v:lnum
    if getline(i) =~# '^\s*--'
      while i <= line('$') && (getline(i) =~# '^\s*--' || getline(i) ==# '')
        let i += 1
      endwhile
      if getline(i) =~# '\v^\s*<(class|instance|data)>|::.*(-\>|-- *\^)'
        return match(getline(i), '^\s*\zs\S')
      endif
    endif
    let i = s:prevnonblank(v:lnum - 1)
    let previndent = 0
    while i > 0
      let line = getline(i)
      let indent = indent(i)
      if line =~# '^\s*[-{]-'
        return indent
      elseif line =~# '\v^\s*<(class|instance)>|^\s*<where>(\s*--.*)?$' && line !~# '\v,(\s*--.*)?$'
        return indent + &shiftwidth
      elseif line =~# '\v\s*\((\s*--.*)?$'
        return previndent ? previndent : indent + &shiftwidth
      elseif line =~# '^\S' && line !~# '^\s*#'
        return 0
      endif
      let previndent = indent
      let i -= 1
    endwhile
  endif
  let listpattern = '\v^\s*(\* \@|[a-z]\)\s+|\>\s+)'
  if getline(v:lnum) =~# listpattern
    if getline(s:prevnonblank(v:lnum - 1)) =~# listpattern
      return indent(s:prevnonblank(v:lnum - 1))
    else
      if getline(v:lnum) =~# '\v^\s*[a-z]\)\s+'
        let i = s:prevnonblank(v:lnum - 1)
        let indent = indent(i)
        while 0 < i && indent(i) == indent
          let i -= 1
        endwhile
        if 0 < i && getline(i) =~# '\v^\s*[a-z]\)\s+'
          return indent(i)
        endif
      endif
      return indent(s:prevnonblank(v:lnum - 1)) + &shiftwidth
    endif
  endif
  if getline(v:lnum - 1) =~# '\v^\s*[a-z]\)\s+'
    return match(getline(v:lnum - 1), '\v^\s*[a-z]\)\s+\zs')
  endif
  if getline(v:lnum) !~# '\v^(\s*--.*)?$' && getline(s:prevnonblank(v:lnum - 1)) =~# listpattern
    return indent(s:prevnonblank(v:lnum - 1)) - &shiftwidth
  endif
  if getline(v:lnum) =~# '^\s*[-{]-'
    return 0
  endif
  let line = getline(s:prevnonblank(v:lnum - 1))
  if line =~# '\v^\s*\{-#\s*(\s+\w+,?)+'
    if line =~# '\v,(\s*--.*)?$'
      return match(line, '\v\zs<\w+,')
    else
      return match(line, '\v\w+\s+\zs<\w+') - &shiftwidth
    endif
  endif
  let i = s:prevnonblank(v:lnum - 1)
  if i < v:lnum - 1
    let indent = indent(i)
    while 0 < i && indent(i) == indent
      let i -= 1
    endwhile
    if 0 < i && getline(i) =~# '\v^\s*[a-z]\)\s+'
      return indent(i) - &shiftwidth
    endif
  endif
  if getline(v:lnum) =~# '\v^\s*(#?-}|#$)'
    let i = v:lnum - 1
    while 0 < i
      if getline(i) =~# '{-'
        return match(getline(i), '{-')
      endif
      let i -= 1
    endwhile
  endif
  return indent(s:prevnonblank(v:lnum - 1))
endfunction

" |
function! s:indent_bar() abort
  if getline(v:lnum) !~# '^\s*|'
    return -1
  endif
  let i = s:prevnonblank(v:lnum - 1)
  let indent = indent(i)
  while i > 0
    let line = getline(i)
    if line =~# '\v^[^[\]]*([^[\]]*|\[[^[\]]*\])*\[([^[\]]*|\[[^[\]]*\])*(--.*)?$'
      return match(line, '\v^[^[\]]*([^[\]]*|\[[^[\]]*\])*\zs\[([^[\]]*|\[[^[\]]*\])*(--.*)?$') + &shiftwidth
    elseif line =~# '\v^\s*(<where>)?.*[^|]\|[^|].*\='
      return match(line, '\v^\s*(<where>)?.*[^|]\zs\|[^|].*\=')
    elseif line =~# '\v<data>.*\='
      return match(line, '\v^.*<data>.*\zs\=')
    elseif line =~# '\v^\s*<where>(\s*--.*)?$' && indent(i) < indent || line =~# '^\S'
      return indent + &shiftwidth
    elseif line =~# '\v^\s*<where>\s+\S'
      return match(line, '\v^\s*<where>\s+\zs\S') + &shiftwidth
    elseif line =~# '\v[^|]\|[^|].*-\>'
      return match(line, '\v[^|]\zs\|[^|].*-\>')
    elseif line =~# '^\s*='
      return match(line, '^\s*\zs=')
    endif
    let indent = indent(i)
    let i = s:prevnonblank(i - 1)
  endwhile
endfunction

" guard
function! s:after_guard() abort
  let nonblankline = getline(s:prevnonblank(v:lnum - 1))
  let line = getline(v:lnum - 1)
  if line =~# '\v^(\s*--.*)?$'
    if s:prevnonblank(v:lnum - 1) < v:lnum - 2
      return 0
    endif
    let i = v:lnum - 1
    let where_clause = 0
    while i
      let line = getline(i)
      if line =~# '^\S'
        return 0
      endif
      if where_clause && line !~# '\v^(\s*--.*)?$' && line !~# '\v^\s*\|[^|]'
        return match(line, '\v^\s*(<where>)?\s*\zs')
      endif
      if line =~# '\v<where>'
        let where_clause = 1
      endif
      let i -= 1
    endwhile
  endif
  if nonblankline =~# '\v[^|]\|\s*(otherwise|True|0\s*\<\s*1|1\s*\>\s*0)' || getline(v:lnum) =~# '^\s*\S'
    let i = s:prevnonblank(v:lnum - 1)
    while i
      let line = getline(i)
      if line !~# '\v^(\s*--.*)?$' && line !~# '^\s*|'
        return match(line, '\v^\s*(<where>)?\s*\zs')
      endif
      let i -= 1
    endwhile
  elseif nonblankline =~# '\v^\s*<data>.*\='
    return match(line, '\v^.*<data>.*\zs\=')
  else
    return match(line, '\v^.*[^|]\zs\|[^|].*\=')
  endif
endfunction

" =
function! s:indent_eq() abort
  return match(getline(s:prevnonblank(v:lnum - 1)), '\v^\s*(<where>|<let>)?\s*\zs') + &shiftwidth
endfunction

" }, ], )
function! s:indent_parenthesis() abort
  let view = winsaveview()
  execute 'normal! ' v:lnum . 'gg^'
  let end = getpos('.')
  normal! %
  let begin = getpos('.')
  call setpos('.', end)
  call winrestview(view)
  if begin[1] == end[1]
    return -1
  endif
  if indent(end[1] - 1) + 1 < begin[2]
    return match(getline(begin[1]), '\v^\s*(<where>|.*<let>)?\s*\zs')
  endif
  return begin[2] - 1
endfunction

" unindent after closed parenthesis
function! s:unindent_after_parenthesis(line, column) abort
  let i = s:prevnonblank(v:lnum - 1)
  if i < v:lnum - 2
    return 0
  endif
  let pos = getpos('.')
  let view = winsaveview()
  execute 'normal! ' a:line . 'gg' . (a:column + 1)  . '|'
  normal! %
  let begin = getpos('.')
  call setpos('.', pos)
  call winrestview(view)
  if getline(begin[1]) =~# '\v<deriving>'
    let i = begin[1]
    while i
      let line = getline(i)
      if getline(i) =~# '\v<data>'
        return match(line, '\v<data>')
      elseif line =~# '^\S'
        return -1
      endif
      let i -= 1
    endwhile
  elseif getline(begin[1]) =~# '^\s*='
    return match(getline(s:prevnonblank(begin[1] - 1)), '\v^\s*(<where>|<let>)?\s*\zs')
  elseif getline(s:prevnonblank(begin[1] - 1)) =~# '\v\=(\s*--.*)?$'
    return match(getline(s:prevnonblank(begin[1] - 1)), '\v^\s*(<where>|<let>)?\s*\zs')
  elseif getline(s:prevnonblank(begin[1] - 1)) =~# '\v<import>'
    return 0
  endif
  return match(getline(begin[1]), '\v^\s*(<where>)?\s*\zs')
endfunction

" where
function! s:indent_where() abort
  if getline(v:lnum) =~# '\v^\s*<wher%[e]>'
    let i = s:prevnonblank(v:lnum - 1)
    while i > 0
      let line = getline(i)
      if line =~# '\v^\s*(<where>)?\s*\zs\h.*\=|^\s*[^| ]'
        return match(line, '\v^\s*(<where>)?\s*\zs\h.*\=|^\s*[^| ]') + &shiftwidth
      elseif line =~# '^\S'
        return -1
      endif
      let i -= 1
    endwhile
  elseif getline(v:lnum) =~# '\v^\s*\)\s*<wher%[e]>'
    let pos = getpos('.')
    let view = winsaveview()
    execute 'normal! ' (match(getline(v:lnum), ')') + 1)  . '|%'
    let begin = getpos('.')
    call setpos('.', pos)
    call winrestview(view)
    if getline(begin[1]) =~# '\v(<module>|<class>|<instance>)'
      return indent(begin[1]) + &shiftwidth
    elseif getline(s:prevnonblank(begin[1] - 1)) =~# '\v(<module>|<class>|<instance>)'
      return indent(s:prevnonblank(begin[1] - 1)) + &shiftwidth
    elseif getline(begin[1]) =~# '\v^\s*\((--.*)?'
      return indent(begin[1])
    endif
  elseif getline(v:lnum) =~# '\v^\s*(<module>|<class>|<instance>)'
    return 0
  elseif getline(v:lnum) =~# '\v<where>\s*(--.*)?'
    let i = s:prevnonblank(v:lnum - 1)
    if i > 0
      let line = getline(i)
      if line =~# '\v^\s*(<module>|<class>|<instance>)'
        return indent(i) + &shiftwidth
      endif
    endif
  endif
  return -1
endfunction

" where
function! s:after_where() abort
  let line = getline(s:prevnonblank(v:lnum - 1))
  if line =~# '\v^\s*\)\s*<where>(\s*--.*)?$'
    let pos = getpos('.')
    let view = winsaveview()
    execute 'normal! ' s:prevnonblank(v:lnum - 1) . 'gg^%'
    let begin = getpos('.')
    call setpos('.', pos)
    call winrestview(view)
    let i = getline(begin[1]) =~# '^\s*(' ? s:prevnonblank(begin[1] - 1) : begin[1]
    if i > 0 && getline(i) =~# '\v(<module>|<class>|<instance>)'
      return 0
    endif
  endif
  if line =~# '\v<where>(\s*--.*)?$'
    let i = s:prevnonblank(v:lnum - 1)
    while i > 0
      let line = getline(i)
      if line =~# '\v^\s*<module>'
        return 0
      elseif line =~# '\v^\s*(<class>|<instance>|<data>)'
        if line =~# '\v<where>(\s*--.*)?$' && i != s:prevnonblank(v:lnum - 1)
          break
        endif
        return match(line, '\v(<class>|<instance>|<data>)') + &shiftwidth
      elseif line =~# '\v^(\S|\s*\k+\s*\=)' && line !~# '^--'
        return match(getline(s:prevnonblank(v:lnum - 1)), '\v<where>') + &shiftwidth
      endif
      let i -= 1
    endwhile
  endif
  if line =~# '\v^\s*<where>'
    if s:prevnonblank(v:lnum - 1) < v:lnum - 2
      return 0
    elseif s:prevnonblank(v:lnum - 1) < v:lnum - 1
      let i = s:prevnonblank(v:lnum - 1) - 1
      let indent = indent(s:prevnonblank(v:lnum - 1))
      while i
        let line = getline(i)
        if line =~# '^\S'
          return 0
        elseif indent(i) < indent
          return match(line, '\v^\s*(<where>)?\s*\zs')
        endif
        let i -= 1
      endwhile
      return 0
    endif
    return match(line, '\v<where>\s*\zs')
  endif
  if getline(s:prevnonblank(v:lnum - 1)) =~# '\v^\s*<where>(\s*--.*)?$'
    return indent(s:prevnonblank(v:lnum - 1)) + &shiftwidth
  endif
  return indent(s:prevnonblank(v:lnum - 1))
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
