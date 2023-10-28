return {
    setup = function(buf)
        local map = require("config.utils").getMapFn({ buffer = buf })
        map("n", "<leader>ja", require("jdtls.dap").test_class, { desc = "Run/Debug all java tests" })
        map("n", "<leader>jn", require("jdtls.dap").test_nearest_method, { desc = "Run/Debug nearest java tests" })
        map("n", "<leader>jp", require("jdtls.dap").pick_test, { desc = "Pick java test" })
    end,
}
