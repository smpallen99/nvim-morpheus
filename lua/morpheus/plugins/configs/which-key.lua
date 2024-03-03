return function(_, opts)
  require("which-key").setup(opts)
  require("morpheus.utils").which_key_register()
end
