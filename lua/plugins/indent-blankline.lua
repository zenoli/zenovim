return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        show_current_context = true,
        show_current_context_start = false,
    },
}
