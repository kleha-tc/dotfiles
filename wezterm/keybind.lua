local wezterm = require("wezterm")
local act = wezterm.action

return {
	keys = {
		{
			key = "t",
			mods = "CTRL",
			action = act.SpawnTab "CurrentPaneDomain",
		},
		{
			key = "w",
			mods = "CTRL|ALT",
			action = act.SpawnWindow,
		},
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SpawnTab { DomainName = "WSL:NixOS", },
		},
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = act.AttachDomain "WSL:NixOS",
		},
		{
			key = "t",
			mods = "CTRL|ALT",
			action = act.SpawnTab "DefaultDomain",
		},
		{
			key = "{",
			mods = "ALT|SHIFT",
			action = act.MoveTabRelative(-1)
		},
		{
			key = "}",
			mods = "ALT|SHIFT",
			action = act.MoveTabRelative(1)
		},
	}
}
