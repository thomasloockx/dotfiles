local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Solarized Darcula'
config.font = wezterm.font 'JetBrains Mono'

local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}
config.default_prog = git_bash

return config
