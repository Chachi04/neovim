require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        -- Lsp plugins
        use "neovim/nvim-lspconfig"
        use "nvim-lua/lsp_extensions.nvim"
        use "williamboman/nvim-lsp-installer"
        use "nvim-lua/lsp-status.nvim"
        use {"RishabhRD/nvim-lsputils", requires = {"RishabhRD/popfix"}}
        use "tami5/lspsaga.nvim"

        -- Telescope plugins
        use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
        use "nvim-telescope/telescope-fzy-native.nvim"
        use "kyazdani42/nvim-web-devicons"

        -- Completion plugins
        use "hrsh7th/nvim-cmp"

        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-path"
        -- use "tzachar/cmp-fuzzy-path"
        use "hrsh7th/cmp-buffer"
        -- use "tzachar/cmp-fuzzy-buffer"
        use "hrsh7th/cmp-cmdline"
        use "f3fora/cmp-spell"
        use "lukas-reineke/cmp-under-comparator"
        use "rcarriga/cmp-dap"

        -- Snippets
        -- use "hrsh7th/cmp-vsnip"
        -- use "hrsh7th/vim-vsnip"
        use "dcampos/nvim-snippy"
        use "dcampos/cmp-snippy"
        use "rafamadriz/friendly-snippets"
        -- use "hrsh7th/vim-vsnip-integ"

        -- Treesitter plugin
        use "nvim-treesitter/nvim-treesitter"

        -- Terminal integration
        use "akinsho/toggleterm.nvim"

        -- Debug plugins
        use "mfussenegger/nvim-dap"
        -- use "puremourning/vimspector"
        use "szw/vim-maximizer"

        -- Git plugins
        use "lewis6991/gitsigns.nvim"
        -- use "tpope/vim-fugitive"

        -- Statusline
        use "tamton-aquib/staline.nvim"

        -- File Explorer plugin
        use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"}

        -- use {"stevearc/vim-arduino"}

        -- use {
        --     "nvim-orgmode/orgmode",
        --     config = function()
        --         require("orgmode").setup {}
        --     end
        -- }
        -- Laravel plugin
        -- use {"jwalton512/vim-blade", ft = {"laravel"}}

        -- Surround plugin
        -- use "blackCauldron7/surround.nvim"
        use "tpope/vim-surround"

        -- Html plugins
        use "alvan/vim-closetag"
        use "AndrewRadev/tagalong.vim"

        -- Jinja
        use "lepture/vim-jinja"

        -- Autopair plugin
        use "steelsojka/pears.nvim"

        -- Autotag plugin
        use "windwp/nvim-ts-autotag"

        -- Tabout
        -- use "abecodes/tabout.nvim"

        -- Rainbow parentheses
        use "p00f/nvim-ts-rainbow"

        -- Comments plugin
        use "terrortylor/nvim-comment"

        use "JoosepAlviste/nvim-ts-context-commentstring"
        -- use "glepnir/prodoc.nvim"

        -- Colorschemes
        -- use "gruvbox-community/gruvbox"
        use "marko-cerovac/material.nvim"

        -- Transparency
        use "xiyaowong/nvim-transparent"

        -- Dashboard
        -- use "goolord/alpha-nvim"

        -- Markdown Previewer
        -- use {"iamcco/markdown-preview.nvim", ft = "markdown"}

        -- Prettier
        use "sbdchd/neoformat"

        -- Smooth scroll plugin
        use "karb94/neoscroll.nvim"

        -- Reload plugin
        use "famiu/nvim-reload"

        -- Misc
        -- use {
        --   "lukas-reineke/indent-blankline.nvim",
        --   config = function()
        --     vim.cmd "highlight IndentBlanklineChar guifg=#4d4d4d gui=nocombine"
        --     vim.cmd "highlight IndentBlanklineSpaceChar guifg=#4d4d4d gui=nocombine"
        --     vim.cmd "highlight IndentBlanklineContextChar guifg=#737373 gui=nocombine"
        --     vim.cmd "let g:indent_blankline_use_treesitter = v:true"
        --     vim.cmd "let g:indent_blankline_show_current_context = v:true"
        --     vim.cmd "let g:indent_blankline_buftype_exclude = ['terminal', 'nofile']"
        --     vim.cmd "let g:indent_blankline_filetype_exclude = ['help']"
        --     vim.cmd "let g:indent_blankline_char = '▏'"
        --     vim.cmd "let g:indent_blankline_space_char = ' '"
        --   end
        -- }
    end
)

require("config.lspinstall")
require("config.completion")
require("config.treesitter")
-- require("config.tabsout")
require("config.gitsigns")
require("config.statusline")
require("config.nvim-tree")
require("config.surround")
require("config.pears")
require("config.nvim-ts-autotag")
require("config.comments")
require("config.colorscheme")
require("config.smoothscroll")
require("config.signify")
require("config.telescope")
require("config.lsp")
require("config.dap-debug")
-- require("config.dashboard")
require("config.prettier")
require("config.floaterm")
