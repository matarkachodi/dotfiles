{lib, ...}: {
  # Configure Networking
  networking = {
    useDHCP = lib.mkDefault true;
    hostName = "marika";
    networkmanager = {
      enable = true;
    };
  };
}
