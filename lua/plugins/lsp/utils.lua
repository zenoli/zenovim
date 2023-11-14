local M = {}

function M.register_on_attach(callback)
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspConfig", {}),
        desc = "Define default lsp settings",
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

    local hover_handler = vim.lsp.handlers.hover
    local border = opts.config.float.border
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        function(_, result, ctx, config)
            local is_java = vim.api.nvim_buf_get_option(0, "filetype") == "java"
            if is_java then
                config.stylize_markdown = false
                config.wrap = false
                -- config.max_width = 180
                config.max_height = math.floor(vim.o.lines * 0.4)
                config.max_width = math.floor(vim.o.columns * 0.6)
                local new_contents = {}
                if (type(result.contents) == "table") then
                    for _, content_segment in ipairs(result.contents) do
                        if type(content_segment) == "string" then
                            for sentence in string.gmatch(content_segment, ".-[%.?!:]%s") do
                                table.insert(new_contents, sentence)
                            end
                        else
                            table.insert(new_contents, content_segment)
                        end
                    end
                end
                result.contents = new_contents
            end
            local bufnr, winnr = hover_handler(_, result, ctx, config)
            if is_java and bufnr ~= nil and winnr ~= nil then
                vim.api.nvim_buf_set_option(bufnr, "filetype", "markdown")
                vim.api.nvim_win_set_option(winnr, "concealcursor", "n")
            end
            return bufnr, winnr
        end,
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
