local v = vim
local o = vim.opt_local

if vim.bo.ft ~= 'markdown' then
	return
end

o.spc = ''

vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.textwidth = 80
