return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "creativenull/efmls-configs-nvim",
    },
    opts = {
        efm = {
            python = function()
                return {
                    require('efmls-configs.linters.flake8'),
                    require("efmls-configs.formatters.black"),
                    require("efmls-configs.formatters.isort"),
                }
            end,
        },
    },
}
