local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
vim.g.mapleader = " "

local mappings = {
    {"n", "<leader><CR>", '<cmd>Reload<CR><cmd>PackerCompile<CR><cmd>echo "Reload config"<CR>'}, -- reload config
    {"n", "J", "mzJ`z"}, -- better line joining
    -- better undo breaks
    {"i", "<space>", "<space><c-g>u"},
    {"i", ",", ",<c-g>u"},
    {"i", ".", ".<c-g>u"},
    {"i", "!", "!<c-g>u"},
    {"i", "?", "?<c-g>u"},
    -- comments
    {"n", "<leader>c", "<cmd>CommentToggle<CR>"},
    {"n", "<C-/>", "<cmd>CommentToggle<CR>"},
    {"v", "<leader>c", ":CommentToggle<CR>"},
    {"v", "<C-/>", ":CommentToggle<CR>"},
    {"i", "<C-/>", "<cmd>CommentToggle<CR>"},
    -- nvim tree toggle
    {"n", "<C-n>", "<cmd>NvimTreeToggle<CR>"},
    {"n", "<leader>op", "<cmd>NvimTreeToggle<CR>"},
    {"n", "<leader>r", "<cmd>NvimTreeRefresh<CR>"},
    -- vertical resize
    {"n", "<leader>+", "<cmd>vertical resize +5<CR>"},
    {"n", "<leader>-", "<cmd>vertical resize -5<CR>"},
    -- maximizer
    {"n", "<leader>m", "<cmd>MaximizerToggle<CR>"},
    -- toggle terminal
    {"n", "<c-`>", "<cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>"},
    {"n", "<leader>tt", "<cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>"},
    {"n", "<leader>tht", "<cmd>exe v:count1 . 'ToggleTerm direction=horizontal'<CR>"},
    {"n", "<leader>tvt", "<cmd>exe v:count1 . 'ToggleTerm direction=vertical'<CR>"},
    {"t", "<c-`>", "<C-\\><C-n><cmd>exe v:count1 . 'ToggleTerm direction=float'<CR>"},
    -- dap debug
    {"n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>"},
    -- window switching
    {"n", "<C-j>", "<C-w><C-j>"},
    {"n", "<C-k>", "<C-w><C-k>"},
    {"n", "<C-h>", "<C-w><C-h>"},
    {"n", "<C-l>", "<C-w><C-l>"},
    {"n", "<leader>wj", "<C-w><C-j>"},
    {"n", "<leader>wk", "<C-w><C-k>"},
    {"n", "<leader>wh", "<C-w><C-h>"},
    {"n", "<leader>wl", "<C-w><C-l>"},
    {"t", "<C-j>", "<C-\\><C-n><C-w><C-j>"},
    {"t", "<C-k>", "<C-\\><C-n><C-w><C-k>"},
    {"t", "<C-h>", "<C-\\><C-n><C-w><C-h>"},
    {"t", "<C-l>", "<C-\\><C-n><C-w><C-l>"},
    -- line swapping
    {"n", "<A-j>", "<cmd>m .+1<CR>=="},
    {"n", "<A-k>", "<cmd>m .-2<CR>=="},
    {"i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi"},
    {"i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi"},
    {"v", "<A-j>", ":m '>+1<CR>gv=gv"},
    {"v", "<A-k>", ":m '<-2<CR>gv=gv"},
    -- copy/pasting
    {"n", "Y", "y$"},
    {"v", "<leader>y", '"+y'},
    {"n", "<leader>Y", '"+yg_'},
    {"n", "<leader>y", '"+y'},
    {"n", "<leader>p", '"+p'},
    {"n", "<leader>P", '"+P'},
    {"v", "<leader>p", '"+p'},
    {"v", "<leader>P", '"+P'},
    -- select all
    {"n", "<C-a>", "ggVG"},
    -- lsp saga
    {"n", "gr", "<cmd>Lspsaga rename<CR>"},
    {"n", "gx", "<cmd>Lspsaga code_action<CR>"},
    {"x", "gx", ":<C-u>Lspsaga range_code_action<CR>"},
    {"n", "K", "<cmd>Lspsaga hover_doc<CR>"},
    {"n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>"},
    {"n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>"},
    {"n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>"},
    {"n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<C-u>')<CR>"},
    {"n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<C-d>')<CR>"},
    -- telescope
    {"n", "<C-p>", '<cmd>lua require("config.telescope").project_files()<CR>'},
    {"n", "<leader><leader>", '<cmd>lua require("config.telescope").project_files()<CR>'},
    {"n", "<leader>.", '<cmd>lua require("telescope.builtin").file_browser()<CR>'},
    {"n", "<leader>fa", '<cmd>lua require("telescope.builtin").live_grep()<CR>'},
    {"n", "<leader>/", '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts},
    {"n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<CR>'},
    {"n", "<leader>bi", '<cmd>lua require("telescope.builtin").buffers()<CR>'},
    {"n", "<leader>fd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>'},
    {"n", "<leader>vrc", '<cmd>lua require("config.telescope").search_dotfiles()<CR>'},
    {"n", "<leader>fp", '<cmd>lua require("config.telescope").search_dotfiles()<CR>'},
    -- git blame
    {"n", "<leader>gb", "<cmd>G blame --date=relative<CR>"},
    {"n", "<leader>gbl", "<cmd>G blame_line<CR>"}
}

for _, args in pairs(mappings) do
    map(args[1], args[2], args[3], opts)
end

-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {noremap = true, silent = true})

-- map("n", "<leader><CR>", '<cmd>Reload<CR><cmd>PackerCompile<CR><cmd>echo "Reload config"<CR>', opts)
-- map("n", "<leader><CR>", '<cmd>so ~/.config/nvim/init.lua<CR><cmd>echo "Sourced config"<CR>', opts)
-- nnoremap <silent> <leader><CR> :so ~/.config/nvim/init.vim<CR>:echo "init.vim has been sourced successfully"<CR>

if vim.bo.filetype == "cpp" then
    map("n", "<F5>", "<cmd>Run<CR>", opts)
end

-- remind to go to english
vim.cmd "noremap а :echo 'You are in BG'<CR>"
vim.cmd "noremap б :echo 'You are in BG'<CR>"
vim.cmd "noremap в :echo 'You are in BG'<CR>"
vim.cmd "noremap г :echo 'You are in BG'<CR>"
vim.cmd "noremap д :echo 'You are in BG'<CR>"
vim.cmd "noremap е :echo 'You are in BG'<CR>"
vim.cmd "noremap ж :echo 'You are in BG'<CR>"
vim.cmd "noremap з :echo 'You are in BG'<CR>"
vim.cmd "noremap и :echo 'You are in BG'<CR>"
vim.cmd "noremap й :echo 'You are in BG'<CR>"
vim.cmd "noremap к :echo 'You are in BG'<CR>"
vim.cmd "noremap л :echo 'You are in BG'<CR>"
vim.cmd "noremap м :echo 'You are in BG'<CR>"
vim.cmd "noremap н :echo 'You are in BG'<CR>"
vim.cmd "noremap о :echo 'You are in BG'<CR>"
vim.cmd "noremap п :echo 'You are in BG'<CR>"
vim.cmd "noremap р :echo 'You are in BG'<CR>"
vim.cmd "noremap с :echo 'You are in BG'<CR>"
vim.cmd "noremap т :echo 'You are in BG'<CR>"
vim.cmd "noremap у :echo 'You are in BG'<CR>"
vim.cmd "noremap ф :echo 'You are in BG'<CR>"
vim.cmd "noremap х :echo 'You are in BG'<CR>"
vim.cmd "noremap ц :echo 'You are in BG'<CR>"
vim.cmd "noremap ч :echo 'You are in BG'<CR>"
vim.cmd "noremap ш :echo 'You are in BG'<CR>"
vim.cmd "noremap щ :echo 'You are in BG'<CR>"
vim.cmd "noremap ъ :echo 'You are in BG'<CR>"
vim.cmd "noremap ь :echo 'You are in BG'<CR>"
vim.cmd "noremap ю :echo 'You are in BG'<CR>"
vim.cmd "noremap я :echo 'You are in BG'<CR>"

-- map("v", "а", "a", opts)
-- map("v", "б", "b", opts)
-- map("v", "ц", "c", opts)
-- map("v", "д", "d", opts)
-- map("v", "е", "e", opts)
-- map("v", "ф", "f", opts)
-- map("v", "г", "g", opts)
-- map("v", "х", "h", opts)
-- map("v", "и", "i", opts)
-- map("v", "й", "j", opts)
-- map("v", "к", "k", opts)
-- map("v", "л", "l", opts)
-- map("v", "м", "m", opts)
-- map("v", "н", "n", opts)
-- map("v", "о", "o", opts)
-- map("v", "п", "p", opts)
-- map("v", "я", "q", opts)
-- map("v", "р", "r", opts)
-- map("v", "с", "s", opts)
-- map("v", "т", "t", opts)
-- map("v", "у", "u", opts)
-- map("v", "ж", "v", opts)
-- map("v", "в", "w", opts)
-- map("v", "ь", "x", opts)
-- map("v", "ъ", "y", opts)
-- map("v", "з", "z", opts)
-- map("n", "", "<cmd>echo 'Switch to English'<CR>", opts)
-- map("n", "", "<cmd>echo 'Switch to English'<CR>", opts)
-- map("n", "", "<cmd>echo 'Switch to English'<CR>", opts)
-- map("n", "", "<cmd>echo 'Switch to English'<CR>", opts)
