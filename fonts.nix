{ config, lib, pkgs, ... }: {
	fonts = {
		enableFontDir = true;
		fonts = with pkgs; [
			roboto
		];
		fontconfig = {
			ultimate.preset = "osx";
			defaultFonts = {
				monospace = [ "Roboto Mono" ];
				sansSerif = [ "Roboto" ];
			};
		};
	};
}
