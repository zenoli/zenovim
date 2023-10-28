local M = {}

function M.dap_keybind(dap_action, key)
    local dap = require("dap")
    if dap.session() then
        dap[dap_action]()
    else
        vim.cmd([[execute "normal! ]] .. key .. [["]])
    end
end

function M.set_conditional_breakpoint()
    vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
        require("dap").set_breakpoint(input)
    end)
end

function M.set_logpoint()
    vim.ui.input({ prompt = "Log point message: " }, function(input)
        require("dap").set_breakpoint(nil, nil, input)
    end)
end

function M.focus_dapui_window(name)
    local fn = vim.fn
    local bufname = vim.fn.bufname("DAP " .. name)

    if bufname == "" then
        return
    end

    local bufnr = vim.fn.bufnr(bufname)
    local windows = vim.fn.win_findbuf(bufnr)

    if #windows > 0 then
        vim.fn.win_gotoid(windows[1])
    end
end

function M.register_dapui_handlers()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = function()
        require("config.utils").if_module("neo-tree", function()
            vim.cmd([[Neotree close]])
        end)
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

function M.setup_debug_signs(icons)
    for name, icon in pairs(icons) do
        vim.fn.sign_define(name, icon)
    end
end

return M
