{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 14;
      shell = "${pkgs.fish}/bin/fish";

      # Background / foreground
      background = "#0D0D0D";
      foreground = "#E6E6E6";
      cursor = "#FFFFFF";
      cursor_text_color = "#0D0D0D";
      selection_background = "#333333";
      selection_foreground = "#FFFFFF";

      # Window padding
      window_padding_width = 12;
      window_padding_height = 10;

      # ANSI — monochrome
      color0 = "#0D0D0D";
      color1 = "#666666";
      color2 = "#888888";
      color3 = "#999999";
      color4 = "#777777";
      color5 = "#888888";
      color6 = "#AAAAAA";
      color7 = "#D0D0D0";

      color8 = "#444444";
      color9 = "#777777";
      color10 = "#999999";
      color11 = "#AAAAAA";
      color12 = "#999999";
      color13 = "#AAAAAA";
      color14 = "#BBBBBB";
      color15 = "#FFFFFF";
    };
  };
}
