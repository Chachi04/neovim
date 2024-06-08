-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = true, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = false, -- sets vim.opt.spell
                signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                wrap = false, -- sets vim.opt.wrap

                tabstop = 4, -- sets vim.opt.tabstop
                softtabstop = 4, -- sets vim.opt.softtabstop
                shiftwidth = 4, -- sets vim.opt.shiftwidth
                shiftround = true, -- sets vim.opt.shiftround
                -- cindent = true, -- sets vim.opt.cindent
                wildignorecase = true, -- sets vim.opt.wildignorecase
                swapfile = false, -- sets vim.opt.swapfile
                scrolloff = 10, -- sets vim.opt.scrolloff
            },
            g = { -- vim.g.<key>
                autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                cmp_enabled = true, -- enable completion at start
                autopairs_enabled = true, -- enable autopairs at start
                diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
                icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                copilot_enabled = true, -- enable copilot at startbled =
                ui_notifications_enabled = true, -- disable notifications when toggling UI elements
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- navigate buffer tabs with `H` and `L`
                L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
                H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

                -- make cursor stay when concatting with J
                J = { "mzJ`z" },

                -- Fix C-c after copilot plugin
                ["<C-c>"] = { "<Esc>" },

                -- mappings seen under group name "Buffer"
                ["<Leader>bD"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Pick to close",
                },
                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                ["<Leader>b"] = { desc = "Buffers" },
                -- quick save
                -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
                --
                -- Telescope
                ["<C-p>"] = {
                    function() require("telescope.builtin").find_files() end,
                    desc = "Telescope find_files",
                },
                ["<Leader><Leader>"] = {
                    function() require("telescope.builtin").git_files() end,
                    desc = "Telescope git_files",
                },
                ["<Leader>/"] = {
                    function() require("telescope.builtin").live_grep() end,
                    desc = "Telescope live_grep",
                },
                ["<Leader>fd"] = {
                    function() require("telescope.builtin").lsp_definitions() end,
                    desc = "Telescope lsp_definitions",
                },

                ["<Leader>u"] = { "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo tree" },

                ["<C-n>"] = { "<cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" },

                -- Comments
                ["<C-/>"] = {
                    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
                    desc = "Comment line",
                },
                ["<C-_>"] = {
                    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
                    desc = "Comment line",
                },

                -- Line Swapping
                ["<A-j>"] = { "<cmd>m .+1<CR>==" },
                ["<A-k>"] = { "<cmd>m .-2<CR>==" },

                -- Toggle Copilot
                ["<Leader>tc"] = function()
                    if vim.g.copilot_enabled then
                        vim.notify "Copilot disabled"
                        -- require("astronvim.utils").notify("Copilot disabled", vim.log.levels.INFO, { title = "Copilot" })
                        -- vim.cmd "Copilot disable"
                        vim.g.copilot_enabled = false
                    else
                        vim.notify "Copilot enabled"
                        -- require("astronvim.utils").notify("Copilot enabled", vim.log.levels.INFO, { title = "Copilot" })
                        -- vim.cmd "Copilot enable"
                        vim.g.copilot_enabled = true
                    end
                end,

                -- Zen Mode
                ["<Leader>tz"] = {
                    function() require("zen-mode").toggle() end,
                    desc = "Toggle zen mode",
                },
            },
            i = {
                -- better escape
                ["<C-c>"] = { "<Esc>" },

                -- NOTE better undo breaks
                ["<Space>"] = { "<Space><C-g>u" },
                [","] = { ",<C-g>u" },
                ["."] = { ".<C-g>u" },
                ["!"] = { "!<C-g>u" },
                ["?"] = { "?<C-g>u" },

                -- Comments
                ["<C-/>"] = {
                    function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end,
                    desc = "Toggle comment line",
                },
                ["<C-_>"] = {
                    function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end,
                    desc = "Toggle comment line",
                },

                -- Line Swapping
                ["<A-j>"] = { "<Esc><cmd>m .+1<CR>==gi" },
                ["<A-k>"] = { "<Esc><cmd>m .-2<CR>==gi" },
            },
            v = {
                -- Comments
                ["<C-/>"] = {
                    function()
                        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                        vim.api.nvim_feedkeys(esc, "nx", false)
                        require("Comment.api").toggle.linewise(vim.fn.visualmode())
                    end,
                    desc = "Toggle comment line",
                },
                ["<C-_>"] = {
                    -- function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end,
                    function()
                        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
                        vim.api.nvim_feedkeys(esc, "nx", false)
                        require("Comment.api").toggle.linewise(vim.fn.visualmode())
                    end,
                    desc = "Toggle comment line",
                },

                -- Line Swapping
                ["<A-k>"] = { ":m '<-2<CR><CR>gv=gv" },
                ["<A-j>"] = { ":m '>+1<CR><CR>gv=gv" },
            },
            t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
            },
        },
    },
}
