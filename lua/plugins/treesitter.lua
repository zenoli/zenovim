return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    build = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
    },
    opts = {
        indent = {
            enable = true,
            disable = { "python" },
        },
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
        autotag = {
            enable = true,
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
    config = function(_, opts)
        opts.ensure_installed = vim.tbl_flatten(
            vim.tbl_values(opts.ensure_installed)
        )
        require "nvim-treesitter.configs".setup(opts)
    end,
}
