return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "creativenull/efmls-configs-nvim",
        "folke/neoconf.nvim",
        "SmiteshP/nvim-navic",
    },
    import = "plugins.lsp.aux",
    event = { "BufReadPre", "BufNewFile" },
    opts = (function()
        return {
            diagnostics = {
                signs = require "plugins.lsp.icons",
                config = {
                    virtual_text = false,
                    update_in_insert = true,
                    underline = true,
                    severity_sort = true,
                    float = {
                        focusable = false,
                        border = "rounded",
                        style = "minimal",
                        source = "always",
                        header = "",
                        prefix = "",
                    },
                },
            },
        }
    end)(),
    config = function(_, opts)
        require "neoconf".setup {}
        local lsp_utils = require "plugins.lsp.utils"

        lsp_utils.setup_default_config()
        lsp_utils.setup_diagnostics(opts.diagnostics)
        lsp_utils.register_on_attach(function(client, buf)
            require "plugins.lsp.keybindings".setup(buf)
            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, buf)
                require("nvim-navbuddy").attach(client, buf)
            end
        end)

        require "mason-lspconfig".setup_handlers {
            lsp_utils.get_default_handler(opts),
            ["jdtls"] = Noop,    -- Setup by nvim-jdtls
            ["tsserver"] = Noop, -- Setup by typescript-tools.nvim
            ["efm"] = function()
                local efmls_config = {
                    filetypes = vim.tbl_keys(opts.efm),
                    settings = {
                        rootMarkers = { ".git/" },
                        languages = vim.tbl_map(function(x)
                            return x()
                        end, opts.efm),
                    },
                    init_options = {
                        documentFormatting = true,
                        documentRangeFormatting = true,
                    },
                }
                require "lspconfig".efm.setup(efmls_config)
            end,
        }
    end,
}
