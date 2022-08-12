require("mason").setup({
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

local servers = {
	"angularls",
	-- "eashls",
	"gopls",
	"grammarly",
	"rust_analyzer",
	"solang",
	"sumneko_lua",
	"clangd",
	"csharp_ls",
	"cssls",
	"dartls",
	"diagnosticls",
	"emmet_ls",
	"html",
	-- "intelephense",
	"jedi_language_server",
	"jsonls",
	"ltex",
	"sqlls",
	"sqls",
	"tailwindcss",
	"tsserver",
	"vuels",
	"phpactor",
	"psalm",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local lspconfig = require("lspconfig")

local configs = {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "on_attach" },
				},
			},
		},
	},
}

for _, lsp in ipairs(servers) do
	local config = configs[lsp] or {}
	config.on_attach = on_attach
	lspconfig[lsp].setup(config)
end

local keymaps = {
	{ "n", "gr", vim.lsp.buf.rename },
	{ "n", "<leader>rn", vim.lsp.buf.rename },
	{ "n", "gx", vim.lsp.buf.code_action },
	{ "x", "gx", vim.lsp.buf.range_code_action },
	{ "n", "K", "<cmd>Lspsaga hover_doc<CR>" },
	{ "n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>" },
	{ "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
	{ "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
	{ "n", "<leader>e", vim.diagnostic.open_float },
}

local options = { noremap = true, silent = true }

for _, args in ipairs(keymaps) do
	vim.keymap.set(args[1], args[2], args[3], options)
end

-- vim.cmd([[
--     augroup lspsaga_filetypes
--         autocmd!
--         autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <C-c> <cmd>close!<cr>
-- ]])

-- vim.api.nvim_create_autocmd("FileType LspsagaHover", {
-- 	command = "nnoremap <buffer><nowait><silent> <c-c> <cmd>close!<cr>",
-- })

-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, options)
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

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
