local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new(
        {
            command = "file",
            args = {"--mime-type", "-b", filepath},
            on_exit = function(j)
                local mime_type = vim.split(j:result()[1], "/")[1]
                if mime_type == "text" then
                    previewers.buffer_previewer_maker(filepath, bufnr, opts)
                else
                    -- maybe we want to write something to the buffer here
                    vim.schedule(
                        function()
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"BINARY"})
                        end
                    )
                end
            end
        }
    ):sync()
end

require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim" -- add this value
        },
        -- buffer_previewer_maker = new_maker, -- don't preview binaries
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = " ",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = {"node_modules/*", "vendor/*", "storage/*", "/*.png", "venv/*", "/*.pyc"},
        color_devicons = true,
        use_less = true,
        -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
            n = {
                ["<M-p>"] = action_layout.toggle_preview
            },
            i = {
                ["<M-p>"] = action_layout.toggle_preview,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
                -- ["<CR>"] = actions.select_tab
            }
        },
        layout_strategy = "flex",
        layout_config = {
            horizontal = {
                preview_width = 0.45,
                mirror = false
            },
            vertical = {
                width = 0.8
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}

require("telescope").load_extension("fzy_native")
