vim.g.mapleader = " "
require("config.lazy")
require('mason').setup()
vim.cmd("colorscheme kanagawa")
vim.keymap.set("n","gd", "<cmd>Telescope lsp_definitions<cr>" )
require('lualine').setup()
