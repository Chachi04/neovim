-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",

    -- Code
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.java" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.php" },
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.typescript" },

    -- UI
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    { import = "astrocommunity.editing-support.neogen" },

    -- Utils
    { import = "astrocommunity.motion.nvim-surround" },
    { import = "astrocommunity.editing-support.zen-mode-nvim" },
    { import = "astrocommunity.syntax.hlargs-nvim" },
    { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
}
