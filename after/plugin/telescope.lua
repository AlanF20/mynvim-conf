local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function ()
	builtin.find_files({
		hidden = true
	})
end , {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") })
end)


