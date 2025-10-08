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
						preselect = true,
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
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
			menu = {
				max_height = 10,
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
				'buffer',
				'snippets',
				'path',
				'cmdline',
			},
			providers = {
				snippets = {
					score_offset = 100,
					min_keyword_length = 2,
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= 'trigger_character'
					end,
				},
			},
		},
		fuzzy = {
			implementation = 'prefer_rust_with_warning',
		},
		snippets = {
			preset = 'luasnip',
		},
		signature = {
			enabled = false,
		},
		keymap = {
			preset = 'none',
			['<c-space>'] = { 'hide' },
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
	config = function(_, opts)
		local blink = require('blink.cmp')
		blink.setup(opts)

		local autoCompletionEnabled = true

		local function EnableAutoCompletion()
			vim.b.completion = true
			autoCompletionEnabled = true
			print('Auto-completion enabled')
		end

		local function DisableAutoCompletion()
			vim.b.completion = false
			blink.hide()
			autoCompletionEnabled = false
			print('Auto-completion disabled')
		end

		local function ToggleAutoCompletion()
			if autoCompletionEnabled then
				DisableAutoCompletion()
			else
				EnableAutoCompletion()
			end
		end

		vim.keymap.set('n', '\\\\', ToggleAutoCompletion, { desc = 'Toggle Blink Cmp Completion' })
	end,
}
