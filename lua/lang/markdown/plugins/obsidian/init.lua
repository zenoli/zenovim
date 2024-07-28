local vault_dir = vim.fn.expand "~" .. "/repos/own/notes"

return {
    "epwalsh/obsidian.nvim",
    dev = false,
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    cmd = "ObsidianNew",
    enabled = true,
    event = {
        "BufReadPre " .. vault_dir .. "/**.md",
        "BufNewFile " .. vault_dir .. "/**.md",
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        {
            "stevearc/dressing.nvim",
            opts = {
                input = {
                    get_config = function(opts)
                        if opts.kind == "obsidian-new-note" then
                            return {
                                relative = "editor",
                            }
                        end
                    end,
                },
            },
        },
    },
    keys = require("lang.markdown.plugins.obsidian.keybindings"),
    opts = {
        ui = {
            -- use markdown.nvim instead for these
            checkboxes = {},
            bullets = {},
            external_link_icon = {},
        },
        workspaces = {
            {
                name = "notes",
                path = vault_dir,
            },
        },
    },
    config = function(_, opts)
        vim.opt.conceallevel = 2
        require("obsidian").setup(opts)
    end,
}
