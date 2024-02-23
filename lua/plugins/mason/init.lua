return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" },
        {
            "williamboman/mason.nvim",
            opts = {
                ui = { border = "rounded" },
                registries = {
                    "github:mason-org/mason-registry",
                },
            },
            cmd = "Mason",
            build = ":MasonUpdate",
        },
    },
    cmd = {
        "MasonToolsInstall",
        "MasonToolsUpdate",
        "MasonToolsClean",
    },
    opts = {
        ensure_installed = {
            general = {
                "docker-compose-language-service",
                "dockerfile-language-server",
                "efm",
                "lua_ls",
            },
        },
    },
    config = function(_, opts)
        -- Merge tool opts
        local ensure_installed_merged = {}
        for _, v in pairs(opts.ensure_installed) do
            vim.list_extend(ensure_installed_merged, v)
        end

        opts.ensure_installed = ensure_installed_merged
        require "mason-tool-installer".setup(opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "MasonToolsStartingInstall",
            callback = function(ev)
                vim.schedule(function()
                    if vim.bo.filetype == "lazy" then
                        vim.cmd [[normal q]] -- Try closing open lazy window
                    end
                    require "mason.ui".open()
                end)
            end,
        })
    end,
    build = Noop,
}
