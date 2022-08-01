require("staline").setup {
    defaults = {
        left_separator = "",
        right_separator = "",
        line_column = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
        fg = "#000000", -- Foreground text color.
        bg = "none", -- Default background is transparent.
        cool_symbol = " ", -- Change this to override defult OS icon.
        full_path = false,
        font_active = "none", -- "none", "bold", "italic", "bold,italic", etc
        true_colors = true -- true lsp colors.
    },
    mode_colors = {
        n = "#2bbb4f",
        i = "#986fec",
        c = "#e27d60",
        v = "#4799eb" -- etc..
    },
    mode_icons = {
        ["n"] = " normal",
        -- ["no"] = " ",
        -- ["nov"] = " ",
        -- ["noV"] = " ",
        -- ["no"] = " ",
        -- ["niI"] = " ",
        -- ["niR"] = " ",
        -- ["niV"] = " ",
        ["i"] = " insert",
        -- ["ic"] = " ",
        -- ["ix"] = " ",
        -- ["s"] = " ",
        -- ["S"] = " ",
        ["v"] = " visual",
        ["V"] = " line",
        [""] = " block",
        -- ["r"] = "﯒ ",
        -- ["r?"] = " ",
        ["c"] = " command",
        -- ["t"] = " ",
        -- ["!"] = " ",
        ["R"] = " replace"
    },
    sections = {
        left = {"- ", "-mode", "left_sep_double", " ", "branch"},
        mid = {"file_name"},
        right = {"cool_symbol", "right_sep_double", "-line_column"}
    }
}
