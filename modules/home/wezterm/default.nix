{...}: {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm';

      return {
      		font_size = 15.0,
      		font = wezterm.font("Liga SFMono Nerd Font"),
      		enable_scroll_bar = false,
      		check_for_updates = false,
      		window_padding = {
      				left = 40,
      				right = 40,
      				top = 40,
      				bottom = 40,
      		},
      		window_background_opacity = 1,
      		window_decorations = "RESIZE",
      		window_close_confirmation = "NeverPrompt",
      		enable_tab_bar = true,
      		use_fancy_tab_bar = false,
      		tab_bar_at_bottom = true,
      		show_new_tab_button_in_tab_bar = false,
      		enable_wayland = true,
      		default_cursor_style = "SteadyUnderline",
      		warn_about_missing_glyphs = false,

      		keys = {
         	{ key = "f", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },
         	{
         		key = "n",
         		mods = "ALT",
         		action = wezterm.action.SplitHorizontal({
         			domain = "CurrentPaneDomain",
         		}),
         	},
         	{
         		key = "n",
         		mods = "SHIFT|ALT",
         		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
         	},
         	{
         		key = "w",
         		mods = "ALT",
         		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
         	},
         	{
         		key = "t",
         		mods = "CTRL",
         		action = wezterm.action.SpawnTab("DefaultDomain"),
         	},
         	{
         		key = "h",
         		mods = "SHIFT|ALT",
         		action = wezterm.action.AdjustPaneSize({ "Left", 2 }),
         	},
         	{
         		key = "l",
         		mods = "SHIFT|ALT",
         		action = wezterm.action.AdjustPaneSize({ "Right", 2 }),
         	},
         	{
         		key = "j",
         		mods = "SHIFT|ALT",
         		action = wezterm.action.AdjustPaneSize({ "Down", 2 }),
         	},
         	{
         		key = "k",
         		mods = "SHIFT|ALT",
         		action = wezterm.action.AdjustPaneSize({ "Up", 2 }),
         	},
         	{
         		key = "h",
         		mods = "ALT",
         		action = wezterm.action.ActivatePaneDirection("Left"),
         	},
         	{
         		key = "l",
         		mods = "ALT",
         		action = wezterm.action.ActivatePaneDirection("Right"),
         	},
         	{
         		key = "j",
         		mods = "ALT",
         		action = wezterm.action.ActivatePaneDirection("Down"),
         	},
         	{
         		key = "k",
         		mods = "ALT",
         		action = wezterm.action.ActivatePaneDirection("Up"),
         	},
         },
      }
    '';
  };
}
