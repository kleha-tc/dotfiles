local au = vim.api.nvim_create_autocmd

-- Typst

au("BufRead", {
	once = true,
	pattern = "*.typ",
	callback = function()
		require("lspconfig").tinymist.setup{}
	end
})

-- Lua

au("BufRead", {
	once = true,
	pattern = "*.lua",
	callback = function()
		require("lspconfig").lua_ls.setup{}
	end
})
