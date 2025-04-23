{ pkgs, ... } : 
{
	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			format = ''
$directory[](fg:#99d1db bg:#eebebe)$direnv[](fg:#eebebe bg:#f4b8e4)$git_branch$git_status[](fg:#f4b8e4 bg:#babbf1)$cmd_duration[](fg:#babbf1)
[│](bold green)$all$character'';
			directory = {
				format = "[ $path]($style)[ $read_only]($read_only_style)";
				style = "bold #737994 bg:#99d1db";
				read_only_style = "bold #e78284 bg:#99d1db";
			};
			direnv = {
				disabled = false;
				format = "[ $symbol$allowed]($style)";
				style = "bold #838ba7 bg:#eebebe";
			};
			git_branch = {
				format = "[ $symbol$branch(:$remote_branch)]($style)";
				style = "bold #838ba7 bg:#f4b8e4";
			};
			git_status = {
				format = "[ $all_status]($style)";
				style = "bold #8caaee bg:#f4b8e4";
			};
			cmd_duration = {
				format = "[  $duration]($style)";
				style = "bold #838ba7 bg:#babbf1";
			};
			character = {
				success_symbol = "[└──>>](bold green)";
				error_symbol = "[└──>](bold #e78284)";
			};
		};
	};
}


