local Plugins = {
	{ "tpope/vim-fugitive" },
	{ "wellle/targets.vim" },
	{ "tpope/vim-repeat" },
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	{ "numToStr/Comment.nvim", config = true, event = "VeryLazy" },

	-- Themes
	{ "folke/tokyonight.nvim" },
	{ "joshdick/onedark.vim" },
	{ "tanvirtin/monokai.nvim" },
	{ "lunarvim/darkplus.nvim" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
}

return Plugins
