{ pkgs, ... } : 
{
	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			format = ''
[┌──────────](bold green)$directory$git_branch$git_commit$git_metrics$git_status
[│](bold green) 
[└─](bold green)$character'';
			character = {
				success_symbol = "[─>>](bold green)";
				error_symbol = "[─|>](bold red)";
			};
		};
	};
}
