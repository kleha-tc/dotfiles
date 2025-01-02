-- set keymap
local function telescope_set_keymap()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
end

-- load telescope
vim.api.nvim_create_autocmd( "VimEnter", {
	pattern = "*",
	callback = function()
		vim.cmd.packadd("telescope.nvim")
		require("telescope").setup()
		telescope_set_keymap()
	end
})

