-- Highlight on yank
local yank_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=100})",
	group = yank_group,
})

local template_group = vim.api.nvim_create_augroup("Templates", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
	command = "silent! execute '0r ~/.config/nvim/skeletons/skeleton.'.expand('<afile>:e')",
	group = template_group,
})
vim.api.nvim_create_autocmd("BufNewFile", {
	command = "%substitute#\\[:VIM_EVAL:\\]\\(.\\{-\\}\\)\\[:END_EVAL:\\]#\\=eval(submatch(1))#ge",
	group = template_group,
})

local packer_plugins_group = vim.api.nvim_create_augroup("CompilePacker", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
	group = packer_plugins_group,
})

local jinja_group = vim.api.nvim_create_augroup("JinjaHTML", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.html", "*.htm", "*.shtml", "*stm" },
	command = "set ft=html.jinja",
	group = jinja_group,
})

local nvim_tree_auto_close_group = vim.api.nvim_create_augroup("AutoCloseNvimTree", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	command = "if (winnr('$') == 1 && &filetype == 'NvimTree') | q | endif",
	group = nvim_tree_auto_close_group,
})

-- function! RunPython()
--     let file = expand("%")
--     call TermToggle(12)
--     let term_id = b:terminal_job_id
--     call jobsend(term_id, "python3 " . file . "\n")
-- endfunction

-- augroup Python
--     autocmd!
--     au BufEnter *.py nnoremap <silent> <F5> :!python %<CR>
--     au BufEnter *.py let g:pyindent_open_paren = shiftwidth()
--     au BufEnter *.py let g:pyindent_nested_paren = shiftwidth()
--     au BufEnter *.py let g:pyindent_continue = shiftwidth()
--     "     autocmd VimEnter *.py command Run :call RunPython()
-- augroup END

-- augroup Cpp
--     autocmd!
--     " autocmd VimEnter *.cpp command Run lua require"config.term".cpp()
--     " autocmd VimEnter *.cpp set tabstop=2
--     " autocmd VimEnter *.cpp set softtabstop=2
--     " autocmd VimEnter *.cpp set shiftwidth=2
--     autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
-- augroup END

-- augroup Lua
--     autocmd!
--     autocmd VimEnter *.cpp set tabstop=2
--     autocmd VimEnter *.cpp set softtabstop=2
--     autocmd VimEnter *.cpp set shiftwidth=2
-- augroup END

-- augroup Php
--     autocmd!
--     autocmd FileType php setlocal autoindent
-- augroup END
-- augroup Templates
--     autocmd!
--     " read in template files
--     autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/skeletons/skeleton.'.expand("<afile>:e")
--     " parse special text in the templates after the read
--     autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
-- augroup END
