{
  # Configure Git
  programs.git = {
    enable = true;
    userName = "matarkachodi";
    userEmail = "matarkachodi@gmail.com";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFw38dpq38o/xoXz2cYV8tp6EMFoof3r+R6xTTeAv/JW";
      format = "ssh";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
    };
  };
}
