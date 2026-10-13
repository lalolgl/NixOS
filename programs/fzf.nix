{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    defaultCommand =
      "${pkgs.fd}/bin/fd --type f --hidden --exclude .git";

    defaultOptions = [
      "--height=40%"
      "--layout=reverse"
      "--border"
      "--info=inline"
    ];

    fileWidgetCommand =
      "${pkgs.fd}/bin/fd --type f --hidden --exclude .git";

    fileWidgetOptions = [
      "--preview '${pkgs.bat}/bin/bat --color=always --style=numbers --line-range=:300 {}'"
      "--preview-window=right:60%:wrap"
    ];

    changeDirWidgetCommand =
      "${pkgs.fd}/bin/fd --type d --hidden --exclude .git";
  };
}
