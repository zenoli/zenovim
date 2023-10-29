local ok, tokyonight = pcall(require, "tokyonight")
if ok then
    tokyonight.load()
else
    vim.notify "Tokyonight not found. Falling back to habamax"
    vim.cmd.colorscheme "habamax"
end
