{ config, pkgs, lib, ... }:

{
  # Hostname
  networking.hostName = "zephyrus";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    9999 # VPN
    27015 # Steam
    27036 # Steam
    57621 # Spotify
    53317 # Localsend
    20712 # Qbittorrent
  ];
  networking.firewall.allowedUDPPorts = [
    9999 # VPN
    27015 # Steam
    27036 # Steam
    57621 # Spotify
    53317 # Localsend
  ];
}
