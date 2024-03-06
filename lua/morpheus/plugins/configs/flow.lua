return  function()
    local flow_status_ok, flow = pcall(require, "flow")
    if not flow_status_ok then
        return
    end

    require("flow").setup({
        output = {
            buffer = true,
            split_cmd = "80vsplit",
        },
        filetype_cmd_map = {
            lua = "lua <<-EOF\n%s\nEOF",
            python = "python <<-EOF\n%s\nEOF",
            ruby = "ruby <<-EOF\n%s\nEOF",
            bash = "bash <<-EOF\n%s\nEOF",
            sh = "sh <<-EOF\n%s\nEOF",
            scheme = "scheme <<-EOF\n%s\nEOF",
            javascript = "node <<-EOF\n%s\nEOF",
            typescript = "node <<-EOF\n%s\nEOF",
            elixir = "elixire <<-EOF\n%s\nEOF",
            go = "go run .",
        },
    })
end

