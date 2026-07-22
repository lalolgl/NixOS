{ config, pkgs, ... }:

{
  imports = [
    ./programs/cava.nix
  ];

  home.username = "aog";
  home.homeDirectory = "/home/aog";

  home.stateVersion = "25.11";

  programs.bash.enable = true;
  programs.git.enable = true;
}
