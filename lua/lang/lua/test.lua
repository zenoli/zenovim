return {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
        "nvim-neotest/neotest-plenary",
    },
    opts = {
        adapters = {
            -- Note: Files must end with '_spec.lua' in order to get picked up.
            ["neotest-plenary"] = {},
        },
    },
}
