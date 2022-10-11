require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false,
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"pyright",
		"clangd",
		"cssls",
		"emmet_ls",
		"eslint",
		"html",
		"tsserver",
	},
	automatic_installation = true,
})

local lspconfig = require("lspconfig")

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
	end,
}

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "on_attach" },
			},
		},
	},
})
lspconfig.pyright.setup({})
lspconfig.clangd.setup({})
lspconfig.cssls.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.tsserver.setup({})

local options = { noremap = true, silent = true }
vim.keymap.set("n", "gr", vim.lsp.buf.rename, options)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
vim.keymap.set("n", "gx", vim.lsp.buf.code_action, options)
vim.keymap.set("x", "gx", vim.lsp.buf.range_code_action, options)
vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
-- vim.keymap.set("n", "go", vim.lsp.buf.show_line_diagnostics, options)
-- vim.keymap.set("n", "gj", vim.lsp.buf., options)
-- vim.keymap.set("n", "gk", vim.lsp.buf., options)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, options)

require("copilot").setup({
	server_opts_overrides = {
		trace = "verbose",
		settings = {
			editor = {
				showEditorCompletions = true,
			},
			advanced = {
				inlineSuggestCount = 5, -- #completions for getCompletions
			},
		},
	},
})

require("copilot_cmp").setup()
-- { "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
-- { "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },

-- use the same configuration you would use for `vim.lsp.diagnostic.on_publish_diagnostics`.
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--     vim.lsp.with(
--     require("lsp_extensions.workspace.diagnostic").handler,
--     {
--         signs = {
--             severity_limit = "Error"
--         }
--     }
-- )

-- -- Get the counts from your curreent workspace:
-- local ws_errors = require("lsp_extensions.workspace.diagnostic").get_count(0, "Error")
-- local ws_hints = require("lsp_extensions.workspace.diagnostic").get_count(0, "Hint")

-- -- Set the qflist for the current workspace
-- --  For more information, see `:help vim.lsp.diagnostic.set_loc_list()`, since this has some of the same configuration.
-- if (ws_errors ~= 0 or ws_hints ~= 0) then
--     require("lsp_extensions.workspace.diagnostic").set_qf_list()
-- -- print("has err or hints")
-- end
