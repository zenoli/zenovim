return {
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    "numToStr/Comment.nvim",
    keys = { "gcc", "gco", "gcO", "gcb", { "gc", "S", mode = "x" } },
    config = function(_, opts)
        require("Comment").setup {
            -- Enable commenting tsx
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
    end,
}
