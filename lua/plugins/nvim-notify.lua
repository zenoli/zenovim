return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = true,
    opts = {
        render = "default",
        timeout = 2000, -- takes a total of 4s (1 fade-in + 2 timeout + 1 fadeout)
    },
    config = function(_, opts)
        local nvim_notify = require "notify"
        nvim_notify.setup(opts)

        local banned_messages = { "No information available" }

        vim.notify = function(msg, ...)
            for _, banned in ipairs(banned_messages) do
                if msg == banned then
                    return
                end
            end
            nvim_notify(msg, ...)
        end
    end,
}
