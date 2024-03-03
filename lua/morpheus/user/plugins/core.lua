return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    keys = {
      { "<leader>ua", function() require("alpha").start() end, desc = "Home screen" },
    },
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        -- [[                                                    ]],
        -- [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        -- [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        -- [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        -- [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        -- [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        -- [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        -- [[                                                    ]],

        [[    __  __                                  _]],
        [[   F  /  ]     ____     _ ___   _ ___     FJ___      ____     _    _     ____ ]],
        [[  J |__/| L   F __ J   J '__ ",J '__ J   J  __ `.   F __ J   J |  | L   F ___J]],
        [[  | |`--'| |  | |--| |  | |__|-J| |--| |  | |--| |  | _____J  | |  | |  | '----_]],
        [[  F L    J J  F L__J J  F L  `-'F L__J J  F L  J J  F L___--. F L__J J  )-____  L]],
        [[ J__L    J__LJ______/FJ__L    J  _____/LJ__L  J__LJ______/FJ____,__LJ______/F]],
        [[ |__L    J__| J______F |__L    |_J_____F |__L  J__| J______F  J____,__F J______F]],
        [[                                       L_J]],
        [[ ]],
        [[                        _  _           __]],
        [[                       F L L]  _    _  LJ   _ _____]],
        [[                      J   | LJ |  | L     J '_  _ `,]],
        [[                      | |   |J J  F L FJ  | |_||_| |]],
        [[                      F L\  JJ / /FJ  L F L LJ J J]],
        [[                     J__L \__L\__// J__LJ__L LJ J__L]],
        [[                     |__L  J__| __/  |__||__L LJ J__|]],

        -- [[<-. (`-')                (`-')  _  (`-') (`-').-> (`-')  _            (`-').->]],
        -- [[   (OO )_      .->   <-.(OO )  -.(OO ) (OO )__  ( OO).-/     .->    ( OO)_]],
        -- [[,--./  ,-.)(`-')----. ,------,) _.'    ,--. ,'-'(,------.,--.(,--.  (_)--_)]],
        -- [[|   `.'   |( OO).-.  '|   /`. '(_...--''|  | |  | |  .---'|  | |(`-')/    _ /]],
        -- [[|  |'.'|  |( _) | |  ||  |_.' ||  |_.' ||  `-'  |(|  '--. |  | |(OO )_..`--.]],
        -- [[|  |   |  | |  |)|  ||  .   .'|  .___.'|  .-.  | |  .--' |  | | |  .-._)]],
        -- [[|  |   |  |  '  '-'  '|  |   |  |     |  | |  | |  `---.  '-'(_ .'       /]],
        -- [[`--'   `--'   `-----' `--' '--'`--'     `--' `--' `------' `-----'    `-----' ]],
        -- [[                  <-. (`-')_      (`-')  _     <-. (`-')]],
        -- [[                     ( OO) )    _(OO ) (_)       (OO )_]],
        -- [[                  ,--./ ,--/,--.(_/,-. ,-(`-'),--./  ,-.)]],
        -- [[                  |    |  |    / (_/ | ( OO)|   `.'   |]],
        -- [[                  |  . '|  |)   /   /  |  |  )|  |'.'|  |]],
        -- [[                  |  |    |_      /_)(|  |_/ |  |   |  |]],
        -- [[                  |  |    |-'   /    |  |'->|  |   |  |]],
        -- [[                  `--'  `--'    `-'     `--'   `--'   `--']],
      }
      return opts
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = { enabled = false },
        suggestion = { enabled = false, auto_trigger = true },
      }
    end,
  },
  -- after much trouble shooting, I found this config in
  -- https://www.lazyvim.org/extras/coding/copilot
  -- I had to copy the more involed config below
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require "copilot_cmp"
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      on_attach = function(client)
        if client.name == "copilot" then copilot_cmp._on_insert_enter {} end
      end
    end,
  },
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require "copilot_cmp"
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          on_attach = function(client)
            if client.name == "copilot" then copilot_cmp._on_insert_enter {} end
          end
        end,
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 100,
      })
    end,
  },

  {
    "robitx/gp.nvim",
    enable = true,
    lazy = false,
    config = function()
      require("gp").setup(require "morpheus.user.plugins.configs.gp")

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(config)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },

}
