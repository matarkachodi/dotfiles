{pkgs, ...}: {
  # Configure GTK
  gtk = {
    enable = true;
    font = {
      name = "Inter";
      package = pkgs.inter;
    };
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
  };
}
