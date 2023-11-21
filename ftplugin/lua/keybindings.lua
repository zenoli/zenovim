local map = require("config.utils").getMapFn()

map("n", "<leader>rl", "<cmd>luafile %<cr>", { desc = "Evaluate current lua file"})
