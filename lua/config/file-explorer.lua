-- vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_hieghlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_symlink_arrow = " ➛ "
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_create_int_closed_folder = 0
vim.g.nvim_tree_refresh_wait = 1000
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {"notify", "packer", "qf"},
    buftype = {"terminal"}
}
vim.g.nvim_tree_special_files = {["README.org"] = 1, ["README.md"] = 1, ["Makefile"] = 1, ["MAKEFILE"] = 1}
vim.g.nvim_tree_show_icons = {["git"] = 1}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = ""
    }
}

-- NvimTreeOpen and NvimTreeClose are also available if you need them

-- a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue
