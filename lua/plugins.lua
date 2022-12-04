require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	--  UI - coloscheme, treesitter, gitsigns, statusline, nvim-tree
	use("nvim-treesitter/nvim-treesitter")
	use("marko-cerovac/material.nvim")
	use("lewis6991/gitsigns.nvim")
	use("tamton-aquib/staline.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("stevearc/dressing.nvim")
	use("m-demare/hlargs.nvim")
	-- use({ "folke/twilight.nvim" })
	-- use({ "lukas-reineke/indent-blankline.nvim" })
	-- use({ "nvim-treesitter/nvim-treesitter-context" })
	-- use({ "p00f/nvim-ts-rainbow" })
	-- use({ "goolord/alpha-nvim" })

	--  Lsp
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp_extensions.nvim")
	use("nvim-lua/lsp-status.nvim")
	use({ "RishabhRD/nvim-lsputils", requires = { "RishabhRD/popfix" } })
	-- use({ "kkharji/lspsaga.nvim" })

	--  Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("kyazdani42/nvim-web-devicons")

	--  Completion
	use("hrsh7th/nvim-cmp")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("f3fora/cmp-spell")
	-- use( "rcarriga/cmp-dap" )
	use("lukas-reineke/cmp-under-comparator")
	use("zbirenbaum/copilot.lua")
	use("zbirenbaum/copilot-cmp")
	-- use( "tzachar/cmp-fuzzy-path" )
	-- use( "tzachar/cmp-fuzzy-buffer" )

	--  Snippets
	use("dcampos/nvim-snippy")
	use("dcampos/cmp-snippy")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")

	--  Debug
	-- use( "mfussenegger/nvim-dap" )
	-- use( "rcarriga/nvim-dap-ui" )
	-- use( "theHamsta/nvim-dap-virtual-text" )
	-- use( "nvim-telescope/telescope-dap.nvim" )
	-- use( "mfussenegger/nvim-dap-python" )
	-- use( "szw/vim-maximizer" )

	--  Comments
	use("terrortylor/nvim-comment")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- use({ "glepnir/prodoc.nvim" })

	--  Utils - surround, vim-closetag, tagalong, pears, nvim-ts-autotag, formatting, smooth scrolling
	use("lewis6991/impatient.nvim")
	use("kylechui/nvim-surround")
	use("windwp/nvim-autopairs") -- autoclose brackets
	use("windwp/nvim-ts-autotag") -- autocomlete html tags
	use("mhartington/formatter.nvim")
	use("declancm/cinnamon.nvim") -- smooth scroll
	use({ "folke/which-key.nvim", disable = true })
	-- use({ "jose-elias-alvarez/null-ls.nvim", disable = true })
	-- use({ "iamcco/markdown-preview.nvim", ft = "markdown", disable = true })
	-- use({ "lepture/vim-jinja", disable = true })

	-- Markdown, Latex
	use("frabjous/knap")
end)
