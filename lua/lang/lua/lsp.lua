return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
    },
    opts = {
        servers = {
            lua_ls = {
                opts = {
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                setup = function()
                    require("neodev")
                end,
            },
        },
    },
}
