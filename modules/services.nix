{ config, pkgs, lib, ... }:

{
  # Gaming mice interface
    services.ratbagd.enable = true;

  # OpenRGB
  #services.hardware.openrgb.enable = true;

  # Ollama
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };
}
