{ config, pkgs, ... }:

{
  imports = [
    ./programs/kitty.nix
    ./programs/fish.nix
    ./programs/cava.nix
    #./programs/kew.nix
  ];

  home.username = "aog";
  home.homeDirectory = "/home/aog";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # CLI
    clock-rs
    kew
  ];

  programs.bash.enable = true;
  programs.git.enable = true;
}
