
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
	    lspConfig.ts_ls.setup({
		capabilities=capabilities,
		init_options = {
		  plugins = {
		    {
		      name = '@vue/typescript-plugin',
		      location = vue_language_server_path,
		      languages = { 'vue' },
		      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
		    },
		  }
		},
		filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		settings = {
		    typescript = {
		
			    tsserver = {
			  useSyntaxServer = false,
			},
			inlayHints = {
			  includeInlayParameterNameHints = 'all',
			  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			  includeInlayFunctionParameterTypeHints = true,
			  includeInlayVariableTypeHints = true,
			  includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			  includeInlayPropertyDeclarationTypeHints = true,
			  includeInlayFunctionLikeReturnTypeHints = true,
			  includeInlayEnumMemberValueHints = true,
			},
		      },
		}
	      })
	    lspConfig.volar.setup({})
	  end,
	}
}

