require "nvim_comment".setup {
    hook = function()
        require("ts_context_commentstring.internal").update_commentstring()
    end,
    marker_padding = true,
    create_mappings = false,
    comment_empty = false
}

require "nvim-treesitter.configs".setup {
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
}
