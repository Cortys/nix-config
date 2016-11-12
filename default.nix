{ config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
	];

	boot = {
		supportedFilesystems = [ "exfat" ];
		loader = {
			systemd-boot.enable = true;
			grub.device = "/dev/sda1";
			timeout = 1;
		};
		consoleLogLevel = 1;
	};

	hardware.pulseaudio.enable = true;

	networking = {
		hostName = "cortys";
		networkmanager.enable = true;
	};

	i18n = {
		consoleFont = "Lat2-Terminus16";
		consoleKeyMap = "de";
		defaultLocale = "de_DE.UTF-8";
	};

	time.timeZone = "Europe/Berlin";

	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		wget
		nano
		gparted
		termite
		atom
		vlc
		google-chrome
		nodejs
		git
		networkmanager
		networkmanagerapplet
		pcmanfm
		rofi
		dropbox-cli
		roboto
		i3status
		i3lock
		pasystray
	];

	programs = {
		zsh.enable = true;
	};

	services.xserver = {
		enable = true;
		layout = "de";
		xkbOptions = "eurosign:e";

		displayManager.lightdm = {
			enable = true;
		};
		windowManager.i3 = {
			enable = true;
		};

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
				Option "TapAndDragGesture" "0"
			'';
		};
	};

	users = {
		mutableUsers = false;

		users = {
			root = {
				hashedPassword = "$1$x48le03f$Fzxp.UVWDtTZfcVlKx9AT0";
				shell = "/run/current-system/sw/bin/zsh";
			};

			clemens = {
				hashedPassword = "$1$wezg.Ku7$wxSfUrrj7xXd51ucyB6UW/";
				isNormalUser = true;
				home = "/home/clemens";
				description = "Clemens Damke";
				group = "admin";
				extraGroups = [ "wheel" "networkmanager" ];
				uid = 1000;
				shell = "/run/current-system/sw/bin/zsh";
			};
		};

		groups.admin = {
			gid = 1000;
		};
	};

	system = {
		autoUpgrade.enable = true;
		autoUpgrade.channel = https://nixos.org/channels/nixos-16.09;
		stateVersion = "16.09";
	};
}
