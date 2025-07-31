vim.g.mapleader = " "
require("config.lazy")
require('mason').setup()
vim.cmd("colorscheme kanagawa")
vim.keymap.set("n","gd", "<cmd>Telescope lsp_definitions<cr>" )
vim.keymap.set('n', '<leader>td', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })
require('lualine').setup()
