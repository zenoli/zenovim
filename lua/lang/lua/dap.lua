return {
    "mfussenegger/nvim-dap",
    dependencies = { "jbyuki/one-small-step-for-vimkind" },
    opts = {
        adapters = {
            nlua = function(callback, config)
                callback {
                    type = "server",
                    host = config.host or "127.0.0.1",
                    port = config.port or 8086,
                }
            end,
        },
        configurations = {
            lua = {
                {
                    type = "nlua",
                    request = "attach",
                    name = "Attach to running Neovim instance",
                },
            },
        },
    },
}
