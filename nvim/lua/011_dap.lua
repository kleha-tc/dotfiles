local dap = require("dap")

local function dap_enable()
		vim.cmd.packadd("nvim-dap")
		vim.cmd.packadd("nvim-dap-ui")
end

local function dap_setting()
end

vim.api.nvim_create_autocmd("VimEnter",{
	pattern = "*",
	callback = function()
		dap_enable()
		dap_setting()
	end
})
