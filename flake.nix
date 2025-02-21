{
  # Description
  description = "NixOS Configuration";

  # Inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Outputs
  outputs = {
    self,
    nixpkgs,
    home-manager,
    pre-commit-hooks,
    firefox-addons,
  } @ inputs: let
    # System architecture
    system = "x86_64-linux";

    # User account name
    user = "marika";

    # Pre-commit check
    pre-commit-check = pre-commit-hooks.lib.${system}.run {
      src = ./.;
      hooks = {
        typos.enable = true;
        alejandra.enable = true;
      };
    };
  in {
    # Set NixOS configuration for the host
    nixosConfigurations.home = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs system user;};
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs system user;};
            users.${user} = import ./user/home.nix;
          };
        }
      ];
    };

    # Checks
    checks.${system} = {
      inherit pre-commit-check;
    };

    # Devshells
    devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
      name = "dotfiles";
      shellHook = pre-commit-check.shellHook;
      buildInputs = pre-commit-check.enabledPackages;
    };
  };
}
