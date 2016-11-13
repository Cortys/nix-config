{ config, lib, pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		wget
		nano
		gparted
		termite
		atom
		eclipses.eclipse-sdk-46
		vlc
		google-chrome
		nodejs
		php
		git
		networkmanager
		networkmanagerapplet
		pcmanfm
		rofi
		dropbox-cli
		i3status
		i3lock
		pasystray
	];

	programs = {
		zsh.enable = true;
	};
}
