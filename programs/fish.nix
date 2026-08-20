{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "cd \"$HOME/.nixos\" && sudo nix flake update && sudo nixos-rebuild switch --flake .";
      clean = "cd \"$HOME/.nixos\" && sudo nix-collect-garbage -d";
    };

    interactiveShellInit = ''
      # Fish shell configuration
      set -g fish_greeting ""

      # Generate sshm completion if not present
      if type -q sshm
        and not test -f ~/.config/fish/completions/sshm.fish
        sshm --completion fish > ~/.config/fish/completions/sshm.fish
      end
    '';
  };
}
