{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/d3fc67ce-d614-4144-9c04-db9f0688550e";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/CAD7-DCC5";
      fsType = "vfat";
    };
  };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 4;
}
