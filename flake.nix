{
  description = "Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./pkgs) ];
      };
    in
    {
      packages.${system} = {
        default = pkgs.kew;
        kew = pkgs.kew;
      };

      nixosConfigurations.zephyrus = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          { nixpkgs.overlays = [ (import ./pkgs) ]; }
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
