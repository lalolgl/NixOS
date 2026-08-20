{ config, pkgs, ... }:

{
  imports = [
    ./programs/kitty.nix
    ./programs/fish.nix
    ./programs/cava.nix
    ./programs/clipse.nix
  ];

  home.username = "aog";
  home.homeDirectory = "/home/aog";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fish
    clock-rs # TUI clock
    cava # audio visualizer
    anime4k

    clipse # clipboard manager
    sshm # SSH manager
    duf # Disk usage
    fd # Find
    wavemon # Network monitoring
    #jocalsend # Terminal client for Localsend

    maigret # OSINT scanner
    john # Password cracking
    aircrack-ng # WiFi cracking
    bbot # multipurpose scanner
  ];

  programs.bash.enable = true;
  programs.git.enable = true;
}
