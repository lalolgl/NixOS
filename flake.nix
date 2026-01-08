{
  description = "Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvirt = {
         url = "https://flakehub.com/f/AshleyYakeley/NixVirt/*.tar.gz";
         inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvirt, ... }: {
    nixosConfigurations.zephyrus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        nixvirt.nixosModules.default
      ];
    };
  };
}
