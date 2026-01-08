{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Allow the installation of unknown apps
  nixpkgs.config.allowUnfree = true;

  #nixpkgs.config.permittedInsecurePackages = [];

  environment.systemPackages = with pkgs; [
    # Info system
    neofetch
    fastfetch
    resources

    # VPN
    xray
    tun2proxy

    # Security
    libfprint-2-tod1-goodix
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
    (pkgs.bottles.override {
      removeWarningPopup = true;
    })

    # Game opimisation
    gamescope
    gamemode

    # Wine
    wine64
    winetricks

    # Messenger
    signal-desktop
    vesktop

    # AI
    upscayl
    ollama-cuda

    # Virtualisation

    # Development
    git
    zed-editor
    vscode
    #figma-linux
    #android-studio
    gnome-frog
    nil
    nixd
    #nodejs
    #python3
    #python3Packages.pip

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
    onlyoffice-desktopeditors
    obsidian
    krita
    obs-studio
    blender
    audacity
    vlc
    mpv
    rquickshare

    # Constraints
    cudaPackages.cudatoolkit
    #mbedtls
    usbutils
    #bluez

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
    #Other
    gnomeExtensions.gsconnect
    gnomeExtensions.do-not-disturb-while-screen-sharing-or-recording
    gnomeExtensions.clipboard-indicator
    #gnomeExtensions.spotify-tray
    gnomeExtensions.bluetooth-battery
    gnomeExtensions.bluetooth-quick-connect
    gnomeExtensions.battery-health-charging
    gnomeExtensions.battery-time-3
    gnomeExtensions.vitals
    gnomeExtensions.weather-oclock
    gnomeExtensions.wallpaper-slideshow
    gnomeExtensions.easyeffects-preset-selector
    gnomeExtensions.gamemode-shell-extension
  ];

  # Activation apps
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.nix-ld.enable = true;
  fonts.fontconfig.enable = true;

}
