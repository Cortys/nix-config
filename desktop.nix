{ config, lib, pkgs, ... }: {
	services.xserver = {
		enable = true;
		layout = "de";
		xkbOptions = "eurosign:e";

		displayManager.lightdm = {
			enable = true;
			autoLogin = {
				enable = false;
				user = "clemens";
			};
			background = toString ./wallpaper.png;
		};
		windowManager.i3 = {
			enable = true;
			package = pkgs.i3-gaps;
		};
		desktopManager.xterm.enable = false;
		windowManager.default = "i3";

		synaptics = {
			enable = true;
			palmDetect = true;
			horizTwoFingerScroll = true;
			vertTwoFingerScroll = true;
			scrollDelta = -40;
			maxSpeed = "2.5";
			minSpeed = "1.0";
			accelFactor = "0.02";
			fingersMap = [ 1 3 2 ];
			additionalOptions = ''
				Option "TapAndDragGesture" "1"
			'';
		};
	};

	services.compton = {
		enable = true;
		inactiveOpacity = "0.8";
	};

	services.gnome3.gvfs.enable = true;

	environment.extraInit = ''
		# GTK3: add theme to search path for themes
		export XDG_DATA_DIRS="${pkgs.arc-theme}/share:$XDG_DATA_DIRS"

		# GTK3: add /etc/xdg/gtk-3.0 to search path for settings.ini
		export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

		# GTK2 theme + icon theme
		export GTK2_RC_FILES=${pkgs.writeText "iconrc" ''gtk-icon-theme-name="breeze"''}:${pkgs.arc-theme}/share/themes/Arc/gtk-2.0/gtkrc:$GTK2_RC_FILES

		# SVG loader for pixbuf (needed for GTK svg icon themes)
		export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)

		export LD_LIBRARY_PATH=$HOME/.nix-profile/lib:/run/current-system/sw/lib:$LD_LIBRARY_PATH
	'';

	environment.etc."xdg/gtk-3.0/settings.ini" = {
		text = ''
			[Settings]
			gtk-icon-theme-name=breeze
			gtk-theme-name=Arc-Dark
			gtk-application-prefer-dark-theme = true
		'';
		mode = "444";
	};

	environment.etc."gtk-2.0/gtkrc" = {
		text = ''
			gtk-icon-theme-name=breezewwweeew
		'';
		mode = "444";
	};

	services.acpid = {
		enable = true;
		lidEventCommands = "i3lock";
	};
}
