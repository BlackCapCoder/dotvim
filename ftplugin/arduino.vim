
function! OpenSerial()
  exec '10sp term://minicom -b 9600 -D /dev/ttyACM1' | nmap <buffer><Esc> ZQ'
endfunction

noremap <silent><C-k> :call OpenSerial()<CR>G