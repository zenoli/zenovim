return {
    "norcalli/nvim-colorizer.lua",
    opts = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    config = function(_, opts)
        require "colorizer".setup(opts, { names = false })
    end,
}
