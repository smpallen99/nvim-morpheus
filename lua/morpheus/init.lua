local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load("morpheus.user.settings")
load("morpheus.user.commands")
load("morpheus.user.keymaps")
require("morpheus.user.plugins")

pcall(vim.cmd.colorscheme, "tokyonight")
