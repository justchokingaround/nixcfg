{ pkgs
, ...
}: {
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
					default_prog = "zsh",
					warn_about_missing_glyphs = false,
			}
		'';
	};

}
