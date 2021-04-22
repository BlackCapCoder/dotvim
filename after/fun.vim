
if exists ('g:loaded_runtime_fun')
  finish
endif
let g:loaded_runtime_fun = 1

" ----------


" let s:id = { a -> a }
"
"
" let s:run = { f -> f () }
"
"
" fu s:Id (a)
"   return a:a
" endfu
"
"
" fu Gimme (id)
"   return a:id (2)
" endfu
"
"
" call Gimme (Id)
"
"
" " echo (Id (2))
"
"
" " call s:id (2)
"
