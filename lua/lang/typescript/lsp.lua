local prettier_d = require("efmls-configs.formatters.prettier_d")
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "creativenull/efmls-configs-nvim",
    },
    opts = {
        efm = {
            javascript = function() return { prettier_d } end,
            javascriptreact = function() return { prettier_d } end,
            typescript = function() return { prettier_d } end,
            typescriptreact = function() return { prettier_d } end,
        },
    },
}
