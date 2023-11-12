return {
	"terrortylor/nvim-comment",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	lazy = false,
	keys = {
		{ "<C-/>", ":CommentToggle<CR>", mode = "n", desc = "Toggle Comment", silent = true, noremap = true },
		{ "<C-/>", ":CommentToggle<CR>", mode = "v", desc = "Toggle Comment", silent = true, noremap = true },
		{ "<C-_>", ":CommentToggle<CR>", mode = "n", desc = "Toggle Comment", silent = true, noremap = true },
		{ "<C-_>", ":CommentToggle<CR>", mode = "v", desc = "Toggle Comment", silent = true, noremap = true },
	},
	config = function()
		require("nvim_comment").setup({
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		})
	end,
}
