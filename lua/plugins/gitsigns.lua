return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        preview_config = { border = "rounded" },
        on_attach = function(bufnr)
            local map = require("config.utils").getMapFn { buffer = bufnr }
            local gs = package.loaded.gitsigns

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then return "]c" end
                vim.schedule(function() gs.next_hunk() end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "[c", function()
                if vim.wo.diff then return "[c" end
                vim.schedule(function() gs.prev_hunk() end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
            map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
            map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
            map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
            map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Unstage hunk" })
            map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
            map("n", "<leader>hd", gs.preview_hunk_inline, { desc = "Diff hunk inline" })
            map("n", "<leader>hb", function() gs.blame_line { full = true } end,
                { desc = "Git blame" })
            map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<cr>")
        end,
    },
}
