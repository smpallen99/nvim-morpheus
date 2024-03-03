return {
  cmd = { "/usr/local/bin/elixir-ls" },
  settings = {
    elixirls = {
      elixirLS = {
        enableTestLenses = true,
        dialyzerEnabled = true,
        fetchDeps = false,
        suggestSpecs = true,
        -- commands = {
        --   ["elixir.lens.test.run"] = test,
        -- },
      },
    },
  },
}
