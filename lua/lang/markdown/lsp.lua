local prettier_d = require("efmls-configs.formatters.prettier_d")
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "creativenull/efmls-configs-nvim",
    },
    opts = {
        servers = {
            markdown_oxide = {
                opts = {
                    capabilities = {
                        workspace = {
                            didChangeWatchedFiles = {
                                dynamicRegistration = true,
                            },
                        },
                    },
                },
            },


        },
        efm = {
            markdown = function() return { prettier_d } end,
        },
    },
}
