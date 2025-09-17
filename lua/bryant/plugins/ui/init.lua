return {
	{
		'catppuccin/nvim',
		lazy = false,
		priority = 1000,
		name = 'catppuccin',
		opts = {
			flavour = 'frappe', -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = 'latte',
				dark = 'frappe',
			},
			no_italic = true, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = true, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { 'italic' }, -- Change the style of comments
				conditionals = { 'italic' },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
		},
		config = function(_, opts)
			require('catppuccin').setup(opts)
			vim.cmd('colorscheme catppuccin')
		end,
	},
}
