local M = {}

function M.register_on_attach(callback)
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(attachEvent)
            local client = vim.lsp.get_client_by_id(attachEvent.data.client_id)
            local buf = attachEvent.buf
            callback(client, buf)
        end,
    })
end

function M.setup_diagnostics(opts)
    for name, icon in pairs(opts.signs) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
    vim.diagnostic.config(opts.config)

    local border = opts.config.float.border
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = border, silent = true }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border }
    )
end

function M.setup_default_config()
    local lspconfig = require "lspconfig"
    lspconfig.util.default_config = vim.tbl_deep_extend(
        "force",
        lspconfig.util.default_config,
        { capabilities = require "cmp_nvim_lsp".default_capabilities() }
    )
end

local function get_server_config(opts, server)
    local default = {
        setup = Noop,
        opts = {},
    }
    return vim.tbl_extend("force", default, opts.servers[server] or {})
end

function M.get_default_handler(opts)
    return function(server)
        local server_config = get_server_config(opts, server)
        server_config.setup()
        require "lspconfig"[server].setup(server_config.opts)
    end
end

return M
