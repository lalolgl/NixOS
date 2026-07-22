{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake .";
    };

    interactiveShellInit = ''
      set -g fish_greeting "" # Отключаем приветствие Fish при запуске
    '';
  };
}
