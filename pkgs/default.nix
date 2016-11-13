{ config, lib, pkgs, ... }:
let override = old: new: pkgs.stdenv.lib.overrideDerivation old (args: new (pkgs // pkgs.xorg));
in {
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		wget
		nano
		gparted
		termite
		(override atom (import ./overrides/atom.nix))
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
