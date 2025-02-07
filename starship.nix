{ pkgs, ... } : 
{
	programs.starship = {
		enable = true;
		settings = {
			"$schema" = 'https://starship.rs/config-schema.json'
			add_newline = true
			format = '''
			[┌─────────────](bold green) $directory$git
			[│](bold green) $all
			[└──>](bold green)'''
		};
	};
}
