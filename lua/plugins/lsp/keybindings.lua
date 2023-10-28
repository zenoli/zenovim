return {
    setup = function(buf)
        local map = require("config.utils").getMapFn({ buffer = buf })

        map("n", "K", vim.lsp.buf.hover, { desc = "Lsp hover" })
        map("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation"})
        map("n", "<leader>ld", function() vim.diagnostic.open_float { scope = "line" } end, { desc = "Show line diagnostics" })
        map("n", "<leader>cd", function() vim.diagnostic.open_float { scope = "cursor" } end, { desc = "Show cursor diagnostics" })
        map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
        map("n", "<leader>F", vim.lsp.buf.format, { desc = "Format document" })
        map("n", "<space>gd", vim.lsp.buf.type_definition, { desc = "Goto definition" })
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
        map("n", "<leader>sd", function() require("telescope.builtin").diagnostics() end, { desc = "Search diagnostics" })
        map("n", "gr", function() require("telescope.builtin").lsp_references() end, { desc = "Goto references"})
        map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { desc = "Godo definition" })
        map(
            "n",
            "gD",
            function() require("telescope.builtin").lsp_definitions { jump_type = "vsplit" } end,
            { desc = "Goto definition in split" }
        )
        map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
        map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
    end,
}
