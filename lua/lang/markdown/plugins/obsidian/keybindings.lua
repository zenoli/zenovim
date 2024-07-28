local function input(cmd, kind)
    return function()
        local client = require("obsidian").get_client()
        vim.ui.input(
            { prompt = "New note: ", kind = kind },
            function(input)
                if input ~= nil then
                    client:command(cmd, { args = input })
                end
            end)
    end
end

return {
    { "<leader>nn", input("ObsidianNew", "obsidian-new-note") },
    { "<leader>nt", "<cmd>ObsidianTags<cr>" },
    { "<leader>nl", "<cmd>ObsidianTags<cr>" },
    { "<leader>sn", "<cmd>ObsidianSearch<cr>" },
    { "<leader>sN", "<cmd>ObsidianQuickSwitch<cr>" },
    { "<leader>ne", input("ObsidianExtractNote", "obsidian-extract-note"), mode = "x", ft = "markdown" },
    { "<leader>nn", ":ObsidianLinkNew<cr>",                                mode = "x", ft = "markdown" },
    { "<leader>nl", ":ObsidianLink<cr>",                                   mode = "x", ft = "markdown" },
}
