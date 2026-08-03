{ config, pkgs, ... }:

{
  imports = [
    ./programs/kitty.nix
    ./programs/fish.nix
    ./programs/cava.nix
  ];

  home.username = "aog";
  home.homeDirectory = "/home/aog";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    # CLI
    fish
    clock-rs
    anime4k
  ];

  programs.bash.enable = true;
  programs.git.enable = true;
}
