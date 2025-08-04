vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber=false
vim.o.tabstop=2
vim.o.signcolumn="yes"
vim.o.winborder="rounded"


vim.keymap.set({'n', 'v', 'x'}, '<leader>d', '"+d<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p<CR>')
vim.keymap.set({'n', 'v', 'x'}, '<leader>q', "quit<CR>")
require("config.lazy")
require('mason').setup()
vim.cmd("colorscheme kanagawa")
vim.keymap.set("n","gd", "<cmd>Telescope lsp_definitions<cr>" )
vim.keymap.set('n', '<leader>td', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })
require('lualine').setup()
