require("staline").setup({
	defaults = {
		expand_null_ls = false, -- This expands out all the null-ls sources to be shown
		left_separator = "",
		right_separator = "",
		full_path = false,
		line_column = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
		-- line_column = "[%l/%L] :%c並", -- `:h stl` to see all flags.

		fg = "#000000", -- Foreground text color.
		bg = "none", -- Default background is transparent.
		inactive_color = "#303030",
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
		t = " ", -- etc..
		-- n = " normal",
		-- i = " insert",
		-- c = " command",
		-- v = " visual",
		-- V = " line",
		-- [""] = " block",
		-- R = " replace",
		-- t = " terminal", -- etc..
	},
	sections = {
		left = { "- ", "-mode", "left_sep_double", " ", "branch" },
		mid = { "file_name" },
		right = { "cool_symbol", "lsp_name", " ", "lsp", "right_sep_double", "-line_column" },
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
