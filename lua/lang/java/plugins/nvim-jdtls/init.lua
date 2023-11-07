-- Mostly taken and adapted from LazyVim. Thanks folke :-)
return {
    "mfussenegger/nvim-jdtls",
    dependencies = {
        "mfussenegger/nvim-dap",
        "williamboman/mason.nvim",
    },
    ft = { "java" },
    opts = function()
        local jdtls_utils = require("lang.java.plugins.nvim-jdtls.utils")
        return {
            cmd = jdtls_utils.get_cmd(),
            root_dir = jdtls_utils.get_root_dir(),
            settings = {
                java = { signatureHelp = { enabled = true } },
            },
            init_options = {
                bundles = jdtls_utils.get_bundles(),
            },
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end,
    config = function(_, opts)
        local mason_registry = require("mason-registry")
        local function attach_jdtls()
            require("jdtls").start_or_attach(opts)
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java" },
            callback = attach_jdtls,
        })

        local dap_opts = { hotcodereplace = "auto", config_overrides = {} }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("Jdtls", {}),
            desc = "Define jdtls specific lsp settings",
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.name == "jdtls" then
                    if mason_registry.is_installed("java-debug-adapter") then
                        require("jdtls").setup_dap(dap_opts)
                        require("jdtls.dap").setup_dap_main_class_configs()
                        require("lang.java.plugins.nvim-jdtls.keybindings").setup()
                    end
                end
            end,
        })

        attach_jdtls()
    end,
}
