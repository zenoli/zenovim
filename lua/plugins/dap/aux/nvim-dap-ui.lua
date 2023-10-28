return {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    opts = {
        mappings = {
            expand = "o",
            open = "<cr>",
            remove = { "d", "D" },
            edit = "e",
            repl = "r",
            toggle = "t",
        },
        layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.25 },
                    "breakpoints",
                    "stacks",
                    "watches",
                },
                size = 60,
                position = "left",
            },
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 0.25, -- 25% of total lines
                position = "bottom",
            },
        },
        floating = {
            max_height = nil,   -- These can be integers or a float between 0 and 1.
            max_width = nil,    -- Floats will be treated as percentage of your screen.
            border = "rounded", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 2 },
        render = {
            max_type_length = nil, -- Can be integer or nil.
        },
    },
}
