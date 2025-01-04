local function autotag_setting()
	require("nvim-ts-autotag").setup()
end

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.cmd.packadd("nvim-ts-autotag")
		autotag_setting()
	end
})
