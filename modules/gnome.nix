{ config, pkgs, lib, ... }:

{
  # Exclude xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
