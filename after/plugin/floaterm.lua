local opts = { noremap = true, silent = true }
local keymaps = {
	{ "n", "<c-`>", "<cmd>Lspsaga toggle_floaterm<CR>" },
	{ "t", "<c-`>", "<C-\\><C-n><cmd>Lspsaga toggle_floaterm<CR>" },
}
for _, args in pairs(keymaps) do
	vim.keymap.set(args[1], args[2], args[3], opts)
end
