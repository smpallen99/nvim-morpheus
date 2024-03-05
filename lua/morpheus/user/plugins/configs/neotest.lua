local status_ok, neotest = pcall(require, "neotest")
if status_ok then
  neotest.setup {
    adapters = {
      require "neotest-elixir" {
        mix_task = "test.interactive",
        extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
      },
      require "neotest-plenary",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "elixir" },
      },
      require("neotest-vitest") {
        -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
        filter_dir = function(name, rel_path, root)
          return name ~= "node_modules"
        end,
      },
    },
  }
end


