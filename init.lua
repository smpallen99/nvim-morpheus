if vim.loader and vim.fn.has("nvim-0.9.1") == 1 then
	vim.loader.enable()
end

-- if File_watchers == nil then
-- 	File_watchers = {}
-- end
--
-- local watch_file_augroup = "watch_file_augroup"
--
-- vim.api.nvim_create_augroup(watch_file_augroup, { clear = true })
-- vim.api.nvim_create_autocmd("VimLeave", {
-- 	group = watch_file_augroup,
-- 	callback = function()
-- 		for _, watcher in pairs(File_watchers) do
-- 			watcher:stop()
-- 		end
-- 	end,
-- })
-- local function watch_file(fname, cb, time)
-- 	if File_watchers[fname] then
-- 		File_watchers[fname]:stop()
-- 		File_watchers[fname] = nil
-- 	end
--
-- 	File_watchers[fname] = vim.loop.new_fs_poll()
-- 	File_watchers[fname]:start(fname, time, vim.schedule_wrap(cb))
-- end
--
-- local init_lua = vim.fn.stdpath("config") .. "/init.lua"
-- -- local conf_lua = vim.fn.stdpath('config')..'/lua/configuration.lua'
--
-- watch_file(conf_lua, function()
-- 	dofile(init_lua)
-- 	vim.notify("Reloaded init.lua", vim.diagnostic.severity.INFO)
-- end, 500)
--
for _, source in ipairs({
	"morpheus.bootstrap",
	"morpheus.options",
	"morpheus.lazy",
	"morpheus.autocmds",
	"morpheus.mappings",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

if morpheus.default_colorscheme then
	if not pcall(vim.cmd.colorscheme, morpheus.default_colorscheme) then
		require("morpheus.utils").notify(
			("Error setting up colorscheme: `%s`"):format(morpheus.default_colorscheme),
			vim.log.levels.ERROR
		)
	end
end

require("morpheus.utils").conditional_func(morpheus.user_opts("polish", nil, false), true)

local settings = require("configuration")

if settings.enable_transparent then
  require("transparent").clear_prefix("NeoTree")
end

