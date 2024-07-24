return {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {
        checkbox = {
            unchecked = { icon = " " },
            checked = { icon = "󰄲 " },
        },
        bullet = {
            right_pad = 1,
            icons = { "●", '', "◆", '◇' },
        },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
}
