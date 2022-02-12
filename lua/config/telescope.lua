local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--follow"
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = {"node_modules/*", "vendor/*", "storage/*", "/*.png", "venv/*", "/*.pyc"},
        color_devicons = true,
        use_less = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
            i = {
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
                preview_width = 90,
                mirror = false
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

local M = {}

M.project_files = function()
    local opts = {follow = true} -- define here if you want to define something
    local ok = pcall(require "telescope.builtin".git_files, opts)
    if not ok then
        require "telescope.builtin".find_files(opts)
    end
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files(
        {
            prompt_title = "< VimRC >",
            cwd = "~/.config/nvim"
        }
    )
end

-- M.git_branches = function()
--     require("telescope.builtin").git_braches(
--         {
--             attach_mappings = function(_, map)
--                 map("i", "<C-d>", actions.git_delete_branch)
--                 map("n", "<C-d>", actions.git_delete_branch)
--                 return true
--             end
--         }
--     )
-- end

return M
