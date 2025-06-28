return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	dependencies = {
		'saghen/blink.compat',
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			build = 'make install_jsregexp',
			config = function()
				local ls = require('luasnip')
				ls.filetype_extend('javascript', { 'js' })
				ls.filetype_extend('typescript', { 'js' })
				ls.filetype_extend('javascriptreact', { 'js' })
				ls.filetype_extend('typescriptreact', { 'js' })

				require('luasnip.loaders.from_lua').lazy_load({ paths = { vim.fn.stdpath('config') .. '/snippets' } })
			end,
		},
	},
	opts = {
		cmdline = {
			enabled = true,
			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				menu = {
					auto_show = true,
				},
			},
		},

		appearance = {
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			nerd_font_variant = 'mono',
		},

		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
			documentation = { auto_show = true },
			accept = { auto_brackets = { enabled = true } },
			menu = {
				max_height = 15,
				auto_show = true,
				draw = {
					columns = {
						{
							'label',
							'label_description',
							gap = 1,
						},
						{
							'kind_icon',
							'kind',
							gap = 1,
						},
					},
				},
			},
		},
		sources = {
			default = {
				'snippets',
				'path',
				'buffer',
				'cmdline',
			},
			providers = {
				snippets = {
					score_offset = 100,
					min_keyword_length = 2,
				},
			},
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		snippets = { preset = 'luasnip' },

		keymap = {
			preset = 'none',
			['<c-space>'] = { 'hide' },
			['<c-z>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<c-y>'] = { 'select_and_accept', 'fallback' },
			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },
			['<Tab>'] = { 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'snippet_backward', 'fallback' },
			['<c-n>'] = { 'select_next', 'fallback_to_mappings' },
			['<c-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<c-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<c-f>'] = { 'scroll_documentation_down', 'fallback' },
			['<c-e>'] = {
				'show',
				'show_documentation',
				'hide_documentation',
				'hide',
			},
		},
	},
	opts_extend = { 'sources.default' },
}
