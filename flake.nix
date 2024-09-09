{
  description = "Live environment for nixos-cosmic.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    accept-flake-config = true;

    extra-substituters = [
      "https://cosmic.cachix.org/"
    ];

    extra-trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    ];
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      cosmicIso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./config
          self.inputs.nixos-cosmic.nixosModules.default
        ];
      };

      cosmicIso-edge = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./config
          ./config/edge-linux.nix
          self.inputs.nixos-cosmic.nixosModules.default
        ];
      };

      cosmicIso-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./config
          ./config/vm.nix
          self.inputs.nixos-cosmic.nixosModules.default
        ];
      };
    };
  };
}
