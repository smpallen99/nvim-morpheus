local settings = require("configuration")
return {
  opt = {},
  g = {
    mapleader = " ",
    autoformat_enabled = true,
    cmp_enabled = true,
    autopares_enabled = true,
    diagnostices_mode = 3,
    icons_enabled = true,
    ui_notifications_enabled = true,

    neovide_hide_mouse_when_typing = true,
    neovide_transparency = 0.95,
    noevide_confirm_quit = true,
    noevide_scroll_animation_length = 0.5,
    codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
    highlighturl_enabled = true, -- highlight URLs by default
    inlay_hints_enabled = false, -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
    lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signature help)
    semantic_tokens_enabled = true, -- enable or disable LSP semantic tokens on startup

    transparent_enabled = settings.enable_transparent,
  }
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
