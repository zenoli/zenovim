return {
    {
        "<F5>",
        function()
            require "osv".launch { port = 8086 }
        end,
        desc = "Adapter Lua Server",
    },
    {
        "<leader>do",
        function()
            require "osv".run_this()
        end,
        desc = "Adapter Lua",
    },
}
