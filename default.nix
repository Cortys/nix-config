{ config, pkgs, ... }: {
	imports = [
		./users.nix
		./desktop.nix
		./fonts.nix
		./pkgs
	];

	boot = {
		kernelPackages = pkgs.linuxPackages_4_12;
		supportedFilesystems = [ "exfat" "ntfs" ];
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
		defaultLocale = "en_GB.UTF-8";
	};

	time.timeZone = "Europe/Berlin";

	system = {
		autoUpgrade.enable = true;
		autoUpgrade.channel = https://nixos.org/channels/nixos-17.03;
		stateVersion = "17.03";
	};

	powerManagement.enable = true;
}
