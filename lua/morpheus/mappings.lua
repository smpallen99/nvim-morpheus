local utils = require "morpheus.utils"
local get_icon = utils.get_icon
local is_available = utils.is_available

local maps = require("morpheus.utils").empty_map_table()

local sections = {
  f = { desc = get_icon("Search", 1, true) .. "Find" },
  p = { desc = get_icon("Package", 1, true) .. "Packages" },
  l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
  u = { desc = get_icon("Window", 1, true) .. "UI/UX" },
  b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
  bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
  d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
  g = { desc = get_icon("Git", 1, true) .. "Git" },
  S = { desc = get_icon("Session", 1, true) .. "Session" },
  t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
}
-- Space as leader key
vim.g.mapleader = " "

--
-- From original
--
-- -- Shortcuts
-- vim.keymap.set({ "n", "x", "o" }, "<leader>h", "^")
-- vim.keymap.set({ "n", "x", "o" }, "<leader>l", "g_")
-- vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")
--
-- -- Basic clipboard interaction
-- vim.keymap.set({ "n", "x" }, "gy", '"+y') -- copy
-- vim.keymap.set({ "n", "x" }, "gp", '"+p') -- paste
--
-- -- Delete text
-- vim.keymap.set({ "n", "x" }, "x", '"_x')
-- vim.keymap.set({ "n", "x" }, "X", '"_d')
--
-- -- Commands
-- vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
-- vim.keymap.set("n", "<leader>bq", "<cmd>bdelete<cr>")
-- vim.keymap.set("n", "<leader>bl", "<cmd>buffer #<cr>")

-- Normal --
-- Standard Operations
maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>Q"] = { "<cmd>confirm qall<cr>", desc = "Quit all" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }
-- TODO: Remove when dropping support for <Neovim v0.10
if not vim.ui.open then maps.n["gx"] = { utils.system_open, desc = "Open the file under cursor with system app" } end

-- Plugin Manager
maps.n["<leader>p"] = sections.p
maps.n["<leader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").home() end, desc = "Plugins Status" }
maps.n["<leader>pS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
maps.n["<leader>pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
maps.n["<leader>pU"] = { function() require("lazy").update() end, desc = "Plugins Update" }

-- AstroNvim
-- TODO: What should I do with this??
--
-- maps.n["<leader>pa"] = { "<cmd>AstroUpdatePackages<cr>", desc = "Update Plugins and Mason Packages" }
-- maps.n["<leader>pA"] = { "<cmd>AstroUpdate<cr>", desc = "AstroNvim Update" }
-- maps.n["<leader>pv"] = { "<cmd>AstroVersion<cr>", desc = "AstroNvim Version" }
-- maps.n["<leader>pl"] = { "<cmd>AstroChangelog<cr>", desc = "AstroNvim Changelog" }

-- Manage Buffers
maps.n["<leader>c"] = { function() require("morpheus.utils.buffer").close() end, desc = "Close buffer" }
maps.n["<leader>C"] = { function() require("morpheus.utils.buffer").close(0, true) end, desc = "Force close buffer" }
maps.n["]b"] =
  { function() require("morpheus.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
maps.n["[b"] = {
  function() require("morpheus.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}
maps.n[">b"] = {
  function() require("morpheus.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
  desc = "Move buffer tab right",
}
maps.n["<b"] = {
  function() require("morpheus.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Move buffer tab left",
}

maps.n["<leader>b"] = sections.b
maps.n["<leader>bc"] =
  { function() require("morpheus.utils.buffer").close_all(true) end, desc = "Close all buffers except current" }
maps.n["<leader>bC"] = { function() require("morpheus.utils.buffer").close_all() end, desc = "Close all buffers" }
maps.n["<leader>bl"] =
  { function() require("morpheus.utils.buffer").close_left() end, desc = "Close all buffers to the left" }
maps.n["<leader>bp"] = { function() require("morpheus.utils.buffer").prev() end, desc = "Previous buffer" }
maps.n["<leader>br"] =
  { function() require("morpheus.utils.buffer").close_right() end, desc = "Close all buffers to the right" }
maps.n["<leader>bs"] = sections.bs
maps.n["<leader>bse"] = { function() require("morpheus.utils.buffer").sort "extension" end, desc = "By extension" }
maps.n["<leader>bsr"] =
  { function() require("morpheus.utils.buffer").sort "unique_path" end, desc = "By relative path" }
maps.n["<leader>bsp"] = { function() require("morpheus.utils.buffer").sort "full_path" end, desc = "By full path" }
maps.n["<leader>bsi"] = { function() require("morpheus.utils.buffer").sort "bufnr" end, desc = "By buffer number" }
maps.n["<leader>bsm"] = { function() require("morpheus.utils.buffer").sort "modified" end, desc = "By modification" }

-- Alpha
if is_available "alpha-nvim" then
  maps.n["<leader>h"] = {
    function()
      local wins = vim.api.nvim_tabpage_list_wins(0)
      if #wins > 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == "neo-tree" then
        vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
      end
      require("alpha").start(false)
    end,
    desc = "Home Screen",
  }
end
