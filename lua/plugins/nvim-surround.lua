return {
    "kylechui/nvim-surround",
    version = "*",
    keys = { "ys", "ds", "cs", { "S", "S", mode = "x" } },
    config = function()
        require "nvim-surround".setup {}
    end,
}
