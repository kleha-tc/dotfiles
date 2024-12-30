local set = vim.keymap.set

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		vim.cmd.packadd("vimplugin-vim-nerdfont")
		vim.cmd.packadd("vim-fern")
		vim.cmd.packadd("vimplugin-vim-fern-git-status")
		vim.cmd.packadd("vimplugin-vim-fern-renderer-nerdfont")
		vim.cmd.packadd("vimplugin-glyph-palette")
		set("n", "<C-a>", "<cmd>:Fern . -drawer -toggle<CR>")
		set("i", "<C-a>", "<cmd>:Fern . -drawer -toggle<CR>")
		set("t", "<C-a>", "<cmd>:Fern . -drawer -toggle<CR>")
		vim.g["fern#renderer"] = "nerdfont"
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "fern", "fall-list", "nerdtree,startify", "nerdtree", "startify" },
	callback = function()
		vim.fn["glyph_palette#apply"]()
	end
})

