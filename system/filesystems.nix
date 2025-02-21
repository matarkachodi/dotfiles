{
  # Configure Filesystems
  fileSystems = {
    # Root
    "/" = {
      device = "/dev/disk/by-label/NIXOS";
      fsType = "ext4";
    };

    # Boot
    "/boot" = {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    # Home
    "/home" = {
      device = "/dev/disk/by-label/HOME";
      fsType = "ext4";
    };
  };
}
