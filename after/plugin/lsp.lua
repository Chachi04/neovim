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

require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "on_attach" },
			},
		},
	},
	capabilities = capabilities,
})
lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.emmet_ls.setup({ capabilities = capabilities })
lspconfig.eslint.setup({ capabilities = capabilities })
lspconfig.html.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.tsserver.setup({ capabilities = capabilities })
lspconfig.ltex.setup({ capabilities = capabilities })
lspconfig.sqlls.setup({ capabilities = capabilities })
lspconfig.tailwindcss.setup({ capabilities = capabilities })
lspconfig.volar.setup({ capabilities = capabilities })
-- lspconfig.psalm.setup({})
lspconfig.intelephense.setup({ capabilities = capabilities })
lspconfig.phpactor.setup({ capabilities = capabilities })

local options = { noremap = true, silent = true }
vim.keymap.set("n", "gr", vim.lsp.buf.rename, options)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
vim.keymap.set("n", "gx", vim.lsp.buf.code_action, options)
-- vim.keymap.set("x", "gx", vim.lsp.buf.range_code_action, options)
vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
-- vim.keymap.set("n", "go", vim.lsp.buf.show_line_diagnostics, options)
-- vim.keymap.set("n", "gj", vim.lsp.buf., options)
-- vim.keymap.set("n", "gk", vim.lsp.buf., options)
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, options)

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
