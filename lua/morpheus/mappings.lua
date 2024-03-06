local utils = require "morpheus.utils"
local get_icon = utils.get_icon
local is_available = utils.is_available
local ui = require "morpheus.utils.ui"

local maps = require("morpheus.utils").empty_map_table()

local sections = {
  c = { desc = get_icon("Code", 1, true) .. "Code" },
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
  ai = { desc = get_icon("CodeAssistant", 1, true) .. "AI/ML" },
  ai_inline = { desc = "Inline" },
  ai_whisper = { desc = "Whisper" },
}
-- Space as leader key
vim.g.mapleader = " "

maps.n["<leader>uT"] = { "<cmd>:TransparentToggle<cr>", desc = "TransparentToggle" }
maps.n["<leader>r"] = { "<cmd>:b#<cr>", desc = "Previous buffer" }
maps.n["<leader>a"] = { "<cmd>:A<cr>", desc = "Alternate file" }

-- Code
maps.n["<leader>c"] = sections.c

 -- NeoTest

-- maps.n["<leader>c"] = { function() require("morpheus.utils.buffer").close() end, desc = "Close buffer" }
maps.n["<leader>T"] =  { desc = "Tests" }

maps.n["<leader>Tn"] = { function() require("neotest").run() end, desc = "Run nearest test" }
maps.n["<leader>Tf"] = { function() require("neotest").run(vim.fn.expand "%") end, desc = "Run tests in current file" }
-- maps.n["<leader>Td"] = {
--   function() require("neotest").run.run { strategy = "dap" } end,
--   desc = "Run nearest test with debug",
-- }
maps.n["<leader>To"] = { function() require("neotest").output.open() end, desc = "Display output of tests" }
maps.n["<leader>Ts"] = { function() require("neotest").summary.toggle() end, desc = "Open the summary window" }

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

-- MorpheusNvim
-- TODO: What should I do with this??
--
-- maps.n["<leader>pa"] = { "<cmd>AstroUpdatePackages<cr>", desc = "Update Plugins and Mason Packages" }
-- maps.n["<leader>pA"] = { "<cmd>AstroUpdate<cr>", desc = "MorpheusNvim Update" }
-- maps.n["<leader>pv"] = { "<cmd>AstroVersion<cr>", desc = "MorpheusNvim Version" }
-- maps.n["<leader>pl"] = { "<cmd>AstroChangelog<cr>", desc = MorpheusNvimAstroNvim Changelog" }

-- Manage Buffers
maps.n["<leader>bc"] = { function() require("morpheus.utils.buffer").close() end, desc = "Close buffer" }
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
maps.n["<leader>ba"] =
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

-- Comment
if is_available "Comment.nvim" then
  maps.n["<leader>/"] = {
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Toggle comment line",
  }
  maps.v["<leader>/"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment for selection",
  }
end

-- GitSigns
if is_available "gitsigns.nvim" then
  maps.n["<leader>g"] = sections.g
  maps.n["]g"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" }
  maps.n["[g"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" }
  maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View Git blame" }
  maps.n["<leader>gL"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }
  maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" }
  maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" }
  maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" }
  maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" }
  maps.n["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" }
  maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage Git hunk" }
  maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View Git diff" }
end

-- NeoTree
if is_available "neo-tree.nvim" then
  maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
  maps.n["<leader>o"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  }
end

-- Session Manager
if is_available "neovim-session-manager" then

  maps.n["<leader>Sl"] = { "<cmd>SessionManager! load_last_session<cr>", desc = "Load last session" }
  maps.n["<leader>Ss"] = { "<cmd>SessionManager! save_current_session<cr>", desc = "Save this session" }
  maps.n["<leader>Sd"] = { "<cmd>SessionManager! delete_session<cr>", desc = "Delete session" }
  maps.n["<leader>Sf"] = { "<cmd>SessionManager! load_session<cr>", desc = "Search sessions" }
  maps.n["<leader>S."] =
    { "<cmd>SessionManager! load_current_dir_session<cr>", desc = "Load current directory session" }
end
if is_available "resession.nvim" then
  maps.n["<leader>S"] = sections.S
  maps.n["<leader>Sl"] = { function() require("resession").load "Last Session" end, desc = "Load last session" }
  maps.n["<leader>Ss"] = { function() require("resession").save() end, desc = "Save this session" }
  maps.n["<leader>St"] = { function() require("resession").save_tab() end, desc = "Save this tab's session" }
  maps.n["<leader>Sd"] = { function() require("resession").delete() end, desc = "Delete a session" }
  maps.n["<leader>Sf"] = { function() require("resession").load() end, desc = "Load a session" }
  maps.n["<leader>S."] = {
    function() require("resession").load(vim.fn.getcwd(), { dir = "dirsession" }) end,
    desc = "Load current directory session",
  }
end

-- Package Manager
if is_available "mason.nvim" then
  maps.n["<leader>pm"] = { "<cmd>Mason<cr>", desc = "Mason Installer" }
  maps.n["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", desc = "Mason Update" }
end

-- Smart Splits
if is_available "smart-splits.nvim" then
  maps.n["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" }
  maps.n["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" }
  maps.n["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" }
  maps.n["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" }
  maps.n["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" }
  maps.n["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" }
  maps.n["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" }
  maps.n["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" }
else
  maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
  maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
  maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
  maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
  maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
  maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
  maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
  maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- SymbolsOutline
if is_available "aerial.nvim" then
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>lS"] = { function() require("aerial").toggle() end, desc = "Symbols outline" }
end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>f"] = sections.f
  maps.n["<leader>g"] = sections.g
  maps.n["<leader>gb"] =
    { function() require("telescope.builtin").git_branches { use_file_path = true } end, desc = "Git branches" }
  maps.n["<leader>gc"] = {
    function() require("telescope.builtin").git_commits { use_file_path = true } end,
    desc = "Git commits (repository)",
  }
  maps.n["<leader>gC"] = {
    function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
    desc = "Git commits (current file)",
  }
  maps.n["<leader>gt"] =
    { function() require("telescope.builtin").git_status { use_file_path = true } end, desc = "Git status" }
  maps.n["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" }
  maps.n["<leader>f'"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" }
  maps.n["<leader>f/"] =
    { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find words in current buffer" }
  maps.n["<leader>fa"] = {
    function()
      local cwd = vim.fn.stdpath "config" .. "/.."
      local search_dirs = {}
      for _, dir in ipairs(morpheus.supported_configs) do -- search all supported config locations
        if dir == morpheus.install.home then dir = dir .. "/lua/user" end -- don't search the morpheus core files
        if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
      end
      if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
        utils.notify("No user configuration files found", vim.log.levels.WARN)
      else
        if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
        require("telescope.builtin").find_files {
          prompt_title = "Config Files",
          search_dirs = search_dirs,
          cwd = cwd,
          follow = true,
        } -- call telescope
      end
    end,
    desc = "Find MorpheusNvim config files",
  }
  maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" }
  maps.n["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
  maps.n["<leader>fC"] = { function() require("telescope.builtin").commands() end, desc = "Find commands" }
  maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" }
  maps.n["<leader>fF"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Find all files",
  }
  maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" }
  maps.n["<leader>fk"] = { function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" }
  maps.n["<leader>fm"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man" }
  if is_available "nvim-notify" then
    maps.n["<leader>fn"] =
      { function() require("telescope").extensions.notify.notify() end, desc = "Find notifications" }
    maps.n["<leader>uD"] =
      { function() require("notify").dismiss { pending = true, silent = true } end, desc = "Dismiss notifications" }
  end
  maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" }
  maps.n["<leader>fr"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" }
  maps.n["<leader>ft"] =
    { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" }
  maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" }
  maps.n["<leader>fW"] = {
    function()
      require("telescope.builtin").live_grep {
        additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
      }
    end,
    desc = "Find words in all files",
  }
  maps.n["<leader>l"] = sections.l
  maps.n["<leader>ls"] = {
    function()
      local aerial_avail, _ = pcall(require, "aerial")
      if aerial_avail then
        require("telescope").extensions.aerial.aerial()
      else
        require("telescope.builtin").lsp_document_symbols()
      end
    end,
    desc = "Search symbols",
  }
end

-- Terminal
if is_available "toggleterm.nvim" then
  maps.n["<leader>t"] = sections.t
  if vim.fn.executable "lazygit" == 1 then
    maps.n["<leader>g"] = sections.g
    maps.n["<leader>gg"] = {
      function()
        local worktree = require("morpheus.utils.git").file_worktree()
        -- local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
        -- utils.toggle_term_cmd("lazygit " .. flags)
        utils.toggle_term_cmd({ 
          cmd = "lazygit",
          direction = "float",
          -- float_opts = { border = "double" },
        })
      end,
      desc = "ToggleTerm lazygit",
    }
    maps.n["<leader>tl"] = maps.n["<leader>gg"]
  end
  if vim.fn.executable "node" == 1 then
    maps.n["<leader>tn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" }
  end
  local gdu = vim.fn.has "mac" == 1 and "gdu-go" or "gdu"
  if vim.fn.executable(gdu) == 1 then
    maps.n["<leader>tu"] = { function() utils.toggle_term_cmd(gdu) end, desc = "ToggleTerm gdu" }
  end
  if vim.fn.executable "btm" == 1 then
    maps.n["<leader>tt"] = { function() utils.toggle_term_cmd "btm" end, desc = "ToggleTerm btm" }
  end
  local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
  if python then maps.n["<leader>tp"] = { function() utils.toggle_term_cmd(python) end, desc = "ToggleTerm python" } end

  maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
  maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
  maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
  maps.n["<F7>"] = { '<Cmd>execute v:count . "ToggleTerm"<CR>', desc = "Toggle terminal" }
  maps.i["<F7>"] = { "<Esc>" .. maps.n["<F7>"][1], desc = maps.n["<F7>"].desc }
  maps.t["<F7>"] = maps.n["<F7>"]
  maps.n["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
  maps.i["<C-'>"] = maps.i["<F7>"] -- requires terminal that supports binding <C-'>
  maps.t["<C-'>"] = maps.t["<F7>"] -- requires terminal that supports binding <C-'>
end

if is_available "nvim-dap" then
  maps.n["<leader>d"] = sections.d
  maps.v["<leader>d"] = sections.d
  -- modified function keys found with `showkey -a` in the terminal to get key code
  -- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
  maps.n["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" }
  maps.n["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" } -- Shift+F5
  maps.n["<F21>"] = { -- Shift+F9
    function()
      vim.ui.input({ prompt = "Condition: " }, function(condition)
        if condition then require("dap").set_breakpoint(condition) end
      end)
    end,
    desc = "Debugger: Conditional Breakpoint",
  }
  maps.n["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" } -- Control+F5
  maps.n["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" }
  maps.n["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" }
  maps.n["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" }
  maps.n["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" }
  maps.n["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" } -- Shift+F11
  maps.n["<leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" }
  maps.n["<leader>dB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" }
  maps.n["<leader>dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" }
  maps.n["<leader>dC"] = {
    function()
      vim.ui.input({ prompt = "Condition: " }, function(condition)
        if condition then require("dap").set_breakpoint(condition) end
      end)
    end,
    desc = "Conditional Breakpoint (S-F9)",
  }
  maps.n["<leader>di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" }
  maps.n["<leader>do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" }
  maps.n["<leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" }
  maps.n["<leader>dq"] = { function() require("dap").close() end, desc = "Close Session" }
  maps.n["<leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" }
  maps.n["<leader>dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" }
  maps.n["<leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" }
  maps.n["<leader>dR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" }
  maps.n["<leader>ds"] = { function() require("dap").run_to_cursor() end, desc = "Run To Cursor" }

  if is_available "nvim-dap-ui" then
    maps.n["<leader>dE"] = {
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then require("dapui").eval(expr, { enter = true }) end
        end)
      end,
      desc = "Evaluate Input",
    }
    maps.v["<leader>dE"] = { function() require("dapui").eval() end, desc = "Evaluate Input" }
    maps.n["<leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" }
    maps.n["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" }
  end
end

-- Improved Code Folding
if is_available "nvim-ufo" then
  maps.n["zR"] = { function() require("ufo").openAllFolds() end, desc = "Open all folds" }
  maps.n["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close all folds" }
  maps.n["zr"] = { function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" }
  maps.n["zm"] = { function() require("ufo").closeFoldsWith() end, desc = "Fold more" }
  maps.n["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" }
end

-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "Indent line" }

-- Improved Terminal Navigation
maps.t["<C-h>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" }

maps.n["<leader>u"] = sections.u
-- Custom menu for modification of the user experience
if is_available "nvim-autopairs" then maps.n["<leader>ua"] = { ui.toggle_autopairs, desc = "Toggle autopairs" } end
maps.n["<leader>ub"] = { ui.toggle_background, desc = "Toggle background" }
if is_available "nvim-cmp" then maps.n["<leader>uc"] = { ui.toggle_cmp, desc = "Toggle autocompletion" } end
if is_available "nvim-colorizer.lua" then
  maps.n["<leader>uC"] = { "<cmd>ColorizerToggle<cr>", desc = "Toggle color highlight" }
end
maps.n["<leader>ud"] = { ui.toggle_diagnostics, desc = "Toggle diagnostics" }
maps.n["<leader>ug"] = { ui.toggle_signcolumn, desc = "Toggle signcolumn" }
maps.n["<leader>ui"] = { ui.set_indent, desc = "Change indent setting" }
maps.n["<leader>ul"] = { ui.toggle_statusline, desc = "Toggle statusline" }
maps.n["<leader>uL"] = { ui.toggle_codelens, desc = "Toggle CodeLens" }
maps.n["<leader>un"] = { ui.change_number, desc = "Change line numbering" }
maps.n["<leader>uN"] = { ui.toggle_ui_notifications, desc = "Toggle Notifications" }
maps.n["<leader>up"] = { ui.toggle_paste, desc = "Toggle paste mode" }
maps.n["<leader>us"] = { ui.toggle_spell, desc = "Toggle spellcheck" }
maps.n["<leader>uS"] = { ui.toggle_conceal, desc = "Toggle conceal" }
maps.n["<leader>ut"] = { ui.toggle_tabline, desc = "Toggle tabline" }
maps.n["<leader>uu"] = { ui.toggle_url_match, desc = "Toggle URL highlight" }
maps.n["<leader>uw"] = { ui.toggle_wrap, desc = "Toggle wrap" }
maps.n["<leader>uy"] = { ui.toggle_syntax, desc = "Toggle syntax highlighting (buffer)" }
maps.n["<leader>uh"] = { ui.toggle_foldcolumn, desc = "Toggle foldcolumn" }
-- width will be 85% of the editor width 
maps.n["<leader>uZ"] = { function() require("zen-mode").toggle({ window = { width = .85 } }) end, desc = "Toggle Zen Mode" }

local ai_leader = "<C-M>"
local ai_wleader = "<leader>A"

maps.n[ai_leader] = sections.ai
maps.i[ai_leader] = sections.ai
maps.v[ai_leader] = sections.ai

-- Leader items
maps.n[ai_wleader] = sections.ai
maps.v[ai_wleader] = sections.ai

maps.n[ai_leader .. "c"] = { "<cmd>GpChatNew<cr>", desc = "New Chat" }
maps.n[ai_leader .. "t"] = { "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" }
maps.n[ai_leader .. "f"] = { "<cmd>GpChatFinder<cr>", desc = "Chat Finder" }

maps.n[ai_wleader .. "c"] = { "<cmd>GpChatNew<cr>", desc = "New Chat" }
maps.n[ai_wleader .. "t"] = { "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" }
maps.n[ai_wleader .. "f"] = { "<cmd>GpChatFinder<cr>", desc = "Chat Finder" }

maps.i[ai_leader .. "c"] = { "<cmd>GpChatNew<cr>", desc = "New Chat" }
maps.i[ai_leader .. "t"] = { "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" }
maps.i[ai_leader .. "f"] = { "<cmd>GpChatFinder<cr>", desc = "Chat Finder" }


maps.v[ai_leader .. "c"] = { ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" }
maps.v[ai_leader .. "p"] = { ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat New" }
maps.v[ai_leader .. "t"] = { ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Chat New" }

maps.n[ai_leader .. "<C-x>"] = { "<cmd>GpChatNew split<cr>", desc = "New Chat split" }
maps.n[ai_leader .. "<C-v>"] = { "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" }
maps.n[ai_leader .. "<C-t>"] = { "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" }

maps.n[ai_wleader .. "<C-x>"] = { "<cmd>GpChatNew split<cr>", desc = "New Chat split" }
maps.n[ai_wleader .. "<C-v>"] = { "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" }
maps.n[ai_wleader .. "<C-t>"] = { "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" }

maps.i[ai_leader .. "<C-x>"] = { "<cmd>GpChatNew split<cr>", desc = "New Chat split" }
maps.i[ai_leader .. "<C-v>"] = { "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" }
maps.i[ai_leader .. "<C-t>"] = { "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" }

maps.v[ai_leader .. "<C-x>"] = { ":<C-u>'<,'>GpChatNew split<cr>", desc = "New Chat split" }
maps.v[ai_leader .. "<C-v>"] = { ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "New Chat vsplit" }
maps.v[ai_leader .. "<C-t>"] = { ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "New Chat tabnew" }

maps.v[ai_wleader .. "x"] = { ":<C-u>'<,'>GpChatNew split<cr>", desc = "New Chat split" }
maps.v[ai_wleader .. "v"] = { ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "New Chat vsplit" }
maps.v[ai_wleader .. "t"] = { ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "New Chat tabnew" }

-- Prompt commands
maps.n[ai_leader .. "r"] = { "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" }
maps.n[ai_leader .. "a"] = { "<cmd>GpAppend<cr>", desc = "Append (after)" }
maps.n[ai_leader .. "b"] = { "<cmd>GpPrepend<cr>", desc = "Prepend (before)" }

maps.n[ai_wleader .. "r"] = { "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" }
maps.n[ai_wleader .. "a"] = { "<cmd>GpAppend<cr>", desc = "Append (after)" }
maps.n[ai_wleader .. "b"] = { "<cmd>GpPrepend<cr>", desc = "Prepend (before)" }

maps.i[ai_leader .. "r"] = { "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" }
maps.i[ai_leader .. "a"] = { "<cmd>GpAppend<cr>", desc = "Append (after)" }
maps.i[ai_leader .. "b"] = { "<cmd>GpPrepend<cr>", desc = "Prepend (before)" }

maps.v[ai_leader .. "r"] = { ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" }
maps.v[ai_leader .. "a"] = { ":<C-u>'<,'>GpAppend<cr>", desc = "Visual (after)" }
maps.v[ai_leader .. "b"] = { ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual (before)" }
maps.v[ai_leader .. "i"] = { ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" }

maps.v[ai_wleader .. "r"] = { ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" }
maps.v[ai_wleader .. "a"] = { ":<C-u>'<,'>GpAppend<cr>", desc = "Visual (after)" }
maps.v[ai_wleader .. "b"] = { ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual (before)" }
maps.v[ai_wleader .. "i"] = { ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" }

maps.n[ai_leader .. "g"] = sections.ai_inline
maps.i[ai_leader .. "g"] = sections.ai_inline
maps.v[ai_leader .. "g"] = sections.ai_inline
-- Leader items
maps.n[ai_wleader .. "g"] = sections.ai_inline
maps.v[ai_wleader .. "g"] = sections.ai_inline

maps.n[ai_leader .. "gp"] = { "<cmd>GpPopup<cr>", desc = "Popup" }
maps.n[ai_leader .. "ge"] = { "<cmd>GpEnew<cr>", desc = "GpEnew" }
maps.n[ai_leader .. "gn"] = { "<cmd>GpNew<cr>", desc = "GpNew" }
maps.n[ai_leader .. "gv"] = { "<cmd>GpVnew<cr>", desc = "GpVnew" }
maps.n[ai_leader .. "gt"] = { "<cmd>GpTabnew<cr>", desc = "GpTabnew" }

maps.n[ai_wleader .. "gp"] = { "<cmd>GpPopup<cr>", desc = "Popup" }
maps.n[ai_wleader .. "ge"] = { "<cmd>GpEnew<cr>", desc = "GpEnew" }
maps.n[ai_wleader .. "gn"] = { "<cmd>GpNew<cr>", desc = "GpNew" }
maps.n[ai_wleader .. "gv"] = { "<cmd>GpVnew<cr>", desc = "GpVnew" }
maps.n[ai_wleader .. "gt"] = { "<cmd>GpTabnew<cr>", desc = "GpTabnew" }

maps.i[ai_leader .. "gp"] = { "<cmd>GpPopup<cr>", desc = "Popup" }
maps.i[ai_leader .. "ge"] = { "<cmd>GpEnew<cr>", desc = "GpEnew" }
maps.i[ai_leader .. "gn"] = { "<cmd>GpNew<cr>", desc = "GpNew" }
maps.i[ai_leader .. "gv"] = { "<cmd>GpVnew<cr>", desc = "GpVnew" }
maps.i[ai_leader .. "gt"] = { "<cmd>GpTabnew<cr>", desc = "GpTabnew" }

maps.v[ai_leader .. "gp"] = { ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" }
maps.v[ai_leader .. "ge"] = { ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" }
maps.v[ai_leader .. "gn"] = { ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" }
maps.v[ai_leader .. "gv"] = { ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" }
maps.v[ai_leader .. "gt"] = { ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" }

maps.v[ai_wleader .. "gp"] = { ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" }
maps.v[ai_wleader .. "ge"] = { ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" }
maps.v[ai_wleader .. "gn"] = { ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" }
maps.v[ai_wleader .. "gv"] = { ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" }
maps.v[ai_wleader .. "gt"] = { ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" }

maps.n[ai_leader .. "x"] = { "<cmd>GpContext<cr>", desc = "ToggleContext" }
maps.n[ai_wleader .. "x"] = { "<cmd>GpContext<cr>", desc = "ToggleContext" }
maps.i[ai_leader .. "x"] = { "<cmd>GpContext<cr>", desc = "ToggleContext" }

maps.v[ai_leader .. "x"] = { ":<C-u>'<,'>GpContext<cr>", desc = "ToggleContext" }
maps.v[ai_wleader .. "x"] = { ":<C-u>'<,'>GpContext<cr>", desc = "ToggleContext" }

maps.n[ai_leader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }
maps.n[ai_wleader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }
maps.i[ai_leader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }
maps.v[ai_leader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }
maps.v[ai_wleader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }
maps.x[ai_leader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }
maps.x[ai_wleader .. "s"] = { "<cmd>GpStop<cr>", desc = "Stop" }

maps.n[ai_leader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }
maps.n[ai_wleader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }
maps.i[ai_leader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }
maps.v[ai_leader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }
maps.v[ai_wleader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }
maps.x[ai_leader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }
maps.x[ai_wleader .. "n"] = { "<cmd>GpNextAgent<cr>", desc = "Next Agent" }

maps.n[ai_leader .. "w"] = sections.ai_whisper
maps.i[ai_leader .. "w"] = sections.ai_whisper
maps.v[ai_leader .. "w"] = sections.ai_whisper
-- Leader items
maps.n[ai_wleader .. "w"] = sections.ai_whisper
maps.v[ai_wleader .. "w"] = sections.ai_whisper

-- optional Whisper commands with prefix <C-g>w
maps.n[ai_leader .. "ww"] = { "<cmd>GpWhisper<cr>", desc = "Whisper" }
maps.n[ai_wleader .. "ww"] = { "<cmd>GpWhisper<cr>", desc = "Whisper" }
maps.i[ai_leader .. "ww"] = { "<cmd>GpWhisper<cr>", desc = "Whisper" }
maps.v[ai_leader .. "ww"] = { ":<C-u>'<,'>GpWhisper<cr>", desc = "Visual Whisper" }
maps.v[ai_wleader .. "ww"] = { ":<C-u>'<,'>GpWhisper<cr>", desc = "Visual Whisper" }

maps.n[ai_leader .. "wr"] = { "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" }
maps.n[ai_wleader .. "wr"] = { "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" }
maps.i[ai_leader .. "wr"] = { "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" }
maps.v[ai_leader .. "wr"] = { ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Visual Whisper Rewrite" }
maps.v[ai_wleader .. "wr"] = { ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Visual Whisper Rewrite" }

maps.n[ai_leader .. "wa"] = { "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" }
maps.n[ai_wleader .. "wa"] = { "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" }
maps.i[ai_leader .. "wa"] = { "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" }
maps.n[ai_leader .. "wa"] = { "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" }
maps.v[ai_leader .. "wa"] = { ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Visual Whisper Append (after)" }
maps.v[ai_wleader .. "wa"] = { ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Visual Whisper Append (after)" }

maps.n[ai_leader .. "wb"] = { "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" }
maps.n[ai_wleader .. "wb"] = { "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" }
maps.i[ai_leader .. "wb"] = { "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" }
maps.v[ai_leader .. "wb"] = { ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Visual Whisper Prepend (before)" }
maps.v[ai_wleader .. "wb"] = { ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Visual Whisper Prepend (before)" }

maps.i[ai_leader .. "wp"] = { "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" }
maps.i[ai_leader .. "we"] = { "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" }
maps.i[ai_leader .. "wn"] = { "<cmd>GpWhisperNew<cr>", desc = "Whisper New" }
maps.i[ai_leader .. "wv"] = { "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" }
maps.i[ai_leader .. "wt"] = { "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" }

maps.v[ai_leader .. "wp"] = { ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Visual Whisper Popup" }
maps.v[ai_leader .. "we"] = { ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Visual Whisper Enew" }
maps.v[ai_leader .. "wn"] = { ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Visual Whisper New" }
maps.v[ai_leader .. "wv"] = { ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Visual Whisper Vnew" }
maps.v[ai_leader .. "wt"] = { ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Visual Whisper Tabnew" }

utils.set_mappings(morpheus.user_opts("morpheus.user.mappings", maps))

