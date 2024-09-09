# Live ISOs for COSMIC on NixOS

This flake builds NixOS ISOs containing the COSMIC desktop, based on [nixos-cosmic](https://github.com/lilyinstarlight/nixos-cosmic).

## Build instructions

This flake produces 3 live ISOs running NixOS + COSMIC:

- cosmicIso
- cosmicIso-edge (latest kernel)
- cosmixIso-vm (for virtual machines)

To build, navigate to this directory and run:

```nix
nix  --experimental-features 'nix-command flakes' build .#nixosConfigurations.cosmicIso.config.system.build.isoImage
```

To build an image with the latest kernel:

```nix
nix  --experimental-features 'nix-command flakes' build .#nixosConfigurations.cosmicIso-edge.config.system.build.isoImage
```

And so on. ISO will be available in `result/iso/`.
