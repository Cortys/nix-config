{ config, lib, pkgs, ... }:
let override = old: new: pkgs.stdenv.lib.overrideDerivation old (args: new (pkgs // pkgs.xorg));
in {
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		wget
		unzip
		nano
		gparted
		termite
		(override atom (import ./overrides/atom.nix))
		# (import ./gitkraken)
		eclipses.eclipse-sdk-46
		vlc
		google-chrome
		nodejs-6_x
		npm2nix
		php
		git
		gradle
		networkmanager
		networkmanagerapplet
		pcmanfm
		rofi
		dropbox-cli
		i3status
		i3lock
		bar
		pasystray
		arc-gtk-theme
		blender
		lastpass-cli
		patchelf
		scrot
		kde5.gwenview
		xorg.xbacklight
		xorg.xev
		texlive.combined.scheme-full
		transmission_gtk
	];

	programs = {
		zsh.enable = true;
	};

	virtualisation.virtualbox.host.enable = true;
}
