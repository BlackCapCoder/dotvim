se autoread
se autowrite

augroup sync_autocmd
  autocmd!

  au FocusLost   *   silent!! up
  au FocusGained *   silent!! checktime
  au CursorHold  *   silent!! up|checktime

  au TextChanged  * silent!! up
  au InsertLeave * silent!! up
  au CursorMoved  * silent!! checktime

  au FileReadPost *  silent!! rshada
  au FileWritePost * silent!! wshada

augroup END
"
" call SyntaxRange#Include('// .*', '// .*', 'c', 'NonText')
" au FileType qf nm <buffer> <cr> V<C-]>


" function OnData (ch,d,n)
"   echo a:ch
"   echomsg a:d[0]
" endfunction
"
" function CursorSrv ()
"   let addr = "::1:12345"
"   try
"     call serverstart (addr)
"   catch
"     let sock = sockconnect ("tcp", addr, {"on_data": {c,d,n -> OnData (c,d,n)}})
"     call chansend (sock, ["hello"])
"   endtry
" endfunction
" call CursorSrv ()
"
" au RemoteReply echo "reply"

