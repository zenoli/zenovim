return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "creativenull/efmls-configs-nvim",
    },
    opts = {
        servers = {
            bashls = {
                opts = {
                    filetypes = { "sh", "zsh" },
                },
            },
        },
        efm = {
            sh = function()
                return {
                    require("efmls-configs.formatters.shfmt"),
                }
            end,
        },
    },
}
