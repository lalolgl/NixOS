{ config, pkgs, ... }:

{
  imports = [
    ./programs/kitty.nix
    ./programs/fish.nix
    ./programs/cava.nix
  ];

  home.username = "aog";
  home.homeDirectory = "/home/aog";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # CLI
    neovim
    fish
    clock-rs
    anime4k
  ];

  programs.bash.enable = true;
  programs.git.enable = true;
}
