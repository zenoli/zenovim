return {
    "stevearc/dressing.nvim",
    lazy = true,
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

    opts = function()
        local border = "rounded"
        local transparency = 20 -- (0 - 100)
        return {
            select = {
                enabled = true,
                -- Change the order to use `telescope` backend
                backend = { "builtin", "telescope" },
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
        }
    end,
}
