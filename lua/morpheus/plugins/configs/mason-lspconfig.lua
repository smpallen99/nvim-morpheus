return function(_, opts)
  require("mason-lspconfig").setup(opts)
  require("morpheus.utils").event "MasonLspSetup"
end
