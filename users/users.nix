{ config, pkgs, lib, ... }:

{
  # User account.
  users.users.aog = {
    isNormalUser = true;
    description = "aog";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };
}
