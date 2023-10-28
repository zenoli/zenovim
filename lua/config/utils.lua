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

function M.generate_import_specs()
    local specs = { { import = "plugins" } }
    local outer_stats = M.read_dir("lua/lang")
    for _, outer_stat in ipairs(outer_stats) do
        if outer_stat.type == "directory" then
            local inner_stats = M.read_dir("lua/lang/" .. outer_stat.name)
           table.insert(specs, { import = "lang" .. "." .. outer_stat.name })
            for _, inner_stat in ipairs(inner_stats) do
                if inner_stat.type == "directory" then
                    table.insert(specs, { import = "lang." .. outer_stat.name .. "." .. inner_stat.name})
                end
            end
        end
    end
    return specs
end

return M
