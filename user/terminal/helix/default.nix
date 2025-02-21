{pkgs, ...}: {
  # Configure Helix
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [nixd];
    ignores = [
      "!.gitignore"
    ];
  };
}
