return {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
        "nvim-neotest/neotest-python",
    },
    opts = {
        adapters = {
            ["neotest-python"] = {
                dap = { justMyCode = false },
            },
        },
    },
}
