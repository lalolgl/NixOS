{ pkgs, ... }:

{
  home.packages = [ pkgs.clipse ];

  home.file.".config/clipse/config.json".text = builtins.toJSON {
    allowDuplicates = false;
    historyFile = "clipboard_history.json";
    maxHistory = 100;
    deleteAfter = 0;
    logFile = "clipse.log";
    pollInterval = 50;
    maxEntryLength = 65;
    themeFile = "custom_theme.json";
    tempDir = "tmp_files";
    keyBindings = {
      choose = "enter";
      clearSelected = "S";
      down = "down";
      end = "end";
      filter = "/";
      forceQuit = "Q";
      home = "home";
      more = "?";
      nextPage = "right";
      prevPage = "left";
      preview = "space";
      quit = "esc";
      remove = "backspace";
      selectDown = "shift+down";
      selectSingle = "s";
      selectUp = "shift+up";
      togglePin = "p";
      togglePinned = "tab";
      up = "up";
      yankFilter = "ctrl+s";
    };
    imageDisplay = {
      type = "basic";
      scaleX = 9;
      scaleY = 9;
      heightCut = 2;
    };
    excludedApps = [
      "1Password"
      "Bitwarden"
      "KeePassXC"
      "LastPass"
      "Dashlane"
      "Password Safe"
      "Keychain Access"
    ];
    autoPaste = {
      enabled = false;
      keybind = "ctrl+v";
      buffer = 10;
    };
    enableMouse = true;
    enableDescription = true;
  };


  home.file.".config/clipse/custom_theme.json" = {
    force = true;
    text = builtins.toJSON {
      "useCustom" = true;

      # Main title
      TitleFore = "#E6E6E6";
      TitleBack = "#0D0D0D";
      TitleInfo = "#A6A6A6";

      # Clipboard entries
      NormalTitle = "#E6E6E6";
      DimmedTitle = "#888888";
      SelectedTitle = "#FFFFFF";
      NormalDesc = "#A6A6A6";
      DimmedDesc = "#666666";
      SelectedDesc = "#E6E6E6";

      # Status and pins
      StatusMsg = "#E6E6E6";
      PinIndicatorColor = "#FFFFFF";

      # Borders
      SelectedBorder = "#333333";
      SelectedDescBorder = "#333333";
      PreviewBorder = "#333333";

      # Search and filtering
      FilteredMatch = "#FFFFFF";
      FilterPrompt = "#E6E6E6";
      FilterInfo = "#A6A6A6";
      FilterText = "#FFFFFF";
      FilterCursor = "#FFFFFF";

      # Help
      HelpKey = "#E6E6E6";
      HelpDesc = "#888888";

      # Pagination and separators
      PageActiveDot = "#FFFFFF";
      PageInactiveDot = "#333333";
      DividerDot = "#333333";

      # Preview
      PreviewedText = "#E6E6E6";
    };
  };


  # Clear unpinned Clipse history when the Niri session ends.
  systemd.user.services.clipse-history-cleanup = {
    Unit = {
      Description = "Clear unpinned Clipse history when Niri exits";
      PartOf = [ "niri.service" ];
      Before = [ "niri.service" ];
    };

    Service = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.coreutils}/bin/true";
      ExecStop = "${pkgs.clipse}/bin/clipse -clear";
    };

    Install.WantedBy = [ "niri.service" ];
  };
}
