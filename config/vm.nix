{pkgs, ...}: {
  services = {
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
