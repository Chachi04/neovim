local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "

map("n", "<leader><CR>", '<cmd>Reload<CR><cmd>PackerCompile<CR><cmd>echo "Reload config"<CR>', opts)
-- map("n", "<leader><CR>", '<cmd>so ~/.config/nvim/init.lua<CR><cmd>echo "Sourced config"<CR>', opts)
-- nnoremap <silent> <leader><CR> :so ~/.config/nvim/init.vim<CR>:echo "init.vim has been sourced successfully"<CR>

map("n", "J", "mzJ`z", opts)

map("i", "<space>", "<space><c-g>u", opts)
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("i", "!", "!<c-g>u", opts)
map("i", "?", "?<c-g>u", opts)

map("n", "<leader>c", "<cmd>CommentToggle<CR>", opts)
map("n", "<C-_>", "<cmd>CommentToggle<CR>", opts)
map("v", "<leader>c", ":CommentToggle<CR>", opts)
map("v", "<C-_>", ":CommentToggle<CR>", opts)
map("i", "<C-_>", "<cmd>CommentToggle<CR>", opts)

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>op", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)

map("n", "<leader>+", "<cmd>vertical resize +5<CR>", opts)
map("n", "<leader>-", "<cmd>vertical resize -5<CR>", opts)

map("n", "<leader>m", "<cmd>MaximizerToggle<CR>", opts)

map("n", "<C-j>", "<C-w><C-j>", opts)
map("n", "<C-k>", "<C-w><C-k>", opts)
map("n", "<C-h>", "<C-w><C-h>", opts)
map("n", "<C-l>", "<C-w><C-l>", opts)
map("n", "<leader>wj", "<C-w><C-j>", opts)
map("n", "<leader>wk", "<C-w><C-k>", opts)
map("n", "<leader>wh", "<C-w><C-h>", opts)
map("n", "<leader>wl", "<C-w><C-l>", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w><C-j>", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", opts)
map("t", "<C-h>", "<C-\\><C-n><C-w><C-h>", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w><C-l>", opts)

map("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

map("n", "Y", "y$", opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+yg_', opts)
map("n", "<leader>y", '"+y', opts)

map("n", "<leader>p", '"+p', opts)
map("n", "<leader>P", '"+P', opts)
map("v", "<leader>p", '"+p', opts)
map("v", "<leader>P", '"+P', opts) -- "

map("n", "<C-a>", "ggVG", opts)

if vim.bo.filetype == "cpp" then
    map("n", "<F5>", "<cmd>Run<CR>", opts)
end

map("n", "<C-p>", '<cmd>lua require("config.telescope").project_files()<CR>', opts)
map("n", "<leader><leader>", '<cmd>lua require("config.telescope").project_files()<CR>', opts)
map("n", "<leader>.", '<cmd>lua require("telescope.builtin").file_browser()<CR>', opts)
map("n", "<leader>fa", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map("n", "<leader>/", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map("n", "<leader>bi", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map("n", "<leader>fd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
map("n", "<leader>vrc", '<cmd>lua require("config.telescope").search_dotfiles()<CR>', opts)
map("n", "<leader>fp", '<cmd>lua require("config.telescope").search_dotfiles()<CR>', opts)

map("n", "<leader>gb", "<cmd>G blame --date=relative<CR>", opts)
