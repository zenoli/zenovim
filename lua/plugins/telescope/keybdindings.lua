return {
    {
        "<leader>f",
        function()
            local builtin = require "telescope.builtin"
            local path = vim.loop.cwd() .. "/.git"
            local ok, _ = vim.loop.fs_stat(path)
            if ok then
                builtin.git_files { show_untracked = true }
            else
                builtin.find_files()
            end
        end,
        desc = "Find (git)-files"
    },
    {
        "<leader>H",
        function()
            require "telescope.builtin".find_files {
                hidden = true,
                prompt_title = "Hidden Files",
            }
        end,
        desc = "Find hidden files",
    },
    {
        "<leader>I",
        function()
            require "telescope.builtin".find_files {
                hidden = true,
                no_ignore = true,
                prompt_title = "Ignored Files",
            }
        end,
        desc = "Find ignored files",
    },
    {
        "<leader>a",
        function()
            require "telescope.builtin".live_grep()
        end,
        desc = "Live grep"
    },
    {
        "<leader>sb",
        function()
            require "telescope.builtin".buffers()
        end,
        desc = "Search buffers"
    },
    {
        "<leader>sh",
        function()
            require "telescope.builtin".help_tags()
        end,
        desc = "Search help tags"
    },
    {
        "<leader>sH",
        function()
            require "telescope.builtin".highlights()
        end,
        desc = "Search highlight groups"
    },
    {
        "<leader>sc",
        function()
            require "telescope.builtin".command_history()
        end,
        desc = "Search command history"
    },
    {
        "<leader>sm",
        function()
            require "telescope.builtin".man_pages()
        end,
        desc = "Search man pages"
    },
    {
        "<leader>sk",
        function()
            require "telescope.builtin".keymaps()
        end,
        desc = "Search keymaps"
    },
    {
        "<leader>so",
        function()
            require "telescope.builtin".lsp_document_symbols()
        end,
        desc = "Search document symbols"
    },
    {
        "<leader>sO",
        function()
            require "telescope.builtin".lsp_workspace_symbols()
        end,
        desc = "Search workspace symbols"
    },
    {
        "<leader>st",
        function()
            require "telescope.builtin".builtin()
        end,
        desc = "Search telescope builtins"
    },
    {
        "<leader>tt",
        function()
            require "telescope.builtin".resume()
        end,
        desc = "Resume telescope"
    },
}
