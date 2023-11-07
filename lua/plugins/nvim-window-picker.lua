return {
    "s1n7ax/nvim-window-picker",
    lazy = true,
    version = '2.*',
    opts = {
        -- hint = 'floating-big-letter',
        hint = 'statusline-winbar',
        filter_rules = {
            -- Ignore picker for ft/bt:
            bo = {
                filetype = {
                    "aerial",
                    "neo-tree",
                    "neo-tree-popup",
                    "notify",
                    "quickfix",
                    "help",
                    "fugitive",
                },
                buftype = { "terminal" },
            },
        },
        highlights = {
            statusline = {
                unfocused = {
                    fg = '#ededed',
                    bg = '#4493c8',
                    bold = true,
                },
            },
        },
    },
}
