local M = {}

function M.getMapFn(default_opts)
    default_opts = default_opts or {}
    return function(mode, lhs, rhs, opts)
        opts = opts or {}
        vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
    end
end

function M.map(mode, lhs, rhs, opts)
    opts = opts or {}
    local default_opts = { silent = false }
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
end

function M.read_dir(path)
    local uv = vim.loop
    return uv.fs_readdir(uv.fs_opendir(vim.fn.stdpath("config") .. "/" .. path, nil, 1000))
end

function M.if_module(module_name, cb, opts)
    opts = opts or {}
    local status_ok, module = pcall(require, module_name)
    if status_ok then
        cb(module)
    elseif not opts.silent then
        local messages = { "Failed to load module " .. module_name }
        if opts.message then
            table.insert(messages, opts.message)
        end
        vim.notify(messages, vim.log.levels.WARN)
    end
end

return M
