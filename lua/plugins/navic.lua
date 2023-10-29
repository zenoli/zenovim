return {
    "SmiteshP/nvim-navic",
    lazy = true,
    opts = {},
    config = function(_, opts)
        require("nvim-navic").setup(opts)
    end
}
