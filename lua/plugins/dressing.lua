local border = "rounded"
local transparency = 20 -- (0 - 100)

return {
    "stevearc/dressing.nvim",
    lazy = true,
    enabled = true,
    init = function()
        -- This was adapted from LazyVim. In case this causes issues in the future,
        -- fallback to using the `VeryLazy` event for deferred loading
        local function load()
            require "lazy".load { plugins = { "dressing.nvim" } }
        end
        vim.ui.select = function(...)
            load()
            return vim.ui.select(...)
        end
        vim.ui.input = function(...)
            load()
            return vim.ui.input(...)
        end
    end,

    opts = {
        select = {
            enabled = true,
            -- Change the order to use `telescope` backend
            backend = { "telescope", "builtin" },
            builtin = {
                win_options = {
                    winblend = transparency,
                },
                border = border,
                winhighlight = "NormalFloat:NormalNC",
            },
        },
        input = {
            enabled = true,
            default_prompt = "Input:",
            prompt_align = "center",
            insert_only = false,
            start_in_insert = true,
            border = border,
            win_options = {
                winblend = transparency,
            },
        },
    },
}
