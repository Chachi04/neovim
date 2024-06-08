-- Customize Treesitter
---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        -- add more things to the ensure_installed table protecting against community packs modifying it
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
            "lua",
            "vim",
            "bash",
            "css",
            "html",
            "java",
            "javascript",
            "typescript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luap",
            "markdown",
            "markdown_inline",
            "php",
            "phpdoc",
            "python",
            "query",
            "rust",
            "toml",
            "tsx",
            "vimdoc",
            "c",
            -- add more arguments for adding more treesitter parsers
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }
    end,
}
