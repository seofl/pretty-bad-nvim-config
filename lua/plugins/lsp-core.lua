
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspConfig = require("lspconfig")
			local mason_registry = require("mason-registry")
			local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local vue_plugin = {
				name = '@vue/typescript-plugin',
				location = vue_language_server_path,
				languages = { 'vue' },
				configNamespace = 'typescript',
			}
			local vtsls_config = {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
			}
			-- If you are on most recent `nvim-lspconfig
			lspConfig.eslint.setup({
			})
			local vue_ls_config = {}
			vim.lsp.config('vtsls', vtsls_config)
			vim.lsp.config('vue_ls', vue_ls_config)
			vim.lsp.enable({'vtsls', 'vue_ls'})
		end,
	}
}

