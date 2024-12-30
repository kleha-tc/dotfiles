{ pkgs, ... }:
let
	fern-git-status = pkgs.vimUtils.buildVimPlugin {
		name = "vim-fern-git-status";
		src = builtins.fetchGit {
			url = "https://github.com/lambdalisue/vim-fern-git-status";
			rev = "151336335d3b6975153dad77e60049ca7111da8e";
		};
	};
	fern-renderer-nerdfont = pkgs.vimUtils.buildVimPlugin {
		name = "vim-fern-renderer-nerdfont";
		src = builtins.fetchGit {
			url = "https://github.com/lambdalisue/vim-fern-renderer-nerdfont";
			rev = "325629c68eb543229715b68920fbcb92b206beb6";
		};
	};
	vim-nerdfont = pkgs.vimUtils.buildVimPlugin {
		name = "vim-nerdfont";
		src = builtins.fetchGit {
			url = "https://github.com/lambdalisue/vim-nerdfont";
			rev = "e054fd135ee73db37cd5bf545e0ff9948ffec7bc";
		};
	};
	glyph-palette = pkgs.vimUtils.buildVimPlugin {
		name = "glyph-palette";
		src = builtins.fetchGit {
			url = "https://github.com/lambdalisue/vim-glyph-palette";
			rev = "1ee16c232c5538f34bb47c3dd0f6b369fdd7c555";
		};
	};
in
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		withNodeJs = true;
		plugins = with pkgs.vimPlugins; [
			denops-vim
			catppuccin-nvim
			nvim-treesitter
			nvim-treesitter-parsers.r
			nvim-treesitter-parsers.c
			nvim-treesitter-parsers.go
			nvim-treesitter-parsers.lua
			nvim-treesitter-parsers.nix
			nvim-treesitter-parsers.zig
			nvim-treesitter-parsers.vue
			nvim-treesitter-parsers.tsx
			nvim-treesitter-parsers.sql
			nvim-treesitter-parsers.php
			nvim-treesitter-parsers.csv
			nvim-treesitter-parsers.css
			nvim-treesitter-parsers.cpp
			nvim-treesitter-parsers.scss
			nvim-treesitter-parsers.toml
			nvim-treesitter-parsers.sway
			nvim-treesitter-parsers.yaml
			nvim-treesitter-parsers.rust
			nvim-treesitter-parsers.ruby
			nvim-treesitter-parsers.json
			nvim-treesitter-parsers.java
			nvim-treesitter-parsers.html
			nvim-treesitter-parsers.bash
			nvim-treesitter-parsers.typst
			nvim-treesitter-parsers.scala
			nvim-treesitter-parsers.ocaml
			nvim-treesitter-parsers.latex
			nvim-treesitter-parsers.gosum
			nvim-treesitter-parsers.gomod
			nvim-treesitter-parsers.cmake
			nvim-treesitter-parsers.python
			nvim-treesitter-parsers.pascal
			nvim-treesitter-parsers.bibtex
			nvim-treesitter-parsers.mermaid
			nvim-treesitter-parsers.haskell
			nvim-treesitter-parsers.gnuplot
			nvim-treesitter-parsers.doxygen
			nvim-treesitter-parsers.arduino
			nvim-treesitter-parsers.markdown
			nvim-treesitter-parsers.hyprlang
			nvim-treesitter-parsers.gitignore
			nvim-treesitter-parsers.gitcommit
			nvim-treesitter-parsers.typescript
			nvim-treesitter-parsers.javascript
			nvim-treesitter-parsers.dockerfile
			nvim-treesitter-parsers.git_config
			nvim-treesitter-parsers.gitattributes
			nvim-lspconfig
			{ plugin = vim-fern; optional = true; }
			{ plugin = telescope-nvim; optional = true; }
			{ plugin = telescope-github-nvim; optional = true; }
			{ plugin = fern-git-status; optional = true; }
			{ plugin = fern-renderer-nerdfont; optional = true; }
			{ plugin = vim-nerdfont; optional = true; }
			{ plugin = glyph-palette; optional = true; }
		];
		extraLuaConfig = ''
			-- require("000_dpp")
			require("001_treesitter")
			require("002_telescope")
			require("003_fern")
			require("004_color")
			require("005_lsp")
			require("101_main")
			require("102_keymap")
		'';
		extraPackages = with pkgs; [
			deno
			ripgrep
			fd
			trash-cli
			tinymist
		];
  };
  xdg.configFile = {
		# "nvim/lua/000_dpp.lua".source = pkgs.substituteAll {
		#  	src = ./lua/000_dpp.lua;
		# 	denopsSrc = pkgs.vimPlugins.denops-vim;
		# };
		"nvim/lua/001_treesitter.lua".source = ./lua/001_treesitter.lua;
		"nvim/lua/002_telescope.lua".source = ./lua/002_telescope.lua;
		"nvim/lua/003_fern.lua".source = ./lua/003_fern.lua;
		"nvim/lua/004_color.lua".source = ./lua/004_color.lua;
		"nvim/lua/005_lsp.lua".source = ./lua/005_lsp.lua;
		"nvim/lua/101_main.lua".source = ./lua/101_main.lua;
		"nvim/lua/102_keymap.lua".source = ./lua/102_keymap.lua;
		"nvim/dpp.ts".source = ./dpp.ts;
		"nvim/dpp.toml".source = ./dpp.toml;
		"nvim/dpp_lazy.toml".source = ./dpp_lazy.toml;
	};
	home.file = {
		".cache/dpp/dpp.vim".source = builtins.fetchGit {
			url = "https://github.com/Shougo/dpp.vim";
			rev = "b839d192dd2aee2423acd1cbb978f157e5967900";
		};
		".cache/dpp/dpp-ext-local".source = builtins.fetchGit {
			url = "https://github.com/Shougo/dpp-ext-local";
			rev = "3e0ea1083121b42a4d619b3e77aa9a919db5cdae";
		};
		".cache/dpp/dpp-ext-lazy".source = builtins.fetchGit {
			url = "https://github.com/Shougo/dpp-ext-lazy";
			rev = "0c02f386125929ce8c9eecba23389d686ace1a62";
		};
		".cache/dpp/dpp-ext-installer".source = builtins.fetchGit {
			url = "https://github.com/Shougo/dpp-ext-installer";
			rev = "5e325980819156c089b4b32e42c0251db474222f";
		};
		".cache/dpp/dpp-ext-toml".source = builtins.fetchGit {
			url = "https://github.com/Shougo/dpp-ext-toml";
			rev = "31f2d109af41129c9e866f300d7aeda1bf536624";
		};
		".cache/dpp/dpp-protocol-git".source = builtins.fetchGit {
			url = "https://github.com/Shougo/dpp-protocol-git";
			rev = "ad3e1d12418e0ff811a92f20a0562d9cf34ab6f3";
		};
		"works/catppuccin-nvim".source = pkgs.vimPlugins.catppuccin-nvim;
		"works/fern.vim".source = pkgs.vimPlugins.vim-fern;
		"works/telescope.nvim".source = pkgs.vimPlugins.telescope-nvim;
		"works/telescope-github".source = pkgs.vimPlugins.telescope-github-nvim;
	};
}
