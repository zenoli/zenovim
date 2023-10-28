local ok, tokyonight = pcall(require, "tokyonight")
if ok then
    tokyonight.load()
    vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "CursorLineNr" })
else
    vim.notify "Tokyonight not found. Falling back to habamax"
    vim.cmd.colorscheme "habamax"
end
