return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    lazy = true,
    opts = {
        history = true,
        enable_autosnippets = true,
    },
    config = function(_, opts)
        require "luasnip.loaders.from_vscode".lazy_load()

        local map = require "config.utils".map
        local luasnip = require "luasnip"
        luasnip.setup(opts)

        map({ "i", "n", "s" }, "<c-l>", function()
            luasnip.expand_or_jump()
        end)
        map({ "i", "n", "s" }, "<c-h>", function()
            luasnip.jump(-1)
        end)
    end,
}
