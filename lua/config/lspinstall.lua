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
    "dartls",
    "gopls",
    "intelephense",
    "rust_analyzer",
    "tailwindcss",
    "diagnosticls",
    "emmet_ls",
    "html",
    "jedi_language_server",
    "jsonls",
    "ltex",
    "solang",
    "tsserver",
    "vuels",
    "cssls",
    "clangd",
    "csharp_ls",
    "sumneko_lua",
    "bashls",
    "sqlls"
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
