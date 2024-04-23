local prettier_d = require("efmls-configs.formatters.prettier_d")
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "creativenull/efmls-configs-nvim",
    },
    opts = {
        efm = {
            css = function() return { prettier_d } end,
        },
    },
}
