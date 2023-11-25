return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufRead", "BufNewFile" },
    opts = {
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    ["aa"] = {
                        query = "@parameter.outer",
                        desc = "Select outer part of a parameter/argument",
                    },
                    ["ia"] = {
                        query = "@parameter.inner",
                        desc = "Select inner part of a parameter/argument",
                    },
                    ["ai"] = {
                        query = "@conditional.outer",
                        desc = "Select outer part of a conditional",
                    },
                    ["ii"] = {
                        query = "@conditional.inner",
                        desc = "Select inner part of a conditional",
                    },
                    ["al"] = {
                        query = "@loop.outer",
                        desc = "Select outer part of a loop",
                    },
                    ["il"] = {
                        query = "@loop.inner",
                        desc = "Select inner part of a loop",
                    },
                    ["af"] = {
                        query = "@function.outer",
                        desc = "Select outer part of a method/function definition",
                    },
                    ["if"] = {
                        query = "@function.inner",
                        desc = "Select inner part of a method/function definition",
                    },
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
                    ["<leader>nf"] = "@function.outer",  -- swap function with next
                },
                swap_previous = {
                    ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
                    ["<leader>pf"] = "@function.outer",  -- swap function with previous
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = {
                        query = "@function.outer",
                        desc = "Next method/function def start" },
                    ["]i"] = {
                        query = "@conditional.outer",
                        desc = "Next conditional start",
                    },
                    ["]l"] = {
                        query = "@loop.outer",
                        desc = "Next loop start",
                    },
                },
                goto_next_end = {
                    ["]F"] = {
                        query = "@function.outer",
                        desc = "Next method/function def end",
                    },
                    ["]I"] = {
                        query = "@conditional.outer",
                        desc = "Next conditional end",
                    },
                    ["]L"] = {
                        query = "@loop.outer",
                        desc = "Next loop end" },
                },
                goto_previous_start = {
                    ["[f"] = {
                        query = "@function.outer",
                        desc = "Prev method/function def start",
                    },
                    ["[i"] = {
                        query = "@conditional.outer",
                        desc = "Prev conditional start",
                    },
                    ["[l"] = {
                        query = "@loop.outer",
                        desc = "Prev loop start" },
                },
                goto_previous_end = {
                    ["[F"] = {
                        query = "@function.outer",
                        desc = "Prev method/function def end",
                    },
                    ["[I"] = {
                        query = "@conditional.outer",
                        desc = "Prev conditional end",
                    },
                    ["[L"] = {
                        query = "@loop.outer",
                        desc = "Prev loop end",
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require 'nvim-treesitter.configs'.setup(opts)
    end,
}
