local M = {}

function M.bootstrap()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

function M.generate_import_specs()
    local utils = require "config.utils"
    local specs = { { import = "plugins" } }
    local outer_stats = utils.read_dir("lua/lang")
    for _, outer_stat in ipairs(outer_stats) do
        if outer_stat.type == "directory" then
            local inner_stats = utils.read_dir("lua/lang/" .. outer_stat.name)
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
