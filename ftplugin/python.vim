au BufEnter *.py nnoremap <silent> <F5> :!python %<CR>
au BufEnter *.py let g:pyindent_open_paren = 'shiftwidth() * 2'
au BufEnter *.py let g:pyindent_nested_paren = 'shiftwidth()'
au BufEnter *.py let g:pyindent_continue = 'shiftwidth() * 2'
