return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            python = {
                "black",
                "debugpy",
                "flake8",
                "isort",
                "pyright",
            },
        },
    },
}
