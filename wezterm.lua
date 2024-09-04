local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Solarized Darcula (Gogh)'
config.font = wezterm.font 'MesloLGS NF'

local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}
config.default_prog = gitbash

-- Configure like tmux.
config.leader = { key = 'a', mods = 'CTRL' }
config.keys = {
	{
	    key    = "\"",
		mods   = "LEADER|SHIFT",
	    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
	},
	{
	    key    = "|",
		mods   = "LEADER|SHIFT",
	    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
  	{ 
		key = 'c', 
		mods = "LEADER",
		action = wezterm.action.SpawnTab 'DefaultDomain',
	},
  	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane { confirm = false },
  	},
  	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection 'Down',
  	},
  	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection 'Up',
  	},
  	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection 'Left',
  	},
  	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection 'Right',
  	},
    {
        key = "Space",
        mods = "LEADER",
        action = wezterm.action.RotatePanes "Clockwise"
    },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
