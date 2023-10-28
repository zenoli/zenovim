return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            typescript = {
                "js-debug-adapter",
                "prettier",
                "typescript-language-server", -- tsserver
            },
        },
    },
}
