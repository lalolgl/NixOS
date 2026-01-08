{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.nixvirt.nixosModules.default ];
  virtualisation.libvirtd.enable = true;

  virtualisation.virt.domains = {
    kali-linux = {
      name = "kali";

      # Hardware
      cpu = {
        cores = 4;
      };
      memory = 6144;
      disks = [
        {
          device = "vda";
          disk = "/home/aog/VM/kali-linux.qcow2";
          format = "qcow2";
          size = 25;
        }
      ];

      # ISO
      boot.devices = [ "cdrom" ];
      cdrom = {
        file = "/home/aog/Documents/ISO/kali-linux-2025.4-installer-amd64.iso";
      };

      # USB Wi-Fi
      usb = [
        {
          vendor = "148f"; # Ralink Technology
          product = "7601"; # MT7601U Wireless Adapter
        }
      ];

      # Network
      #interfaces = [
      # {
      #  network = "default";
      # }
      #];
      autostart = false;
    };
  };
}
