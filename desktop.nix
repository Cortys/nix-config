{ config, lib, pkgs, ... }: {
	services.xserver = {
		enable = true;
		layout = "de";
		xkbOptions = "eurosign:e";

		displayManager.lightdm = {
			enable = true;
			autoLogin = {
				enable = true;
				user = "clemens";
			};
		};
		windowManager.i3 = {
			enable = true;
		};
		desktopManager.xterm.enable = false;
		windowManager.default = "i3";

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
}
