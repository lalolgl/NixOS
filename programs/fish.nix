{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "cd \"$HOME/.nixos\" && sudo nixos-rebuild switch --flake .";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
}
