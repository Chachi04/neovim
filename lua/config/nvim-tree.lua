-- nvim_tree_show_icons, nvim_tree_icons, nvim_tree_create_in_closed_folder, nvim_tree_respect_buf_cwd, nv
-- im_tree_group_empty, nvim_tree_git_hl, nvim_tree_special_files, nvim_tree_highlight_opened_files, nvim_tree_root_folder_modifier, nvim_tree_add_trailing, nvim_tree_icon_padd
-- ing, nvim_tree_symlink_arrow
--
vim.g.nvim_tree_refresh_wait = 1000

-- vim.g.nvim_tree_icons = {
--     default = "",
--     symlink = "",
--     git = {
--         unstaged = "✗",
--         staged = "✓",
--         unmerged = "",
--         renamed = "➜",
--         untracked = "★",
--         deleted = "",
--         ignored = "◌"
--     },
--     folder = {
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--         symlink_open = ""
--     },
--     lsp = {
--         hint = "",
--         info = "",
--         warning = "",
--         error = ""
--     }
-- }

-- NvimTreeOpen and NvimTreeClose are also available if you need them

-- a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue
require "nvim-tree".setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = true,
    hijack_cursor = false,
    hijack_netrw = true,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = false,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "all",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  "
            }
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = ""
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                }
                -- lsp = {
                --     hint = "",
                --     info = "",
                --     warning = "",
                --     error = ""
                -- }
            }
        },
        special_files = {"README.org", "README.md", "Makefile", "MAKEFILE", "Cargo.toml"}
    },
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = nil,
        args = {}
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame"},
                    buftype = {"nofile", "terminal", "help"}
                }
            }
        }
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false
        }
    },
    -- gitignores = true,
    -- auto_close = false,
    -- nvim_tree_disable_window_picker = true,
    -- nvim_tree_indent_markers = true,
    -- nvim_tree_window_picker_exclude = {
    --     filetype = {"notify", "packer", "qf"},
    --     buftype = {"terminal"}
    -- },
    -- nvim_tree_quit_on_open = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    }
}
