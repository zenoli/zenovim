return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
        theme = {
            dirname = { fg = "#737aa2" },
            -- dirname = { link = "SpecialKey" },
            basename = { link = "String", bold = true },
            context = { link = "Function" },
            separator = { link = "barbecue_dirname" },
        },
    },
}
