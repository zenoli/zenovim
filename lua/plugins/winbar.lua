return {
    "fgheng/winbar.nvim",
    opts = {
        enabled = true,
        show_file_path = true,
        show_symbols = true,
        icons = {
            file_icon_default = "",
            seperator = ">",
            editor_state = "●",
            lock_icon = "",

        },
        exclude_filetype = {
            "startify",
            "dashboard",
            -- "dap-repl",
            "dapui_hover",
            "packer",
            "neogitstatus",
            "NvimTree",
            "neo-tree",
            "Trouble",
            "alpha",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
            "qf",
        },
    }
}
