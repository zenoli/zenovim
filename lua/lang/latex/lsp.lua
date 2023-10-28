return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
            servers = {
                texlab = {
                    opts = {
                        settings = {
                            texlab = {
                                auxDirectory = ".",
                                bibtexFormatter = "texlab",
                                build = {
                                    args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                                    executable = "latexmk",
                                    forwardSearchAfter = false,
                                    onSave = true,
                                },
                                chktex = {
                                    onEdit = false,
                                    onOpenAndSave = false,
                                },
                                diagnosticsDelay = 300,
                                formatterLineLength = 80,
                                forwardSearch = {
                                    executable = "zathura",
                                    args = {
                                        "--synctex-editor-command",
                                        require "texlabconfig".project_dir()
                                        .. [[/nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]]
                                        .. vim.v.servername,
                                        "--synctex-forward",
                                        "%l:1:%f",
                                        "%p",
                                    },
                                    onSave = true,
                                },
                                latexFormatter = "latexindent",
                                latexindent = {
                                    modifyLineBreaks = true,
                                    ["local"] = ".latexindent.yaml",
                                },
                            },
                        },
                    },
                },
            },
        })
    end,
}
