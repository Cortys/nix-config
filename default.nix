{ config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
		./users.nix
		./desktop.nix
		./fonts.nix
		./pkgs
	];

	boot = {
		kernelPackages = pkgs.linuxPackages_4_8;
		supportedFilesystems = [ "exfat" ];
		loader = {
			systemd-boot.enable = true;
			grub.device = "/dev/sda1";
			timeout = 0;
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
		defaultLocale = "en_GB.UTF-8";
	};

	time.timeZone = "Europe/Berlin";

	system = {
		autoUpgrade.enable = true;
		autoUpgrade.channel = https://nixos.org/channels/nixos-16.09;
		stateVersion = "16.09";
	};
}
