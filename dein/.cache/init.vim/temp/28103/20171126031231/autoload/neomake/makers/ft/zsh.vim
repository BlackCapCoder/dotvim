" vim: ts=4 sw=4 et

function! neomake#makers#ft#zsh#SupersetOf() abort
    return 'sh'
endfunction

function! neomake#makers#ft#zsh#EnabledMakers() abort
    return ['zsh']
endfunction

function! neomake#makers#ft#zsh#shellcheck() abort
    let maker = neomake#makers#ft#sh#shellcheck()
    let maker.args += ['--shell', 'zsh']
    return maker
endfunction

function! neomake#makers#ft#zsh#zsh() abort
    return {
        \ 'args': ['-n'],
        \ 'errorformat': '%E%f:%l: %m'
        \}
endfunction
