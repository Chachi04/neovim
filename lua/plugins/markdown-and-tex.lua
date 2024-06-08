return {
    { import = "astrocommunity.markdown-and-latex.vimtex" },
    {
        "lervag/vimtex",
        config = function()
            vim.g.tex_compile = false
            local toggle_latex_compile = function()
                vim.g.tex_compile = not vim.g.tex_compile
                if vim.g.tex_compile then
                    vim.cmd ":VimtexCompile"
                else
                    vim.cmd ":VimtexStopAll"
                    vim.cmd ":VimtexClean"
                end
            end

            vim.g.vimtex_view_general_viewer = "evince"

            vim.api.nvim_create_augroup("VimTex", { clear = true })

            vim.api.nvim_create_autocmd("BufReadPre", {
                desc = "Set vimtex main file",
                pattern = "*.tex",
                group = "VimTex",
                callback = function() vim.g.vimtex_main = vim.fn.expand "%:p" end,
            })

            -- vim.api.nvim_create_augroup("Latex", { clear = true })
            vim.api.nvim_create_autocmd("BufEnter", {
                desc = "Compile latex on save",
                pattern = "*.tex",
                group = "VimTex",
                callback = function()
                    vim.keymap.set("n", "<f3>", toggle_latex_compile, { noremap = true, silent = true, buffer = true })
                end,
            })

            vim.api.nvim_create_autocmd("VimLeavePre", {
                desc = "Clean vimtex",
                pattern = "*.tex",
                group = "VimTex",
                callback = function() vim.cmd ":VimtexClean" end,
            })
        end,
    },
    -- { import = "astrocommunity.markdown-and-latex.peek-nvim" },
    {
        "toppair/peek.nvim",
        -- event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            vim.g.peek_open = false

            local toggle_peek = function()
                if not vim.g.peek_open then
                    require("peek").open()
                else
                    require("peek").close()
                end
                vim.g.peek_open = not vim.g.peek_open
            end

            -- vim.api.nvim_create_augroup("Peek", { clear = true })
            -- vim.api.nvim_create_autocmd("BufEnter", {
            --     desc = "Open peek for markdown",
            --     pattern = "*.md",
            --     group = "Peek",
            --     callback = require("peek").open,
            -- })
            --
            -- vim.api.nvim_create_autocmd("BufLeave", {
            --     desc = "Close peek when exiting markdown",
            --     pattern = "*.md",
            --     group = "Peek",
            --     callback = require("peek").close,
            -- })

            vim.keymap.set("n", "<f3>", toggle_peek, { noremap = true, silent = true, buffer = true })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
