local dpp_src = "~/.cache/dpp/dpp.vim"
local denops_src = "@denopsSrc@"

vim.opt.runtimepath:prepend(dpp_src)

local ext_git = "~/.cache/dpp/dpp-protocol-git"
local ext_toml = "~/.cache/dpp/dpp-ext-toml"
local ext_lazy = "~/.cache/dpp/dpp-ext-lazy"
local ext_local = "~/.cache/dpp/dpp-ext-local"
local ext_installer = "~/.cache/dpp/dpp-ext-installer"

vim.opt.runtimepath:append(ext_git)
vim.opt.runtimepath:append(ext_toml)
vim.opt.runtimepath:append(ext_lazy)
vim.opt.runtimepath:append(ext_local)
vim.opt.runtimepath:append(ext_installer)

local dpp = require("dpp")
local dpp_base = "~/.cache/dpp"
local dpp_config = "~/.config/nvim/dpp.ts"
if dpp.load_state(dpp_base) then
	vim.opt.runtimepath:prepend(denops_src)

	vim.api.nvim_create_autocmd("User", {
		pattern = "DenopsReady",
		callback = function()
			vim.notify("dpp load_state is failed")
			dpp.make_state(dpp_base, {dpp_config})
		end,
	})
end

vim.api.nvim_create_autocmd("User", {
	pattern = "Dpp:makeStatePost",
	callback = function()
		vim.notify("dpp make_state() is done")
	end,
})

vim.cmd("filetype indent plugin on")
vim.cmd("syntax on")
