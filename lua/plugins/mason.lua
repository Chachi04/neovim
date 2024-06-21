-- Customize Mason plugins

---@type LazySpec
return {
    -- use mason-lspconfig to configure LSP installations
    {
        "williamboman/mason-lspconfig.nvim",
        -- overrides `require("mason-lspconfig").setup(...)`
        opts = function(_, opts)
            -- add more things to the ensure_installed table protecting against community packs modifying it
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "lua_ls",
                -- add more arguments for adding more language servers
                "texlab",
                "ltex",
                "rust_analyzer",
                "java_language_server",
                "marksman",
                "intelephense",
                "jedi_language_server",
                "grammarly",
                "dockerls",
                "diagnosticls",
                "cssls",
                "cssmodules_ls",
                "css_variables",
                "clangd",
                "cmake",
                "emmet_ls",
                "eslint",
                "html",
                "jdtls",
                "jsonls",
                "lemminx",
                "phpactor",
                "pyright",
                "tailwindcss",
                "taplo",
                "tsserver",
            })
        end,
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        -- overrides `require("mason-null-ls").setup(...)`
        opts = function(_, opts)
            -- add more things to the ensure_installed table protecting against community packs modifying it
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "prettier",
                "stylua",
                -- add more arguments for adding more null-ls sources
                "stylelint",
                "bacon",
                "proselint",
                "misspell",
                "htmlhint",
                "luacheck",
                "jsonlint",
                "curlylint",
                "cspell",
                "phpstan",
                "vale",
                "flake8",
                "eslint_d",
                "checkstyle",
                "selene",
                "markdown-toc",
                "latexindent",
                "htmlbeautifier",
                "doctoc",
                "docformatter",
                "clang-format",
                "blade-formatter",
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = function(_, opts)
            -- add more things to the ensure_installed table protecting against community packs modifying it
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "python",
                -- add more arguments for adding more debuggers
            })
        end,
    },
}
