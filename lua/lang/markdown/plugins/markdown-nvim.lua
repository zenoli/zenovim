return {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {
        -- log_level = "debug",
        checkbox = {
            unchecked = { icon = " " },
            checked = { icon = "󰄲 " },
            -- unchecked = { icon = "󰄷 "},
            -- checked = { icon = "󰄸 "},
        },
        bullet = {
            icons = { "", '●', '', "◆" },
        },
    },
    name = "render-markdown",                                                            -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
}
