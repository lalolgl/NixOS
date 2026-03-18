{ config, pkgs, lib,  ...}:

{
  # Allow the installation of unknown apps
  nixpkgs.config.allowUnfree = true;

  #nixpkgs.config.permittedInsecurePackages = [];

  environment.systemPackages = with pkgs; [
    # Info system
    fastfetch
    resources

    # VPN
    xray
    tun2proxy

    # Security
    #opensnitch
    #opensnitch-ui
    #clamav
    #clamtk
    tor

    # Mail
    #thunderbird

    # Music
    spotify
    feishin
    amberol
    termusic
    eartag

    # Pipewire utils
    helvum
    easyeffects

    # Browsers
    #vivaldi
    #vivaldi-ffmpeg-codecs
    librewolf
    tor-browser

    # Games
    steam
    cartridges
    osu-lazer-bin
    prismlauncher
    moonlight-qt

    # Launchers
    #heroic-unwrapped
    #hydralauncher
    (pkgs.bottles.override {
      removeWarningPopup = true;
    })

    # Game opimisation
    gamescope
    gamemode

    # Wine
    wine64
    winetricks
    protontricks

    # Messenger
    signal-desktop
    vesktop

    # AI
    upscayl
    ollama-cuda

    # Office
    onlyoffice-desktopeditors
    typst
    gnome-frog

    # Development
    git
    github-desktop
    zed-editor
    vscode
    #figma-linux
    #android-studio
    #nil
    #nixd
    #nodejs
    #python3
    #python3Packages.pip

    # Containers
    dtop

    # CLI
    cmatrix
    cava
    btop
    wavemon
    duf
    fd
    #blobdrop
    yt-dlp
    speedtest-cli
    p7zip
    you-get
    ffmpeg
    #ventoy
    nmap
    #john
    #aircrack-ng

    # Themes
    adwaita-qt
    adw-gtk3
    whitesur-icon-theme

    # Other
    localsend
    keepassxc
    remmina
    qbittorrent
    obsidian
    krita
    obs-studio
    blender
    audacity
    vlc
    mpv
    rquickshare
    alacritty

    # Constraints
    cudaPackages.cudatoolkit
    #mbedtls
    usbutils
    #bluez
    kitty # GPU based terminal emulator

    # Gnome Extensions
    gnome-tweaks
    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
    #Style
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.wiggle
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash2dock-lite
    gnomeExtensions.logo-menu
    gnomeExtensions.top-bar-organizer
    gnomeExtensions.ollama-indicator
    #Other
    gnomeExtensions.gsconnect
    gnomeExtensions.do-not-disturb-while-screen-sharing-or-recording
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.spotify-tray
    gnomeExtensions.mute-spotify-ads
    gnomeExtensions.bluetooth-battery
    gnomeExtensions.bluetooth-quick-connect
    gnomeExtensions.battery-time-3
    gnomeExtensions.vitals
    #gnomeExtensions.wifi-signal-plus
    gnomeExtensions.weather-oclock
    gnomeExtensions.wallpaper-slideshow
    gnomeExtensions.easyeffects-preset-selector
    gnomeExtensions.gamemode-shell-extension

    # Style
    fuzzel # Wayland-native application launcher
    waybar #
    mako # Lightweight Wayland notification daemon
  ];

  # Activation apps
  programs.niri.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.nix-ld.enable = true;
  fonts.fontconfig.enable = true;
}
