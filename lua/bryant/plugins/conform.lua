return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			css = { 'prettierd' },
			html = { 'prettierd' },
			json = { 'prettierd' },
			jsonc = { 'prettierd' },
			scss = { 'prettier' },
			less = { 'prettier' },
			yaml = { 'prettier' },
			sh = { 'shfmt' },
			fish = { 'fish_indent' },
			bash = { 'shfmt' },
			zsh = { 'shfmt' },
			go = { 'gofumpt', 'goimports' },
			python = { 'ruff_organize_imports', 'ruff_fix', 'ruff_format' },
			toml = { 'taplo' },
			c = { 'clang-format' },
			rust = { 'rustfmt' },
		},

		formatters = {
			fish_indent = {
				command = '/usr/bin/fish_indent',
			},
		},
	},
	keys = {
		{
			'<c-f>',
			function()
				require('conform').format({ lsp_format = 'fallback' })
				vim.notify('code formated', vim.log.levels.INFO, { title = 'Conform' })
			end,
			desc = 'Conform [F]ormat Buffer With',
		},
	},
}
