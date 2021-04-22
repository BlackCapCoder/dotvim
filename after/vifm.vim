if exists('g:loaded_runtime_vifm')
  finish
endif
let g:loaded_runtime_vifm = 1


let s:vifm_command     = 'vifm'
let s:choice_file_path = '/tmp/chosenfile'

function! OpenVifmIn (path, edit_cmd)
  let currentPath = expand(a:path)
  let rangerCallback = { 'name': 'ranger', 'edit_cmd': a:edit_cmd }
  function! rangerCallback.on_exit(job_id, code, event)
    if a:code == 0
      silent! Bclose!
    endif
    try
      if filereadable(s:choice_file_path)
        for f in readfile(s:choice_file_path)
          exec self.edit_cmd . f
        endfor
        call delete(s:choice_file_path)
      endif
    endtry
  endfunction
  enew
  if isdirectory(currentPath)
    call termopen(s:vifm_command . ' --choose-files ' . s:choice_file_path . ' "' . currentPath . '"', rangerCallback)
  else
    call termopen(s:vifm_command . ' --choose-files ' . s:choice_file_path . ' --select "' . currentPath . '" -c "onl | vs ' . getcwd() . '"', rangerCallback)
  endif
  startinsert
endfunction

command! VifmCurrentFile call OpenVifmIn("%", 'edit ')
command! Vifm VifmCurrentFile

nmap <silent><leader>e :VifmCurrentFile<CR>
