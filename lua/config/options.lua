local options = {
    cursorline = true,
    showmode = false,

    number = true,
    relativenumber = true,
    timeoutlen = 1000,
    swapfile = false,
    updatetime = 100,

    splitbelow = true,
    splitright = true,

    laststatus = 3,
    selectmode = "mouse",


    termguicolors = true,

    -- Indentation
    autoindent = true,
    smartindent = true,
    smarttab = true,

    -- tab settings using hard tabs
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    -- Searching
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    -- Scrolling
    scrolloff = 5,
    sidescrolloff = 10,

    -- Conceal
    conceallevel = 2,

    -- Listchars
    list = true,
    listchars = {
        extends = "󰁔",
        precedes = "󰁍",
    },
    wrap = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
