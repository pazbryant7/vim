return {
	'saghen/blink.cmp',
	event = 'InsertEnter',
	version = '1.*',
	dependencies = {
		'saghen/blink.compat',
		{
			'L3MON4D3/LuaSnip',
			version = 'v2.*',
			config = function()
				require('luasnip.loaders.from_lua').lazy_load({
					paths = { './snippets' },
				})
			end,
		},
	},
	opts = {
		cmdline = {
			enabled = true,
			keymap = { preset = 'inherit' },
			completion = { menu = { auto_show = true } },
		},
		completion = {
			documentation = { auto_show = false },
			menu = {
				draw = {
					columns = {
						{ 'label', 'label_description', gap = 1 },
						{ 'kind_icon', 'kind', gap = 1 },
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
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },

		keymap = {
			['<C-space>'] = { 'hide' },
			['<C-y>'] = { 'select_and_accept' },
			['<Up>'] = { 'select_prev', 'fallback' },
			['<Down>'] = { 'select_next', 'fallback' },
			['<m-l>'] = { 'snippet_forward', 'fallback' },
			['<m-h>'] = { 'snippet_backward', 'fallback' },
			['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
			['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
		},
	},
	opts_extend = { 'sources.default' },
}
