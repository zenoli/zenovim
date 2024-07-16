return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/neodev.nvim",
    },
    opts = {
        servers = {
            basedpyright = {
                opts = {
                    settings = {
                        basedpyright = {
                            typeCheckingMode = "standard",
                        },
                    },
                    on_attach = function(client, bufnr)
                        -- Disable semantic highlighting
                        client.server_capabilities.semanticTokensProvider = nil
                    end,
                },
                setup = function()
                    require("neodev")
                end,
            },
        },
    },
}
