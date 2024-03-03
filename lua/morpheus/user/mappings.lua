-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ["<leader>r"] = { "<cmd>b#<cr>", desc = "Last buffer" },
    ["<leader>a"] = { "<cmd>A<cr>", desc = "Alternate File" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },

    -- quit

    ["<leader>Q"] = { "<cmd>qa<cr>", desc = "Quit all" },

    -- buffer
    --
    ["<TAB>"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
    ["<S-TAB>"] = { "<cmd>bprevious<cr>", desc = "Prev buffer" },

    -- tabs
    ["<leader><tab>"] = { desc = "Tabs" },

    ["<leader><tab>l"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
    ["<leader><tab>f"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },

    ["<leader><tab><tab>"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader><tab>]"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
    ["<leader><tab>d"] = { "<cmd>tabclose<cr>", desc = "Close Tab" },
    ["<leader><tab>["] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>gS"] = { "<cmd>Git<cr>", desc = "fugitive" },
  },
  t = {
    -- setting a mapping to false will disable it
  },
  i = {
    ["<C-Enter>"] = { "<cmd>:Copilot suggestion accept<cr>", desc = "Accept Suggestion" },
    ["<C-Down>"] = { "<cmd>:Copilot suggestion next<cr>", desc = "Next Suggestion" },
    ["<C-Up>"] = { "<cmd>:Copilot suggestion prev<cr>", desc = "Next Suggestion" },

    ["<C-g>"] = { function() end, desc = "GpChat" },
  },
}