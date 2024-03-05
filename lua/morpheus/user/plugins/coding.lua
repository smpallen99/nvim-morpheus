return {

  -- Jsdoc
  {
    "heavenshell/vim-jsdoc",
    ft = "javascript,typescript,typescriptreact,svelte",
    cmd = "JsDoc",
    keys = {
      { "<leader>D", "<cmd>JsDoc<cr>", desc = "JsDoc" },
    },
    build = "make install",
  },
}

