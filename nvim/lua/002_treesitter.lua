local parser_config = require "nvim-treesitter.parsers".get_parser_confings()
parser_config.nix = {
	install_info = {
		url = "@tree_sitter_nix@",
		files = {"parser"},
	},
	filetype = "nix",
}

require "nvim-treesitter.configs".setup {
	ensure_installed = {
		"nix"
	},
	highlight = {
		enable = true
	},
}
