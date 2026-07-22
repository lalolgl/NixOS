{ pkgs, ... }:

{
  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      general = {
        framerate = 120;
        sensitivity = 150;
      };

      output = {
        channels = "mono";
        mono_option = "left";
        reverse = 0;
      };

      color = {
        background = "'#111111'";
        foreground = "'#FF005C'";
      };
    };
  };
}
