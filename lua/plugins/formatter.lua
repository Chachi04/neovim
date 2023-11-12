return {
	"mhartington/formatter.nvim",
	event = "BufWritePost",
	config = function()
		local formatGroup = vim.api.nvim_create_augroup("Formating", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			command = "FormatWrite",
			group = formatGroup,
		})

		local defaults = require("formatter.defaults")
		local util = require("formatter.util")
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = require("formatter.filetypes.lua").stylua,
				python = require("formatter.filetypes.python").autopep8,
				html = util.withl(defaults.prettier),
				css = util.withl(defaults.prettier, "css"),
				javascript = require("formatter.filetypes.javascript").prettier,
				javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
				typescript = require("formatter.filetypes.typescript").prettier,
				typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
				json = require("formatter.filetypes.json").prettier,
				markdown = require("formatter.filetypes.markdown").prettier,
				cpp = require("formatter.filetypes.cpp").clangformat,
				cs = require("formatter.filetypes.cs").dotnetformat,
				latex = require("formatter.filetypes.latex").latexindent,
				-- php = { exe = "" },
				["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		})
	end,
}
