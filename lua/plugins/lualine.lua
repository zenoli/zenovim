return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            disabled_filetypes = {
                statusline = { "neo-tree", "calendar" },
                winbar = {},
            },
            ignore_focus = { "neo-tree", "calendar" },
        },
        sections = {
            lualine_b = { "branch" },
            lualine_c = {
                {
                    'filename',
                    file_status = true, -- Displays file status (readonly status, modified status)
                    newfile_status = true, -- Display new file status (new file means no write after created)
                    path = 0, -- 0: Just the filename
                    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                    symbols = {
                        modified = ' ', -- Text to show when the file is modified.
                        readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '󰛄 ', -- Text to show for newly created file before first write
                    }
                }
            }
        },
    }
}
