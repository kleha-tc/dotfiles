local function which_key_setup()
	require("which-key").setup()
end

local function which_key_keymap()
	return function()
		require("which-key").show({global = false})
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		vim.cmd.packadd("which-key.nvim")
		which_key_setup()
		vim.keymap.set({"n","i","t"}, "<leader>?", which_key_keymap())
	end
})
