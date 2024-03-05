return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "smpallen99/elixir-projectionist.nvim",
    enable = true,
    lazy = false,
    config = function() require("elixir-projectionist").setup() end,
  },
  {
    "tpope/vim-projectionist",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
  },
  {
    "smpallen99/nvim-coverage",
    enabled = true,
    -- lazy = false,
    event = "BufEnter *.ex",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("coverage").setup() end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-vim-test",
    },
    config = function() require "morpheus.user.plugins.configs.neotest" end,
  },
  {
    'willothy/wezterm.nvim',
    config = true,
  },
}
