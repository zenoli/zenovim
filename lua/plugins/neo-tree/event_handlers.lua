return {
    {
        event = "neo_tree_window_after_open",
        handler = function(args)
            if args.position == "left" or args.position == "right" then
                vim.cmd("wincmd =")
            end
        end,
    },
    {
        event = "neo_tree_window_after_close",
        handler = function(args)
            if args.position == "left" or args.position == "right" then
                vim.cmd("wincmd =")
            end
        end,
    },
}
