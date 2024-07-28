return {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    enabled = true,
    opts = {
        checkbox = {
            unchecked = { icon = " " },
            checked = { icon = "󰄲 " },
        },
        bullet = {
            icons = { "", "", "◆", "◇" },
        },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
}
