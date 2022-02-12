augroup Cpp
    autocmd!
    " autocmd VimEnter *.cpp command Run lua require"config.term".cpp()
    " autocmd VimEnter *.cpp set tabstop=2
    " autocmd VimEnter *.cpp set softtabstop=2
    " autocmd VimEnter *.cpp set shiftwidth=2
    autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
augroup END

augroup Lua
    autocmd!
    autocmd VimEnter *.cpp set tabstop=2
    autocmd VimEnter *.cpp set softtabstop=2
    autocmd VimEnter *.cpp set shiftwidth=2
augroup END


function! RunPython()
    let file = expand("%")
    call TermToggle(12)
    let term_id = b:terminal_job_id
    call jobsend(term_id, "python3 " . file . "\n")
endfunction

" augroup Python
"     autocmd!
"     autocmd VimEnter *.py command Run :call RunPython()
" augroup END
