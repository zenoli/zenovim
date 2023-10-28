return {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    config = function()
        local debugpy_bin_path = require "plugins.mason.utils".mason_package_path()
            .. "/debugpy/venv/bin/python"
        require("dap-python").setup(debugpy_bin_path)
    end,
}
