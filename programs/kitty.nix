{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 12;
      shell = "${pkgs.fish}/bin/fish";
    };
  };
}
