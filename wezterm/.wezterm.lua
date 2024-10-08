-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Set the color scheme to use.
config.color_scheme = 'Panda (Gogh)'

-- Fonts
config.font = wezterm.font("Hack")
config.font_size = 9.0

config.window_background_opacity = 0.97

-- Define key bindings
config.keys = {
  {key="j", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
  {key="k", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},

  {key="n", mods="CTRL|ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},

  {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
  {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
  {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
  {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
  {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
  {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
  {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
  {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
  {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},

--   {key="LeftArrow", mods="CTRL+SHIFT", action=wezterm.action.DisableDefaultAssignment},
--   {key="RightArrow", mods="CTRL+SHIFT", action=wezterm.action.DisableDefaultAssignment},
}

config.selection_word_boundary = " \t\n{}[]()|\"'`"

-- Hide windows title bar.
if wezterm.target_triple:find("windows") then
  config.window_decorations = "RESIZE"
else
  config.window_decorations = "NONE"
end

-- Hide the tab bar if there is only one tab
config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = true

if wezterm.target_triple:find("windows") then
  config.default_prog = {"wsl.exe"}
end

return config
