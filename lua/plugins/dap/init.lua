return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "williamboman/mason.nvim",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    import = "plugins.dap.aux",
    keys = require "plugins.dap.keybindings",
    config = function(_, opts)
        local dap_utils = require("plugins.dap.utils")
        local icons = require("plugins.dap.icons")
        dap_utils.setup_debug_signs(icons)
        dap_utils.register_dapui_handlers()

        -- Setup language specific adapters/configurations defined in `lang/**/dap.lua`
        local dap = require "dap"
        dap.adapters = vim.tbl_extend("force", dap.adapters, opts.adapters)
        dap.configurations = vim.tbl_extend(
            "force",
            dap.configurations,
            opts.configurations
        )
        require('dap.ext.vscode').load_launchjs()
    end,
}
