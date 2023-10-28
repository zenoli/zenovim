return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            bash = {
                "bash-debug-adapter",
                "bash-language-server", --bashls
                "shellcheck",
                "shfmt",
            },
        },
    },
}
