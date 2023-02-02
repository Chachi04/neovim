vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader><CR>", "<cmd>luafile $MYVIMRC<CR><cmd>echo 'init.lua sourced successfully'<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- {{{ netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- }}}

-- {{{ better undo breaks
vim.keymap.set("i", "<space>", "<space><c-g>u")
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
-- }}}

-- {{{ increment/decrement
vim.keymap.set("n", "<leader>=", "<c-a>")
vim.keymap.set("n", "<leader>-", "<c-x>")
-- }}}

-- {{{ window switching
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<leader>wj", "<C-w><C-j>")
vim.keymap.set("n", "<leader>wk", "<C-w><C-k>")
vim.keymap.set("n", "<leader>wh", "<C-w><C-h>")
vim.keymap.set("n", "<leader>wl", "<C-w><C-l>")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w><C-j>")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w><C-k>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w><C-h>")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w><C-l>")
-- }}}

-- {{{ line swapping
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- }}}

-- {{{ copy/pasting -- redundant as clippath is set to unnamedplus
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')
-- }}}

-- {{{ folds
vim.keymap.set("n", "<leader>zz", "za")
vim.keymap.set("n", "<leader>zo", "zR")
vim.keymap.set("n", "<leader>zc", "zM")
vim.keymap.set("v", "<leader>z", "zf")
-- }}}

-- {{{ BG Layout Reminder
vim.keymap.set("n", "а", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "б", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "в", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "г", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "д", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "е", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ж", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "з", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "и", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "й", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "к", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "л", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "м", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "н", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "о", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "п", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "р", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "с", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "т", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "у", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ф", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "х", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ц", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ч", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ш", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "щ", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ъ", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ь", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "ю", ":echo 'You are in BG'<CR>")
vim.keymap.set("n", "я", ":echo 'You are in BG'<CR>")
-- }}}

-- map("n", "<leader><CR>", '<cmd>Reload<CR><cmd>PackerCompile<CR><cmd>echo "Reload config"<CR>', opts)
-- map("n", "<leader><CR>", '<cmd>so ~/.config/nvim/init.lua<CR><cmd>echo "Sourced config"<CR>', opts)
-- nnoremap <silent> <leader><CR> :so ~/.config/nvim/init.vim<CR>:echo "init.vim has been sourced successfully"<CR>

-- if vim.bo.filetype == "cpp" then
-- 	vim.keymap.set("n", "<F5>", "<cmd>Run<CR>", opts)
-- end
