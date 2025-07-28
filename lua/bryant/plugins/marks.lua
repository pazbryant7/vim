return {
	'chentoast/marks.nvim',
	event = 'VeryLazy',
	opts = {
		default_mappings = false,
		mappings = {
			set = 'm',
			set_next = 'm,',
			toggle = 'mm',
			delete_buf = 'dmm',
			next = ']m',
			prev = '[m',
			preview = 'm;',
		},
	},
	config = function(_, opts)
		require('marks').setup(opts)
	end,
	keys = {
		{ 'm;', desc = 'Marks preview' },
		{ 'm', desc = 'Start marks plugin' },
		{ 'mq', ':MarksQFListAll<cr>', desc = 'Marks to quick fix list' },
	},
}
