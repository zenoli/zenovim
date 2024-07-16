return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            python = {
                "debugpy",
                "basedpyright",
                "ruff-lsp",
            },
        },
    },
}
