local git_version = vim.fn.system { "git", "--version" }
if vim.api.nvim_get_vvar "shell_error" ~= 0 then
  vim.api.nvim_err_writeln("Git doesn't appear to be available...\n\n" .. git_version)
end
local major, min, _ = unpack(vim.tbl_map(tonumber, vim.split(git_version:match "%d+%.%d+%.%d", "%.")))
local modern_git = major > 2 or (major == 2 and min >= 19)

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
  local clone = { "git", "clone", modern_git and "--filter=blob:none" or nil }
  local output =
    vim.fn.system(vim.list_extend(clone, { "--branch=stable", "https://github.com/folke/lazy.nvim.git", lazypath }))
  if vim.api.nvim_get_vvar "shell_error" ~= 0 then
    vim.api.nvim_err_writeln("Error cloning lazy.nvim repository...\n\n" .. output)
  end
  local oldcmdheight = vim.opt.cmdheight:get()
  vim.opt.cmdheight = 1
  vim.notify "Please wait while plugins are installed..."
  vim.api.nvim_create_autocmd("User", {
    desc = "Load Mason and Treesitter after Lazy installs plugins",
    once = true,
    pattern = "LazyInstall",
    callback = function()
      vim.cmd.bw()
      vim.opt.cmdheight = oldcmdheight
      vim.tbl_map(function(module) pcall(require, module) end, { "nvim-treesitter", "mason" })
      require("morpheus.utils").notify "Mason is installing packages if configured, check status with `:Mason`"
    end,
  })
end
vim.opt.rtp:prepend(lazypath)

local user_plugins = morpheus.user_opts "morpheus.plugins"
for _, config_dir in ipairs(morpheus.supported_configs) do
  if vim.fn.isdirectory(config_dir .. "/lua/morpheus/user/plugins") == 1 then
    user_plugins = { import = "morpheus.user.plugins" }
  end
end

local spec = morpheus.updater.options.pin_plugins and { { import = morpheus.updater.snapshot.module } } or {}
vim.list_extend(spec, { { import = "morpheus.plugins" }, user_plugins })

local colorscheme = morpheus.default_colorscheme and { morpheus.default_colorscheme } or nil

require("lazy").setup(morpheus.user_opts("lazy", {
  spec = spec,
  defaults = { lazy = true },
  git = { filter = modern_git },
  install = { colorscheme = colorscheme },
  performance = {
    rtp = {
      paths = morpheus.supported_configs,
      disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
}))
--
-- From original
--
--
-- local lazy = {}
--
-- function lazy.install(path)
-- 	if not vim.loop.fs_stat(path) then
-- 		print("Installing lazy.nvim....")
-- 		vim.fn.system({
-- 			"git",
-- 			"clone",
-- 			"--filter=blob:none",
-- 			"https://github.com/folke/lazy.nvim.git",
-- 			"--branch=stable", -- latest stable release
-- 			path,
-- 		})
-- 	end
-- end
--
-- function lazy.setup(plugins)
-- 	if vim.g.plugins_ready then
-- 		return
-- 	end
--
-- 	-- You can "comment out" the line below after lazy.nvim is installed
-- 	lazy.install(lazy.path)
--
-- 	vim.opt.rtp:prepend(lazy.path)
--
-- 	require("lazy").setup(plugins, lazy.opts)
-- 	vim.g.plugins_ready = true
-- end
--
-- lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- lazy.opts = {}
--
-- lazy.setup({ { import = "morpheus.plugins" } })
