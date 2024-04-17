return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            typescript = {
                "js-debug-adapter",
                "prettierd",
                "typescript-language-server", -- tsserver
            },
        },
    },
}
