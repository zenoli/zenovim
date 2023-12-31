local M = {}

local logo1 = [[
d88889D d88888b d8b   db  .d88b.  db    db d888888b .88b  d88.
YP  d8' 88'     888o  88 .8P  Y8. 88    88   `88'   88'YbdP`88
   d8'  88ooooo 88V8o 88 88    88 Y8    8P    88    88  88  88
  d8'   88~~~~~ 88 V8o88 88    88 `8b  d8'    88    88  88  88
 d8' db 88.     88  V888 `8b  d8'  `8bd8'    .88.   88  88  88
d88888P Y88888P VP   V8P  `Y88P'     YP    Y888888P YP  YP  YP
]]


local logo2 = [[
███████ ███████ ███    ██  ██████  ██    ██ ██ ███    ███
   ███  ██      ████   ██ ██    ██ ██    ██ ██ ████  ████
  ███   █████   ██ ██  ██ ██    ██ ██    ██ ██ ██ ████ ██
 ███    ██      ██  ██ ██ ██    ██  ██  ██  ██ ██  ██  ██
███████ ███████ ██   ████  ██████    ████   ██ ██      ██
]]

local logo3 = [[
███████╗███████╗███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
╚══███╔╝██╔════╝████╗  ██║██╔═══██╗██║   ██║██║████╗ ████║
  ███╔╝ █████╗  ██╔██╗ ██║██║   ██║██║   ██║██║██╔████╔██║
 ███╔╝  ██╔══╝  ██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗███████╗██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚══════╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local logo4 = [[
▒███████▒▓█████  ███▄    █  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
▒ ▒ ▒ ▄▀░▓█   ▀  ██ ▀█   █ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
░ ▒ ▄▀▒░ ▒███   ▓██  ▀█ ██▒▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
  ▄▀▒   ░▒▓█  ▄ ▓██▒  ▐▌██▒▒██   ██░  ▒██ █░░░██░▒██    ▒██
▒███████▒░▒████▒▒██░   ▓██░░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░▒▒ ▓░▒░▒░░ ▒░ ░░ ▒░   ▒ ▒ ░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░░▒ ▒ ░ ▒ ░ ░  ░░ ░░   ░ ▒░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
░ ░ ░ ░ ░   ░      ░   ░ ░ ░ ░ ░ ▒       ░░   ▒ ░░      ░
  ░ ░       ░  ░         ░     ░ ░        ░   ░         ░
░                                        ░
]]


function M.get_logo(gap)
    return vim.split(logo3 .. string.rep(" \n", gap), "\n")
end

return M
