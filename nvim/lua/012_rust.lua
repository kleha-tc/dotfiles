vim.api.nvim_create_autocmd({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = { "*.rs" },
	callback = function()
		vim.cmd.packadd("rust.vim")
	end
})
