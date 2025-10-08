return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	branch = 'master',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			matchup = {
				enable = true,
			},
			ensure_installed = {
				'vimdoc',
				'javascript',
				'typescript',
				'c',
				'lua',
				'rust',
				'jsdoc',
				'bash',
				'markdown',
				'markdown_inline',
				'sql',
			},
			auto_install = true,
			incremental_selection = {
				enable = false,
			},
			indent = { enable = false },
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = { 'markdown' },
			},
		})
	end,
}
