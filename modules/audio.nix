{ config, pkgs, lib, ... }:

{
  # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      #media-session.enable = true;
      extraConfig.pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.allowed-rates" = [
              # 44100
              48000
              96000
              # 384000
              # 768000
            ];
            "default.clock.rate" = 96000;
            "settings.check-rate" = true;
          };
        };
        "09-no-resample" = {
          "context.properties" = {
            "resample.disable" = true;
          };
        };
        "11-latency" = {
          "context.properties" = {
            "default.clock.quantum" = 256;
            "default.clock.min-quantum" = 128;
            "default.clock.max-quantum" = 512;
          };
        };
      };
    };
}
