{ pkgs, ... } : 
{
	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			format = ''
[┌─────────────](bold green)$directory$git_branch$git_commit$git_metrics$git_status
[│](bold green) $all
[└──>](bold green)$character'';
		};
	};
}
