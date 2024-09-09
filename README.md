# Live ISOs for COSMIC on NixOS

This flake builds NixOS ISOs containing the COSMIC desktop, based on nixos-cosmic.

## Build instructions

```nix
nix build .#nixosConfigurations.cosmicIso.config.system.build.isoImage
```

ISO will be available in `result/iso/`.
