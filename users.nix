{ config, lib, pkgs, ... }: {
	users = {
		mutableUsers = false;
		defaultUserShell = "/var/run/current-system/sw/bin/zsh";

		users = {
			root = {
				hashedPassword = "$1$x48le03f$Fzxp.UVWDtTZfcVlKx9AT0";
			};

			clemens = {
				hashedPassword = "$1$wezg.Ku7$wxSfUrrj7xXd51ucyB6UW/";
				isNormalUser = true;
				home = "/home/clemens";
				description = "Clemens Damke";
				group = "admin";
				extraGroups = [ "wheel" "networkmanager" ];
				uid = 1000;
			};
		};

		groups.admin = {
			gid = 1000;
		};
	};
}
