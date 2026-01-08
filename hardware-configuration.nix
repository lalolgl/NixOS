{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # LUKS root
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/45f29360-86e1-4fff-9d13-e7060c3819c4";
      preLVM = true;
    };
  };

  # Root filesystem (inside LUKS)
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ecf90a91-3263-4323-a54a-2d0e60eb253e";
    fsType = "ext4";
  };

  # EFI boot
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4782-1090";
    fsType = "vfat";
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
