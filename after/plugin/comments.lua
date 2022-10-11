require("nvim_comment").setup({
	hook = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
	marker_padding = true,
	create_mappings = false,
	comment_empty = false,
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>c", "<cmd>CommentToggle<CR>", opts)
vim.keymap.set("n", "<C-/>", "<cmd>CommentToggle<CR>", opts)
vim.keymap.set("v", "<leader>c", ":CommentToggle<CR>", opts)
vim.keymap.set("v", "<C-/>", ":CommentToggle<CR>", opts)
vim.keymap.set("i", "<C-/>", "<cmd>CommentToggle<CR>", opts)
