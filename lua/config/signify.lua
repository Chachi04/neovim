vim.g.signify_sign_add = "+"
vim.g.signify_sign_delete = "_"
vim.g.signify_sign_delete_first_line = "‾"
vim.g.signify_sign_change = "~"
vim.g.signify_sign_show_count = 0
vim.g.signify_sign_show_text = 1
local map = vim.api.nvim_set_keymap
map("n", "<leader>gj", "<plug>(signify-next-hink)", {noremap = false})
map("n", "<leader>gk", "<plug>(signify-prev-hink)", {noremap = false})
-- nmap <leader>gJ 9999<leader>gJ
-- nmap <leader>gK 9999<leader>gk
