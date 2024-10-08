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
-- config.color_scheme = 'Sonokai (Gogh)'
-- config.color_scheme = 'Hybrid (Gogh)'
-- config.color_scheme = 'Japanesque (Gogh)'
-- config.color_scheme = 'Hemisu Dark (Gogh)'
-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = 'Peppermint (Gogh)'
-- config.color_scheme = 'Ocean Dark (Gogh)'
-- config.color_scheme = 'Monokai Pro Ristretto (Gogh)'
-- config.color_scheme = 'Palenight (Gogh)'

-- Fonts
config.font = wezterm.font("Hack")
config.font_size = 11.0

-- config.window_background_opacity = 0.97
config.window_background_opacity = 1

-- config.front_end = "WebGpu"

config.scrollback_lines = 1000000

-- Define key bindings
local act = wezterm.action
config.keys = {
  {key="j", mods="ALT", action=act.ActivateTabRelative(-1)},
  {key="k", mods="ALT", action=act.ActivateTabRelative(1)},

  {key="n", mods="CTRL|ALT", action=act.SpawnTab("CurrentPaneDomain")},

	{key = "\\", mods = "SUPER | CTRL", action=act.SplitPane({ direction = "Right" })},
	{key = "Enter", mods = "SUPER | CTRL", action=act.SplitPane({ direction = "Down" })},

  { key = "k", mods = "SUPER | SHIFT", action = act.ScrollToPrompt(-1) },
	{ key = "j", mods = "SUPER | SHIFT", action = act.ScrollToPrompt(1) },

  { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },

  { key = 'p', mods = 'CTRL | SHIFT', action = wezterm.action.ShowLauncher },

  -- {key="LeftArrow", mods="CTRL+SHIFT", action=wezterm.action.DisableDefaultAssignment},
  -- {key="RightArrow", mods="CTRL+SHIFT", action=wezterm.action.DisableDefaultAssignment},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

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
-- config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = true

if wezterm.target_triple:find("windows") then
  config.default_prog = {"wsl.exe"}
end

-- Checking if tmux is open doesn't work.
-- -- Check if tmux is running and adjust key bindings
-- -- See: https://github.com/wez/wezterm/discussions/2329
-- if os.getenv("TMUX") and os.getenv("TMUX") == nil then
--   -- Leader is the same as my old tmux prefix
--   config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
--   config.keys = {
-- 		-- Window management
-- 		{key="a",  mods="LEADER", action=act{SendString="`"}},
-- 		{key="-",  mods="LEADER", action=act{SplitVertical={domain="CurrentPaneDomain"}} },
-- 		{key="\\", mods="LEADER", action=act.SplitHorizontal{domain="CurrentPaneDomain"}},
-- 		{key="z" , mods="LEADER", action="TogglePaneZoomState" },
-- 		{key="c" , mods="LEADER", action=act{SpawnTab="CurrentPaneDomain"}},

-- 		{key="h", mods="LEADER", action=act.ActivatePaneDirection("Left")},
-- 		{key="j", mods="LEADER", action=act.ActivatePaneDirection("Down")},
-- 		{key="k", mods="LEADER", action=act.ActivatePaneDirection("Up")},
-- 		{key="l", mods="LEADER", action=act.ActivatePaneDirection("Right")},

-- 		{key="H", mods="LEADER", action=act{AdjustPaneSize={"Left", 4}}},
-- 		{key="J", mods="LEADER", action=act{AdjustPaneSize={"Down", 4}}},
-- 		{key="K", mods="LEADER", action=act{AdjustPaneSize={"Up", 4}}},
-- 		{key="L", mods="LEADER", action=act{AdjustPaneSize={"Right", 5}}},

-- 		{key="`", mods="LEADER", action=act.ActivateLastTab},
-- 		{key=" ", mods="LEADER", action=act.ActivateTabRelative(1)},
-- 		{key="1", mods="LEADER", action=act{ActivateTab=0}},
-- 		{key="2", mods="LEADER", action=act{ActivateTab=1}},
-- 		{key="3", mods="LEADER", action=act{ActivateTab=2}},
-- 		{key="4", mods="LEADER", action=act{ActivateTab=3}},
-- 		{key="5", mods="LEADER", action=act{ActivateTab=4}},
-- 		{key="6", mods="LEADER", action=act{ActivateTab=5}},
-- 		{key="7", mods="LEADER", action=act{ActivateTab=6}},
-- 		{key="8", mods="LEADER", action=act{ActivateTab=7}},
-- 		{key="9", mods="LEADER", action=act{ActivateTab=8}},
-- 		{key="x", mods="LEADER", action=act{CloseCurrentPane={confirm=true}}},
--     -- { mods = "LEADER|CTRL", key = "a", action = wezterm.action.ActivateLastPane },
--     -- { mods = "LEADER", key = "d", action = act.DetachDomain 'CurrentPaneDomain'},
--     { mods = 'LEADER', key = 'z', action = wezterm.action.TogglePaneZoomState },
--     -- rotate panes
--     { mods = "LEADER", key = "Space", action = wezterm.action.RotatePanes "Clockwise" },
--     -- show the pane selection mode, but have it swap the active and selected panes
--     { mods = 'LEADER', key = '0', action = wezterm.action.PaneSelect { mode = 'SwapWithActive', }, }
--   }
-- end

return config
