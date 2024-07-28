return {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter" },
    keys = {
        { "<localleader>t", function() require("ts-node-action").node_action() end },
    },
    opts = {},
}
