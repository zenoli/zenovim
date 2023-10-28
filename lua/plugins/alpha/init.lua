return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require "alpha"
        local dashboard = require "alpha.themes.dashboard"

        -- Set header

        dashboard.section.header.val = require("plugins.alpha.utils").get_logo(3)

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "   New file", ":ene <bar> startinsert <cr>"),
            dashboard.button("f", "   Find file", ":Telescope find_files<cr>"),
            dashboard.button("r", "   Recent", ":Telescope oldfiles<cr>"),
            dashboard.button("s", "   Settings", ":e $MYVIMRC | :cd %:p:h<cr>"),
            dashboard.button("q", "   Quit Zenovim", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}
