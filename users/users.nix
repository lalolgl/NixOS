{ config, pkgs, lib, ... }:

{
  # User account.
  users.users.aog = {
    isNormalUser = true;
    description = "aog";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    packages = with pkgs; [
    ];
  };
}
