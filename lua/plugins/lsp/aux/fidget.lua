return {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
        progress = {
            suppress_on_insert = true,   -- Suppress new messages while in insert mode
            ignore_done_already = false, -- Ignore new tasks that are already complete
            ignore = { "jdtls" },
        },
    },
}
