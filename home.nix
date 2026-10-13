{ config, pkgs, ... }:

{
  imports = [
    ./programs/kitty.nix
    ./programs/fish.nix
    ./programs/cava.nix
    ./programs/clipse.nix
    ./programs/fzf.nix
    ./programs/bat.nix
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
    wl-clipboard # Wayland clipboard utilities

    sshm # SSH manager
    duf # Disk usage
    fd # Find
    fzf
    bat
    ripgrep
    wavemon # Network monitoring
    #jocalsend # Terminal client for Localsend

    maigret # OSINT scanner
    maltego # OSINT scanner
    john # Password cracking
    aircrack-ng # WiFi cracking
    airgeddon # Audit wireless networks
    hashcat # Fast password cracker
    tcpdump # Packet capture
    bbot # multipurpose scanner
  ];

  programs.bash.enable = true;
  programs.git.enable = true;
}
