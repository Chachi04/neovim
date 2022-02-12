fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup DeleteWhiteSpaces
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

augroup fmt
    autocmd!
    autocmd BufWritePre * try | undojoin | silent Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 100})
augroup END

augroup CompilePacker
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END

augroup Templates

    autocmd!
    " read in template files
    autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/skeletons/skeleton.'.expand("<afile>:e")

    " parse special text in the templates after the read
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge

augroup END
