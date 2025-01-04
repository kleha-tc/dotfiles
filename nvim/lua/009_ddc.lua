local cmd = vim.cmd
local fn = vim.fn
local set = vim.keymap.set

local function enable_ddc()
	cmd.packadd("ddc.vim")
	cmd.packadd("ddc-ui-pum")
	cmd.packadd("ddc-source-lsp")
	cmd.packadd("vimplugin-ddc-source-around")
	cmd.packadd("vimplugin-ddc-source-nvim-lua")
	cmd.packadd("vimplugin-ddc-source-file")
	cmd.packadd("ddc-filter-sorter_rank")
	cmd.packadd("ddc-filter-matcher_head")
end

local function setup_ddc()
	fn["ddc#custom#patch_global"]("ui", "pum")
	fn["ddc#custom#patch_global"]("sources", {"lsp", "around", "file", "skkeleton"})
	fn["ddc#custom#patch_global"]("sourceOptions", {
		_ = {
			matchers = {"matcher_head"},
			sorters = {"sorter_rank"},
		},
		lsp = {
			mark = "[LSP]"
		},
		file = {
			mark = "[file]"
		},
		around = {
			mark = "[A]"
		},
		skkeleton = {
		 	mark = "[skk]",
		 	matchers = {},
		 	sorters = {},
		 	isVolatile = true,
		 	minAutoCompleteLength = 1
		}
	})
	fn["ddc#custom#patch_filetype"]("lua", "sources", {"nvim-lua"})
	fn["ddc#enable"]()
end

local function setup_pum()
	set("i", "<C-n>", "<cmd>call pum#map#select_relative(+1)<CR>")
	set("i", "<C-p>", "<cmd>call pum#map#select_relative(-1)<CR>")
	set("i", "<C-y>", "<cmd>call pum#map#confirm()<CR>")
	set("i", "<C-e>", "<cmd>call pum#map#cancel()<CR>")
end

local function setup_skk()
	cmd.packadd("vimplugin-skkeleton")
	fn["skkeleton#config"]({
		globalDictionaries = {"~/skk/SKK-JISYO.L"},
		eggLikeNewline = true,
	})
	set("i", "<C-j>", "<Plug>(skkeleton-toggle)")
	set("c", "<C-j>", "<Plug>(skkeleton-toggle)")
	set("t", "<C-j>", "<Plug>(skkeleton-toggle)")
end

setup_skk()

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	pattern = "*",
	callback = function()
		enable_ddc()
		setup_ddc()
		setup_pum()
		print("ddc setup is finished")
	end
})


