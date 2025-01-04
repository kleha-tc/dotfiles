local au = vim.api.nvim_create_autocmd
local lspconfig = require("lspconfig")

-- LSP UI
-- fidget.nvim

require("fidget").setup{}

-- Language Server
-- Typst

au({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = "*.typ",
	callback = function()
		lspconfig.tinymist.setup{}
	end
})

-- Lua

au({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = "*.lua",
	callback = function()
		lspconfig.lua_ls.setup{}
	end
})

-- C/C++

au({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = { "*.c", "*.cpp", "*.cc", "*.h" },
	callback = function()
		lspconfig.clangd.setup{}
	end
})

-- Go

au({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = { "*.go" },
	callback = function()
		lspconfig.gopls.setup{}
	end
})

-- TypeScript

au({"BufReadPre", "BufNewFile"}, {
	once = true,
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		lspconfig.ts_ls.setup()
	end
})
