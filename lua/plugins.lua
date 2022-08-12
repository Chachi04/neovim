require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- {{{ UI - coloscheme, treesitter, gitsigns, statusline, nvim-tree, rainbow-parens
	use("marko-cerovac/material.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("lewis6991/gitsigns.nvim")
	use("tamton-aquib/staline.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("p00f/nvim-ts-rainbow")
	use("stevearc/dressing.nvim")
	-- use "goolord/alpha-nvim"
	-- use "lukas-reineke/indent-blankline.nvim"
	-- }}}

	-- {{{ Lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("nvim-lua/lsp_extensions.nvim")
	use("nvim-lua/lsp-status.nvim")
	use({ "RishabhRD/nvim-lsputils", requires = { "RishabhRD/popfix" } })
	use("kkharji/lspsaga.nvim")
	-- }}}

	-- {{{ Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("kyazdani42/nvim-web-devicons")
	-- }}}

	-- {{{ Completion
	use("hrsh7th/nvim-cmp")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("f3fora/cmp-spell")
	use("rcarriga/cmp-dap")
	use("lukas-reineke/cmp-under-comparator")
	-- use "tzachar/cmp-fuzzy-path"
	-- use "tzachar/cmp-fuzzy-buffer"
	-- }}}

	-- {{{ Snippets
	use("dcampos/nvim-snippy")
	use("dcampos/cmp-snippy")
	use("rafamadriz/friendly-snippets")
	-- use "hrsh7th/cmp-vsnip"
	-- use "hrsh7th/vim-vsnip"
	-- use "hrsh7th/vim-vsnip-integ"
	-- }}}

	-- {{{ Debug
	use({ "mfussenegger/nvim-dap" })
	use({ "Pocco81/DAPInstall.nvim", opt = true })
	use({ "theHamsta/nvim-dap-virtual-text", opt = true })
	use({ "rcarriga/nvim-dap-ui", opt = true })
	use({ "mfussenegger/nvim-dap-python", opt = true })
	use({ "nvim-telescope/telescope-dap.nvim", opt = true })
	-- use "puremourning/vimspector"
	-- use "szw/vim-maximizer"
	-- }}}

	-- {{{ Comments
	use("terrortylor/nvim-comment")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- use "glepnir/prodoc.nvim"
	-- }}}

	-- {{{ Utils - surround, vim-closetag, tagalong, pears, nvim-ts-autotag, formatting, smooth scrolling
	-- use "jose-elias-alvarez/null-ls.nvim"
	use("lewis6991/impatient.nvim")
	use("tpope/vim-surround")
	use("alvan/vim-closetag")
	use("AndrewRadev/tagalong.vim")
	use("steelsojka/pears.nvim")
	use("windwp/nvim-ts-autotag")
	use("mhartington/formatter.nvim")
	-- use "karb94/neoscroll.nvim"
	use("declancm/cinnamon.nvim")
	-- use {"iamcco/markdown-preview.nvim", ft = "markdown"}
	-- use "abecodes/tabout.nvim"
	-- use "lepture/vim-jinja"
	-- use "blackCauldron7/surround.nvim"
	-- use "ur4ltz/surround.nvim"
	-- }}}
end)
