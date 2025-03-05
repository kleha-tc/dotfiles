vim.api.nvim_create_autocmd({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = { "*.ly" },
	callback = function()
		vim.cmd.packadd("nvim-lilypond-suite")
		require("nvls").setup({})
	end
})
