require("nvim-lsp-installer").setup {
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}

local lspconfig = require("lspconfig")

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
    "intelephense",
    "jedi_language_server",
    "jsonls",
    "ltex",
    "sqlls",
    "sqls",
    "tailwindcss",
    "tsserver",
    "vuels"
}

local configs = {
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {"vim", "on_attach"}
                }
            }
        }
    }
}

for _, lsp in ipairs(servers) do
    local config = configs[lsp] or {}
    config.on_attach = on_attach
    lspconfig[lsp].setup(config)
end

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
