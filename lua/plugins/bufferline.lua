return {
    "akinsho/bufferline.nvim",
    tag = "*",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tiagovla/scope.nvim",
    },
    opts = {
        mode = "tabs",
        always_show_bufferline = false,
    },
    config = function(_, opts)
        if opts.mode == "buffers" then
            -- We only want scoped tabs if we use a bufferline
            require("scope").setup {}
        end
        require("bufferline").setup {
            options = opts,
        }
    end,
    vim.api.nvim_set_hl(0, "BufferLineTabSelected",
        { link = "BufferlineBufferSelected", default = true }),
}
