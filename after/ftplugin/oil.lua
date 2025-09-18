local v = vim
local o = v.opt_local
local map = v.keymap.set

o.laststatus = 3

v.api.nvim_create_autocmd('BufWipeout', {
	pattern = '<buffer>',
	callback = function()
		v.opt.laststatus = 0
	end,
})
