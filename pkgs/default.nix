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
		fam
		lxqt.lxqt-sudo
		(override atom (import ./overrides/atom.nix))
		(override gitkraken (import ./overrides/gitkraken.nix))
		(override staruml (import ./overrides/staruml.nix))
		eclipses.eclipse-sdk-46
		vlc
		mpv
		rhythmbox
		google-chrome
		nodejs-7_x
		npm2nix
		php
		git
		gradle
		leiningen
		maven
		h2
		networkmanager
		networkmanagerapplet
		pcmanfm
		rofi
		dropbox-cli
		i3status
		i3lock
		bar
		pasystray
		arc-theme
		arc-icon-theme
		breeze-icons
		gnome3.adwaita-icon-theme
		blender
		gimp
		inkscape
		umlet
		lastpass-cli
		patchelf
		scrot
		gwenview
		xorg.xbacklight
		xorg.xev
		texlive.combined.scheme-full
		transmission_gtk
		compton
		feh
		libreoffice
		ranger
		udiskie
		unrar
		gnumake
		openjdk
		qpdfview
	];

	programs = {
		zsh.enable = true;
	};

	virtualisation.virtualbox.host.enable = true;
}
