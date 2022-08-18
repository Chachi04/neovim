require("nvim-ts-autotag").setup()
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		use_languagetree = true, -- Use this to enable language injection
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- indent = {
	-- 	enable = true,
	-- },
	rainbow = {
		enable = false,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
