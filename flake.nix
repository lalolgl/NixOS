{
  description = "Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations.zephyrus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        nixpkgs.overlays = [ (import ./pkgs/kew.nix).overlays ];
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.aog = ./home.nix;
          }
        ];
      };
    };
}
