return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
        render = "default",
        timeout = 2000, -- takes a total of 4s (1 fade-in + 2 timeout + 1 fadeout)
    },
    config = function(_, opts)
        local nvim_notify = require "notify"
        nvim_notify.setup(opts)
        vim.notify = nvim_notify
    end,
}
