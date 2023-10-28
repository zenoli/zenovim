return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
            servers = {
                cssls = {},
                tailwindcss = {},
            },
        })
    end,
}
