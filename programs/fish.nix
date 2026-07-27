{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "cd \"$HOME/.nixos\" && sudo nixos-rebuild switch --flake .";
      clean = "cd \"$HOME/.nixos\" && sudo nix-collect-garbage -d";
    };

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };
}
