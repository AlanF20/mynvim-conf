vim.g.mapleader = ' ' 
vim.keymap.set('n', '<leader>pv', function() vim.cmd('Ex') end) 
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})
vim.keymap.set('i', '<C-Backspace>', function ()
	vim.cmd('db')
end)
vim.keymap.set('n', 't', function ()
	vim.cmd('Neotree float filesystem reveal')
end)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
