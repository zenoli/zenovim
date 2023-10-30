local lazy_utils = require("config.lazy.utils")

lazy_utils.bootstrap()

require("lazy").setup {
    spec = lazy_utils.generate_import_specs(),
    install = { colorscheme = { "tokyonight" } },
    ui = {
        border = "rounded",
    },
}
