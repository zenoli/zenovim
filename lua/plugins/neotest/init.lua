return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
    },
    keys = require "plugins.neotest.keybindings",
    config = function(_, opts)
        local adapters = {}

        for name, config in pairs(opts.adapters or {}) do
            local adapter = require(name)(config)
            adapters[#adapters + 1] = adapter
        end

        require "neotest".setup {
            adapters = adapters,
        }
    end,
}
