require("nvim-ts-autotag").setup()
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		use_languagetree = true, -- Use this to enable language injection
		-- custom_captures = {
		--     -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
		--     ["foo.bar"] = "Identifier",
		-- },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- indent = {
	--     enable = true
	-- },
	rainbow = {
		enable = false,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
