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
config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = true

if wezterm.target_triple:find("windows") then
  config.default_prog = {"wsl.exe"}
end

-- Checking if tmux is open doesn't work.
-- -- Check if tmux is running and adjust key bindings
-- if os.getenv("TMUX") and os.getenv("TMUX") == nil then
--   -- Leader is the same as my old tmux prefix
--   config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
--   config.keys = {
--     { mods = "LEADER", key = "-", action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
--     { mods = "LEADER", key = "\\", action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
--     { mods = "LEADER", key = "h", action = wezterm.action.ActivatePaneDirection "Left" },
--     { mods = "LEADER", key = "j", action = wezterm.action.ActivatePaneDirection "Down" },
--     { mods = "LEADER", key = "k", action = wezterm.action.ActivatePaneDirection "Up" },
--     { mods = "LEADER", key = "l", action = wezterm.action.ActivatePaneDirection "Right" },
--     -- { mods = "LEADER|CTRL", key = "a", action = wezterm.action.ActivateLastPane },
--     -- { mods = "LEADER", key = "d", action = wezterm.action.DetachPane },
--     { mods = 'LEADER', key = 'z', action = wezterm.action.TogglePaneZoomState },
--     -- rotate panes
--     { mods = "LEADER", key = "Space", action = wezterm.action.RotatePanes "Clockwise" },
--     -- show the pane selection mode, but have it swap the active and selected panes
--     { mods = 'LEADER', key = '0', action = wezterm.action.PaneSelect { mode = 'SwapWithActive', }, }
--   }
-- end

return config
