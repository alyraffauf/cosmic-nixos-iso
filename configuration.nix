{
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-base.nix")
  ];

  # Enable plymouth
  boot.plymouth.enable = true;

  environment.defaultPackages = with pkgs; [
    firefox
    git
    gparted
    nano
    rsync
    vim
  ];

  hardware.pulseaudio.enable = lib.mkForce false; # Pipewire complains if not force disabled.

  # Provide networkmanager for easy wireless configuration.
  networking = {
    networkmanager.enable = true;
    wireless.enable = lib.mkImageMediaOverride false;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://cosmic.cachix.org/"];
    trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
  };

  powerManagement.enable = true;

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    xe-guest-utilities.enable = pkgs.stdenv.hostPlatform.isx86;
  };

  virtualisation = {
    vmware.guest.enable = pkgs.stdenv.hostPlatform.isx86;
    hypervGuest.enable = true;
    virtualbox.guest.enable = false;
  };
}
