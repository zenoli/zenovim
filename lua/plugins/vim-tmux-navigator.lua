return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.api.nvim_set_var("tmux_navigator_disable_when_zoomed", 1)
        vim.api.nvim_set_var("tmux_navigator_no_mappings", 1)


        local map = require "config.utils".map
        map("n", "<a-h>", "<cmd>TmuxNavigateLeft<cr>")
        map("n", "<a-j>", "<cmd>TmuxNavigateDown<cr>")
        map("n", "<a-k>", "<cmd>TmuxNavigateUp<cr>")
        map("n", "<a-l>", "<cmd>TmuxNavigateRigh<cr>")
    end
}

