{ config, pkgs, inputs, ... }:
{
  imports = [ inputs.hyprland.homeManagerModules.default ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
			# Monitor
			monitor = DP-2,2560x1440@165.00,1920x0,1
			monitor = HDMI-A-1,1920x1080@144.00,0x0,1
			workspace = HDMI-A-1,1

			# Autostart
			exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
			exec-once = mako
			exec-once = waybar
			exec-once = swww init
			exec-once = swww img "/home/chokerman/dotfiles/pictures/wallpapers/wallpaper.jpg" --transition-type random --transition-step 5 --transition-fps 165
			exec-once = hyprctl setcursor "Bibata-Modern-Ice" 24

			# Keyboard and mouse
			input {
				kb_layout = us,ru
				kb_options = grp:sclk_toggle,caps:escape
				repeat_delay = 300
				repeat_rate = 50
				natural_scroll = 0
				force_no_accel = 1
				numlock_by_default = 1
			}

			general {
				gaps_in = 8
				gaps_out = 16
				border_size = 3

				# col.active_border = rgb(161616)
				col.active_border = rgb(393939)
				col.inactive_border = rgb(262626)
				
				# col.active_border = rgb(C5467E)
				# col.inactive_border = rgba(66777700)
				col.group_border = rgb(6BABD3)
				col.group_border_active = rgb(BF447A)
				sensitivity = 1.00
				layout = dwindle
				apply_sens_to_raw = 0
				resize_on_border = 1

				# no_focus_fallback = 1
			}

			dwindle {
					no_gaps_when_only       = false
					pseudotile              = true
					force_split 	          =   2
					preserve_split          = true
			}

			misc {
				enable_swallow	    = 	true
				swallow_regex	      = 	^(org.wezfurlong.wezterm|zsh|Zellij).*$

				groupbar_titles_font_size = 	10
				groupbar_text_color       = 	rgb(ee5396)
				focus_on_activate = 1
				vfr   =   0
			}

			decoration {
				rounding=14

				blur {
				enabled=1
				size = 4
				passes = 6
				new_optimizations=1
				}

				drop_shadow=0
				shadow_range=12
				shadow_render_power=2
				col.shadow=rgb(262626)
				col.shadow_inactive=rgb(161616)
			}

			animations {
				enabled = yes
				# Animation curves
				
				bezier = md3_standard, 0.2, 0.0, 0, 1.0
				bezier = md3_decel, 0.05, 0.7, 0.1, 1
				bezier = md3_accel, 0.3, 0, 0.8, 0.15
				bezier = overshot, 0.05, 0.9, 0.1, 1.05
				bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
				bezier = win10, 0, 0, 0, 1
				bezier = gnome, 0, 0.85, 0.3, 1
				bezier = funky, 0.46, 0.35, -0.2, 1.2

				# Animation configs
				animation = windows, 1, 2, hyprnostretch, popin 80%
				animation = windowsOut, 1, 7, funky, popin
				animation = border, 1, 5, default
				animation = fade, 1, 8, default
				animation = workspaces, 1, 4, md3_decel, slide
				animation = specialWorkspace, 1, 2, gnome, slidevert
		}

      # Keybinds
			$mainMod=SUPER

      # some nice mouse binds
      bindm=$mainMod,mouse:272,movewindow
      bindm=$mainMod,mouse:273,resizewindow
      
      # terminals
      bind=$mainMod,Q,exec,alacritty
      # bind=ALT,Return,exec,footclient
      
      bind=ALT,Return,exec,wezterm
      # bind=$mainMod,Return,exec,wezterm
      
      # bind=$mainMod,Return,exec,wezterm
      # bind=$mainMod,Return,exec,footclient
      
      bind=$mainMod,Return,exec,cool-retro-term
      # bind=ALT,Return,exec,cool-retro-term
      
      # bind=CTRL,Return,exec,kitty
      
      # launchers
      bind=$mainMod,space,exec,rofi -show drun -theme ~/.config/rofi/styles/apps.rasi -no-disable-history
      # bind=$mainMod,R,exec,rofi -show run -theme
      bind=$mainMod,period,exec,killall rofi || printf $(cut -d ';' -f1 "$HOME/.config/rofi/emoji/emojis.txt" | rofi -dmenu -theme ~/.config/rofi/global/rofi.rasi | sed "s/ .*//") | wl-copy
      bind=$mainMod,X,exec,hyprpicker -a -n
      
      # quickly open shi
      bind=$mainMod,N,exec,env -u WAYLAND_DISPLAY neovide
      #bind=$mainMod,E,exec,wezterm start lfub
      bind=$mainMod,E,exec,nautilus
      bind=$mainMod,B,exec,$BROWSER
      bind=CTRL$mainMod,Y,exec,recommended.sh
      # bind=$mainMod,Y,exec,youtube.sh
      bind=$mainMod,Y,exec,foot -T youtube-tui -e youtube-tui
      bind=$mainMod,A,exec,jerry --rofi
      bind=SHIFT$mainMod,A,exec,jerry --rofi --discord
      bind=$mainMod,T,exec,rofi-bard
      bind=$mainMod,M,exec,lobster -i --rofi -x -c
      bind=$mainMod,G,exec,rofi -show filebrowser
      bind=$mainMod,O,exec,cool-retro-term -e btop
      bind=$mainMod,I,exec,video-wrapper.sh "$(wl-paste)"
      bind=$mainMod,Z,exec,zathura
      bind=SHIFT$mainMod, p, pin
      
      # media keys
      bind=,XF86AudioRaiseVolume,exec,pamixer -i 5 && volume.sh
      bind=,XF86AudioLowerVolume,exec,pamixer -d 5 && volume.sh
      bind=,XF86AudioMute,exec,pamixer -t && volume.sh
      bind=,XF86AudioPlay,exec,playerctl -i firefox play-pause
      bind=,XF86AudioNext,exec,playerctl -i firefox next
      bind=,XF86AudioPrev,exec,playerctl -i firefox previous
      # same thing but without fn keys
      bind=,95,exec,playerctl -i firefox play-pause
      bind=,96,exec,playerctl -i firefox next
      bind=,75,exec,playerctl -i firefox previous
      
      # clipboard history
      # bind=CTRL$mainMod,V,exec,cliphist list | rofi -dmenu -p "" | cliphist decode | wl-copy
      bind=CTRL$mainMod,V,exec,copyq toggle
      
      # screenshot
      # $screenshotarea = hyprctl keyword animation "fadeOut,0,0,default"; grimblast --notify copy area; hyprctl keyword animation "fadeOut,1,4,default"
      # bind=$mainModSHIFT,S,exec, $screenshotarea
      bind=,107,exec,screenshot.sh fullscreen
      bind=SHIFT,107,exec,screenshot.sh selectarea
      bind=CTRLSHIFT,107,exec,screenshot.sh quickedit
      bind=$mainMod,107,exec,screenshot.sh quickcote
      bind=$mainModSHIFT,107,exec,screenshot.sh save
      
      # screenrecording
      bind=,127,exec,~/scripts/screenrecord.sh start
      bind=SHIFT,127,exec,~/scripts/screenrecord.sh stop
      
      # misc
      bind=ALT,M,exec,notify-send "Pasting link into the video wrapper script..." && video-wrapper.sh $(wl-paste)
      bind=$mainModSHIFT,L,exec,swaylock -f -i ~/pix/wallpapers/black.jpg
      
      # wallpaper binds
      bind=$mainMod,114,exec,echo 'playlist_next' | socat - /tmp/mpvpaper-socket && current_wallpaper_resolution.sh
      bind=$mainMod,113,exec,echo 'playlist_prev' | socat - /tmp/mpvpaper-socket && current_wallpaper_resolution.sh
      
      # window management stuff
      bind=CTRL$mainModALT,M,exit,
      bind=$mainMod,C,killactive,
      bind=$mainMod,V,togglefloating,
      bind=$mainMod,F,fullscreen, 1
      bind=SHIFT$mainMod,F,fullscreen, 0
      bind=$mainMod,R,exec,rofi -show run
      
      # moving between workspaces
      bind=$mainMod,h,movefocus,l
      bind=$mainMod,l,movefocus,r
      bind=$mainMod,left,movefocus,l
      bind=$mainMod,right,movefocus,r
      bind=$mainMod,k,movefocus,u
      bind=$mainMod,j,movefocus,d
      
      # changing workspaces
      # bind=$mainMod,1,exec,~/.config/hypr/scripts/workspace 1
      # bind=$mainMod,2,exec,~/.config/hypr/scripts/workspace 2
      # bind=$mainMod,3,exec,~/.config/hypr/scripts/workspace 3
      # bind=$mainMod,4,exec,~/.config/hypr/scripts/workspace 4
      # bind=$mainMod,5,exec,~/.config/hypr/scripts/workspace 5
      # bind=$mainMod,6,exec,~/.config/hypr/scripts/workspace 6
      # bind=$mainMod,7,exec,~/.config/hypr/scripts/workspace 7
      # bind=$mainMod,8,exec,~/.config/hypr/scripts/workspace 8
      # bind=$mainMod,9,exec,~/.config/hypr/scripts/workspace 9
      bind=$mainMod,1,workspace,1
      bind=$mainMod,2,workspace,2
      bind=$mainMod,3,workspace,3
      bind=$mainMod,4,workspace,4
      bind=$mainMod,5,workspace,5
      bind=$mainMod,6,workspace,6
      bind=$mainMod,7,workspace,7
      bind=$mainMod,8,workspace,8
      bind=$mainMod,9,workspace,9
      bind=$mainMod,S,togglespecialworkspace,
      
      # moving windows between workspaces
      bind=ALT,1,movetoworkspace,1
      bind=ALT,2,movetoworkspace,2
      bind=ALT,3,movetoworkspace,3
      bind=ALT,4,movetoworkspace,4
      bind=ALT,5,movetoworkspace,5
      bind=ALT,6,movetoworkspace,6
      bind=ALT,7,movetoworkspace,7
      bind=ALT,8,movetoworkspace,8
      bind=ALT,9,movetoworkspace,9
      bind=ALT,S,movetoworkspace,special
      
      # groups <3 hentai man
      bind=$mainMod,49,togglegroup,
      bind=$mainMod,tab,changegroupactive,
      
      # recent workspace
      bind=ALT,tab,exec,hyprctl dispatch $(head -1 /tmp/workprev)
      
      # resize
      bind = $mainMod CTRL, h, resizeactive, -100 0
      bind = $mainMod CTRL, l, resizeactive, 100 0
      bind = $mainMod CTRL, k, resizeactive, 0 -100
      bind = $mainMod CTRL, j, resizeactive, 0 100
      
      # switch windows
      bind = $mainMod SHIFT,n,swapnext
      bind = $mainMod SHIFT,p,swapnext,prev
      bind = $mainMod SHIFT,s,swapactiveworkspaces, 0 1
      
      # SUBMAPS
      
      # disable all keybinds (i use this for when i'm working with virtual machines)
      # my 86 key code is `+` on the numpad
      bind=$mainMod,86,submap,clean
      submap=clean
      bind=$mainMod,86,submap,reset
      submap=reset
      
      # resize submap
      bind=SHIFT$mainMod,R,submap,resize
      submap=resize
      
      binde=,l,resizeactive,10 0
      binde=,h,resizeactive,-10 0
      binde=,k,resizeactive,0 -10
      binde=,j,resizeactive,0 10
      bind=,escape,submap,reset
      
      submap=reset
      
      bind=$mainMod,P,submap,rofi-scripts
      submap=rofi-scripts
      # bind=,A,exec,jerry --rofi -i
      bind=,M,exec,lobster -i --rofi -x
      # bind=,N,exec,nordvpn.sh
      bind=,escape,submap,reset
      submap=reset
      
      # powermenu bind
      bind=$mainMod,104,exec,powermenu.sh
		'';
  };
}
