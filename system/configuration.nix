{
  modulesPath,
  pkgs,
  user,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    # Include submodules
    ./hardware
    ./hyprland
    ./sddm
    ./android.nix
    ./boot.nix
    ./filesystems.nix
    ./fonts.nix
    ./localization.nix
    ./networking.nix
    ./rtkit.nix
    ./ssh.nix
  ];

  # Enable experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure Fish
  programs.fish = {
    enable = true;
  };

  # Define user account
  users.users.${user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = ["adbusers" "networkmanager" "wheel"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
