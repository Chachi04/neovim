return {
	"tamton-aquib/staline.nvim",
	config = function()
		vim.opt.laststatus = 3
		require("staline").setup({
			defaults = {
				line_column = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
				-- line_column = "[%l/%L] :%c並", -- `:h stl` to see all flags.

				--bg = "#202328", -- Default background is transparent.
				bg = "none",
				inactive_color = "#303030",
				-- inactive_color = "#282828",
				inactive_bgcolor = "none",
				true_colors = true, -- true lsp colors.
				font_active = "none", -- "bold", "italic", "bold,italic", etc

				mod_symbol = "  ",
				lsp_client_symbol = " ",
				branch_symbol = " ",
				cool_symbol = " ", -- Change this to override default OS icon.
				null_ls_symbol = "", -- A symbol to indicate that a source is coming from null-ls
			},
			mode_colors = {
				n = "#2bbb4f",
				i = "#986fec",
				c = "#e27d60",
				v = "#4799eb", -- etc..
			},
			mode_icons = {
				n = " ",
				i = " ",
				c = " ",
				v = " ",
				V = " ",
				[""] = " ",
				R = " ",
				t = " ",
			},
			sections = {
				left = { "- ", "-mode", "left_sep_double", " ", "branch" },
				mid = { "file_name" },
				right = { "cool_symbol", "lsp_name", "lsp", "right_sep_double", "-line_column" },
			},
			special_table = {
				NvimTree = { "NvimTree", " " },
				packer = { "Packer", " " }, -- etc
				dashboard = { "Dashboard", "  " },
				help = { "Help", "龎" },
				qf = { "QuickFix", " " },
				alpha = { "Alpha", "  " },
				Jaq = { "Jaq", "  " },
				Fm = { "Fm", "  " },
				TelescopePrompt = { "Telescope", "  " },
			},
			lsp_symbols = {
				Error = " ",
				Info = " ",
				Warn = " ",
				Hint = "",
			},
		})
	end,
}
