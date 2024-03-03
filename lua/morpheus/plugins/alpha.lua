return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    dashboard.section.header.val = {
      "    __  __                                  _",
      "   F  /  ]     ____     _ ___   _ ___     FJ___      ____     _    _     ____ ",
      "  J |__/| L   F __ J   J '__ \",J '__ J   J  __ `.   F __ J   J |  | L   F ___J",
      "  | |`--'| |  | |--| |  | |__|-J| |--| |  | |--| |  | _____J  | |  | |  | '----_",
      "  F L    J J  F L__J J  F L  `-'F L__J J  F L  J J  F L___--. F L__J J  )-____  L",
      " J__L    J__LJ______/FJ__L    J  _____/LJ__L  J__LJ______/FJ____,__LJ______/F",
      " |__L    J__| J______F |__L    |_J_____F |__L  J__| J______F  J____,__F J______F",
      "                                       L_J",
      "",
      "                        _  _           __",
      "                       F L L]  _    _  LJ   _ _____",
      "                      J   | LJ |  | L     J '_  _ `,",
      "                      | |   |J J  F L FJ  | |_||_| |",
      "                      F L\\  JJ / /FJ  L F L LJ J J",
      "                     J__L \\__L\\__// J__LJ__L LJ J__L",
      "                     |__L  J__| __/  |__||__L LJ J__|",
    }

    dashboard.section.header.opts.hl = "DashboardHeader"
    dashboard.section.footer.opts.hl = "DashboardFooter"

    local button, get_icon = require("morpheus.utils").alpha_button, require("morpheus.utils").get_icon
    dashboard.section.buttons.val = {
      button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
      button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
    }

    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 3 },
      dashboard.section.footer,
    }
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "morpheus.plugins.configs.alpha",
}
