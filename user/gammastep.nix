{
  # Configure Gammastep
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    temperature = {
      day = 4500;
      night = 4500;
    };
  };
}
