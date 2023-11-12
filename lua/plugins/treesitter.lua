return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex", "tex" },
				additional_vim_regex_highlighting = false,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
				config = {
					fish = { __default = "# %s", __multiline = "# %s" },
					blade = { __default = "{{-- %s --}}" },
				},
			},
		})
	end,
}
