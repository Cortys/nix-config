{ config, lib, pkgs, ... }: {
	fonts = {
		enableFontDir = true;
		fonts = with pkgs; [
			roboto
			noto-fonts
			noto-fonts-emoji
			meslo-lg
			terminus_font
			terminus_font_ttf
		];
		fontconfig = {
			ultimate = {
				preset = "osx";
				substitutions = "combi";
			};
			defaultFonts = {
				monospace = [ "Roboto Mono" "Noto Color Emoji" ];
				sansSerif = [ "Roboto" "Noto Color Emoji" ];
				serif = [ "DejaVu Serif" "Noto Color Emoji" ];
			};
		};
	};
}
