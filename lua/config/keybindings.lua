local map = require "config.utils".getMapFn()

-- Leaders
vim.g.mapleader = [[ ]]      -- Use space as leader
vim.g.maplocalleader = [[\]] -- Use backslash as localleader

map("", "<space>", "<nop>")  -- disable space because leader
map("n", "q:", "<nop>")

map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit current window" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Exit vim (if no unsaved buffers)" })
map("n", "<leader>s<leader>", ":% s/", { desc = "Substitue all" })
map("v", "<leader>s<leader>", ": s/", { desc = "Substitue visual selection" })
map("n", "<leader><esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Disable hlsearch" })

-- Swap ' and `
map("n", "'", "`")
map("n", "`", "'")

-- Buffer navigation
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>D", "<cmd>bp<bar>bd #<cr>", { desc = "Close current buffer" })

-- Scrolling
map("n", "<c-j>", "5<c-e>", { desc = "Scroll down" })
map("n", "<c-k>", "5<c-y>", { desc = "Scroll up" })

-- Tab navigation
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- Quickfixlist navigation
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous quickfix item" })
map("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close quickfix list" })

-- Convenient pasting
map("n", "<leader>py", '"0p', { desc = "Paste most recent yank (after)" })
map("n", "<leader>pY", '"0P', { desc = "Paste most recent yank (before)" })
map("n", "<leader>pd", '"1p', { desc = "Paste most recent deletion (after)" })
map("n", "<leader>pD", '"1P', { desc = "Paste most recent deletion (before)" })
map("n", "<leader>pc", '$"+p', { desc = "Paste from system clipboard (after)" })
map("n", "<leader>pC", '$"+P', { desc = "Paste from system clipboard (before)" })

map("v", "<leader>y", '"+y', { desc = "Yank into system clipboard" })

-- Don't move on *
map("n", "*", ":let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>")

-- Jump to beginning and end of lines easier.
map("n", "H", "^")
map("n", "L", "$")

-- Create newlines without entering insert mode
map("n", "go", "o<esc>")
map("n", "gO", "O<esc>")

-- Undo break points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- Move selected lines vertically
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })

-- Move selected lines horizontally
map("v", ">", ">gv", { desc = "Indent selected lines" })
map("v", "<", "<gv", { desc = "Unindent selected lines" });
