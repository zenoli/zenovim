return {
    "pmizio/typescript-tools.nvim",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end,
    },
}
