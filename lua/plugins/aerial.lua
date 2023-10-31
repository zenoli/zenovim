return {
    "stevearc/aerial.nvim",
    dependencies = "nvim-lspconfig",
    keys = {
        { "<leader>o", "<cmd>AerialToggle right<cr>", desc = "Toggle Aearial drawer" },
    },
    opts = {
        backends = { "lsp", "treesitter", "markdown", "man" },
    },
}
