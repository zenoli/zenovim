return {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
        timer = {
            spinner_rate = 125,  -- frame rate of spinner animation, in ms
            fidget_decay = 1000, -- how long to keep around empty fidget, in ms
            task_decay = 500,   -- how long to keep around completed task, in ms
        },
        sources = {
            ["jdtls"] = {
                ignore = true,
            },
        },
    },
}
