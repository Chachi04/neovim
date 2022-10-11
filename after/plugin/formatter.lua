local formatGroup = vim.api.nvim_create_augroup("Formating", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "FormatWrite",
	group = formatGroup,
})

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = require("formatter.filetypes.lua").stylua,
		python = require("formatter.filetypes.python").autopep8,
		html = require("formatter.filetypes.html").prettier,
		css = require("formatter.filetypes.css").prettier,
		javascript = require("formatter.filetypes.javascript").prettier,
		javascriptreact = require("formatter.filetypes.javascriptreact").prettier,
		typescript = require("formatter.filetypes.typescript").prettier,
		typescriptreact = require("formatter.filetypes.typescriptreact").prettier,
		json = require("formatter.filetypes.json").prettier,
		markdown = require("formatter.filetypes.markdown").prettier,
		cpp = require("formatter.filetypes.cpp").clangformat,
		cs = require("formatter.filetypes.cs").dotnetformat,
		-- php = { exe = "" },
		["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
	},
})
