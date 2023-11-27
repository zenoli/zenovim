return {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Navbuddy",
    keys = {
        { "<leader>O", "<cmd>Navbuddy<cr>", desc = "Toggle Navbudy" },
    },
    opts = {
        lsp = { auto_attach = false },
        window = {
            border = "rounded",
        },
    },
}
