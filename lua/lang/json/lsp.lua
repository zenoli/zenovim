return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "b0o/schemastore.nvim",
    },
    opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
            servers = {
                jsonls = {
                    opts = {
                        settings = {
                            json = {
                                schemas = vim.list_extend({
                                    {
                                        description = "Railway.app JSON schema",
                                        fileMatch = { "railway.json", ".railway.json" },
                                        name = "railway.json",
                                        url = "https://railway.app/railway.schema.json",
                                    },
                                }, require("schemastore").json.schemas()),
                                validate = { enable = true },
                            },
                        },
                    },
                },
            },
        })
    end,
}
