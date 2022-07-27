" Neoformat take care of this
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup DeleteWhiteSpaces
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END



augroup CompilePacker
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END


augroup Jinja
    autocmd!
    autocmd BufNewFile,BufRead *.html,*htm,*.shtml,*stm set ft=html.jinja
augroup END

function! RunPython()
    let file = expand("%")
    call TermToggle(12)
    let term_id = b:terminal_job_id
    call jobsend(term_id, "python3 " . file . "\n")
endfunction

augroup Python
    autocmd!
    au BufEnter *.py nnoremap <silent> <F5> :!python %<CR>
    au BufEnter *.py let g:pyindent_open_paren = shiftwidth()
    au BufEnter *.py let g:pyindent_nested_paren = shiftwidth()
    au BufEnter *.py let g:pyindent_continue = shiftwidth()
    "     autocmd VimEnter *.py command Run :call RunPython()
augroup END

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

augroup Php
    autocmd!
    autocmd FileType php setlocal autoindent
augroup END
