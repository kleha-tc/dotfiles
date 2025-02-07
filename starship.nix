{ pkgs, ... } : 
{
	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			format = ""
			[┌─────────────](bold green) $directory$git
			[│](bold green) $all
			[└──>](bold green)
			"";
		};
	};
}
