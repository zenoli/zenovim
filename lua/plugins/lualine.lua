return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            disabled_filetypes = {
                statusline = { "neo-tree", "calendar" },
                winbar = {},
            },
            ignore_focus = { "neo-tree", "calendar" },
        },
        sections = {
            lualine_b = { "branch" },
        }
    }
}
