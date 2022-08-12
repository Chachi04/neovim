require("nvim_comment").setup({
	hook = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
	marker_padding = true,
	create_mappings = false,
	comment_empty = false,
})

local opts = { noremap = true, silent = true }
local keymaps = {
	{ "n", "<leader>c", "<cmd>CommentToggle<CR>" },
	{ "n", "<C-/>", "<cmd>CommentToggle<CR>" },
	{ "v", "<leader>c", ":CommentToggle<CR>" },
	{ "v", "<C-/>", ":CommentToggle<CR>" },
	{ "i", "<C-/>", "<cmd>CommentToggle<CR>" },
}
for _, args in pairs(keymaps) do
	vim.keymap.set(args[1], args[2], args[3], opts)
end
