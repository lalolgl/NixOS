{ pkgs, ... }:

{
  programs.cava = {
    enable = true;
    package = pkgs.cava;
    settings = {
      general = {
        framerate = 180;
        sensitivity = 150;
        fft_size = 32768;
        smoothing = 0.85;
        noise_reduction = 0.77;
        gravity = 100;
      };

      input = {
        method = "pipewire";
        source = "auto";
      };

      output = {
        channels = "mono";
        mono_option = "left";
        reverse = 0;
      };

      color = {
        background = "'#0D0D0D'";
        foreground = "'#E6E6E6'";
      };
    };
  };
}
