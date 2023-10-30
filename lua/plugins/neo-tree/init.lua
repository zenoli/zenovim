return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    keys = {
        {
            "<leader>e",
            "<cmd>Neotree toggle<cr>",
            desc = "Toggle Neotree",
        },
        {
            "<localleader><localleader>",
            "<cmd>Neotree reveal<cr>",
            desc = "Reveal current file in Neotree",
        },
    },
    opts = function()
        local clipboard_icons = {
            cut = "󰆐 ",
            copy = "󰆏 ",
        }

        local navigation = require("plugins.neo-tree.navigation")
        return {
            close_if_last_window = true,
            enable_diagnostics = false,
            log_level = "warn",
            popup_border_style = "rounded",
            default_component_configs = {
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                    default = "",
                },
                modified = {
                    symbol = "",
                    highlight = "NeoTreeModified",
                },
            },
            window = {
                position = "left",
                width = 30,
                insert_as = "sibling",
                mappings = {
                    ["o"] = "open_with_window_picker",
                    ["h"] = navigation.navigate_out,
                    ["l"] = navigation.navigate_in,
                    ["<c-v>"] = "open_vsplit",
                    ["<c-x>"] = "open_split",
                    ["g/"] = "fuzzy_finder",
                    ["Z"] = "expand_all_nodes",
                    ["a"] = {
                        "add",
                        config = {
                            show_path = "relative",
                        },
                    },
                    ["A"] = {
                        "add_directory",
                        config = {
                            show_path = "relative",
                        },
                    },
                },
            },
            filesystem = {
                window = {
                    mappings = {
                        ["/"] = "noop", -- "noop" removes a default mapping
                        ["g/"] = "fuzzy_finder",
                        ["q"] = "clear_filter",
                    },
                },
                group_empty_dirs = true,
                use_libuv_file_watcher = true,
                async_directory_scan = "never",
                scan_mode = "deep",
                components = {
                    clipboard = function(config, node, state)
                        local highlights = require("neo-tree.ui.highlights")
                        local clipboard = state.clipboard or {}
                        local clipboard_state = clipboard[node:get_id()]
                        if not clipboard_state then
                            return {}
                        end
                        return {
                            text = clipboard_icons[clipboard_state.action] or clipboard_state.action,
                            highlight = config.highlight or highlights.DIM_TEXT,
                        }
                    end,
                },
            },
            event_handlers = require("plugins.neo-tree.event_handlers"),
        }
    end,
}
