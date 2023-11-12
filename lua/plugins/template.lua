return {
	"glepnir/template.nvim",
	cmd = { "Template", "TemProject" },
	keys = {
		{ "<leader>t", "<leader>it" },
	},
	config = function()
		require("template").setup({
			temp_dir = "~/.config/nvim/template",
			author = "Jiaqi Wang",
		})
		require("telescope").load_extension("find_template")
		vim.keymap.set("n", "<leader>t", "<cmd>Telescope find_template<CR>", { noremap = true })
		vim.keymap.set("n", "<leader>it", "<cmd>Telescope find_template type=insert<CR>", { noremap = true })
	end,
}
