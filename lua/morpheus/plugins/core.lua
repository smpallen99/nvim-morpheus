local transparent = require("configuration").enable_transparent
return {
  { "echasnovski/mini.bufremove", lazy = true },
  { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
  { "NMAC427/guess-indent.nvim", event = "User AstroFile", config = require "morpheus.plugins.configs.guess-indent" },
  {
    "s1n7ax/nvim-window-picker",
    lazy = true,
    main = "window-picker",
    opts = { picker_config = { statusline_winbar_picker = { use_winbar = "smart" } } },
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
  },
  {
    "windwp/nvim-autopairs",
    event = "User AstroFile",
    opts = {
      check_ts = true,
      ts_config = { java = false },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
      },
    },
    config = require "morpheus.plugins.configs.nvim-autopairs",
  },
  { "AstroNvim/astrotheme", 
    lazy = true, 
    opts = { 
      plugins = { ["dashboard-nvim"] = true } ,
      style = {
        transparent = transparent,         -- Bool value, toggles transparency.
        inactive = true,             -- Bool value, toggles inactive window color.
        float = true,                -- Bool value, toggles floating windows background colors.
        neotree = true,              -- Bool value, toggles neo-trees background color.
        border = true,               -- Bool value, toggles borders.
        title_invert = true,         -- Bool value, swaps text and background colors.
        italic_comments = true,      -- Bool value, toggles italic comments.
        simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
      },
    },
    termguicolors = true, -- Bool value, toggles if termguicolors are set by AstroTheme.

    terminal_color = true, -- Bool value, toggles if terminal_colors are set by AstroTheme.

    plugin_default = "auto", -- Sets how all plugins will be loaded
                             -- "auto": Uses lazy / packer enabled plugins to load highlights.
                             -- true: Enables all plugins highlights.
                             -- false: Disables all plugins.

    -- plugins = {              -- Allows for individual plugin overrides using plugin name and value from above.
    --   ["bufferline.nvim"] = false,
    -- },

    palettes = {
      global = {             -- Globally accessible palettes, theme palettes take priority.
        my_grey = "#ebebeb",
        my_color = "#ffffff"
      },
      astrodark = {          -- Extend or modify astrodarks palette colors
        ui = {
          red = "#800010", -- Overrides astrodarks red UI color
          accent = "#CC83E3"  -- Changes the accent color of astrodark.
        },
        syntax = {
          cyan = "#800010", -- Overrides astrodarks cyan syntax color
          comments = "#CC83E3"  -- Overrides astrodarks comment color.
        },
        my_color = "#000000" -- Overrides global.my_color
      },
    },

    highlights = {
      global = {             -- Add or modify hl groups globally, theme specific hl groups take priority.
        modify_hl_groups = function(hl, c)
          hl.PluginColor4 = {fg = c.my_grey, bg = c.none }
        end,
        ["@String"] = {fg = "#ff00ff", bg = "NONE"},
      },
      astrodark = {
        -- first parameter is the highlight table and the second parameter is the color palette table
        modify_hl_groups = function(hl, c) -- modify_hl_groups function allows you to modify hl groups,
          hl.Comment.fg = c.my_color
          hl.Comment.italic = true
        end,
        ["@String"] = {fg = "#ff00ff", bg = "NONE"},
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { 
      "xiyaowong/transparent.nvim",
    },
    opts = {},
    require("tokyonight").setup({ 
      transparent = transparent,
      style = {
        transparent = transparent,         -- Bool value, toggles transparency.
        inactive = true,             -- Bool value, toggles inactive window color.
        float = true,                -- Bool value, toggles floating windows background colors.
        neotree = true,              -- Bool value, toggles neo-trees background color.
        border = true,               -- Bool value, toggles borders.
        title_invert = true,         -- Bool value, swaps text and background colors.
        italic_comments = true,      -- Bool value, toggles italic comments.
        simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
      },
    }),
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = 10,
      ---@param t Terminal
      on_create = function(t)
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
        local toggle = function() t:toggle() end
        vim.keymap.set({ "n", "t", "i" }, "<C-'>", toggle, { desc = "Toggle terminal", buffer = t.bufnr })
        vim.keymap.set({ "n", "t", "i" }, "<F7>", toggle, { desc = "Toggle terminal", buffer = t.bufnr })
      end,
      shading_factor = 2,
      direction = "float",
      float_opts = { border = "rounded" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = { "User MorpheusFile", "InsertEnter" },
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      preview = {
        mappings = {
          scrollB = "<C-b>",
          scrollF = "<C-f>",
          scrollU = "<C-u>",
          scrollD = "<C-d>",
        },
      },
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(bufnr, providerName)
          else
            return require("promise").reject(err)
          end
        end

        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
          or function(bufnr)
            return require("ufo")
              .getFolds(bufnr, "lsp")
              :catch(function(err) return handleFallbackException(bufnr, err, "treesitter") end)
              :catch(function(err) return handleFallbackException(bufnr, err, "indent") end)
          end
      end,
    },
  },
  -- Session manager
  --
  { -- TODO: REMOVE neovim-session-manager with AstroNvim v4
    "Shatur/neovim-session-manager",
    event = "BufWritePost",
    cmd = "SessionManager",
    enabled = vim.g.resession_enabled ~= true,
  },
  -- {
  -- "Shatur/neovim-session-manager",
  --   module = "session_manager",
  --   cmd = "SessionManager",
  --   event = "BufWritePost",
  --   config = function() require "configs.session_manager" end,
  --   -- config = function() require "morpheus.plugins.configs.session_manager" end,
  -- },
  {
    "stevearc/resession.nvim",
    enabled = vim.g.resession_enabled == true,
    lazy = true,
    opts = {
      buf_filter = function(bufnr) return require("morpheus.utils.buffer").is_restorable(bufnr) end,
      tab_buf_filter = function(tabpage, bufnr) return vim.tbl_contains(vim.t[tabpage].bufs, bufnr) end,
      extensions = { astronvim = {} },
    },
  },
}
