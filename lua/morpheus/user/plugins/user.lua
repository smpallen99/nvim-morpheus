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
}
