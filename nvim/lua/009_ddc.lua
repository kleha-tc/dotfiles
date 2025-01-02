local cmd = vim.cmd
local fn = vim.fn
local set = vim.keymap.set

local function enable_ddc()
	cmd.packadd("ddc.vim")
	cmd.packadd("ddc-ui-pum")
	cmd.packadd("ddc-source-lsp")
	cmd.packadd("vimplugin-ddc-source-around")
	cmd.packadd("ddc-filter-sorter_rank")
	cmd.packadd("ddc-filter-matcher_head")
end

local function setup_ddc()
	fn["ddc#custom#patch_global"]("ui", "pum")
	fn["ddc#custom#patch_global"]("sources", {"lsp", "around"})
	fn["ddc#custom#patch_global"]("sourceOptions", {
		_ = {
			matchers = {"matcher_head"},
			sorters = {"sorter_rank"},
		},
	})
	fn["ddc#enable"]()
end

local function setup_pum()
	set("i", "<C-n>", "<Cmd>call pum#map#insert_relative(+1)<CR>")
	set("i", "<C-p>", "<Cmd>call pum#map#insert_relative(-1)<CR>")
	set("i", "<C-y>", "<Cmd>call pum#map#confirm()<CR>")
	set("i", "<C-e>", "<Cmd>call pum#map#cancel()<CR>")
	set("i", "<C-N>", "<Cmd>call pum#map#insert_relative_page(+1)<CR>")
	set("i", "<C-P>", "<Cmd>call pum#map#insert_relative_page(-1)<CR>")
end

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	pattern = "*",
	callback = function()
		enable_ddc()
		setup_pum()
		setup_ddc()
	end
})
