local telescope = require'telescope'
telescope.load_extension('lsp_handlers')
telescope.setup({
	extensions = {
		lsp_handlers = {
			disable = {},
			location = {
				telescope = {},
				no_results_message = 'No references found',
			},
			symbol = {
				telescope = {},
				no_results_message = 'No symbols found',
			},
			call_hierarchy = {
				telescope = {},
				no_results_message = 'No calls found',
			},
			code_action = {
				telescope = {},
				no_results_message = 'No code actions available',
				prefix = '',
			},
		},
	}
})
