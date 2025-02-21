{
  # Configure Time
  time = {
    timeZone = "Asia/Kolkata";
  };

  # Configure Internationalization Properties
  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  # Configure Location
  location = {
    provider = "geoclue2";
  };

  # Configure Geoclue
  services.geoclue2 = {
    enable = true;
    submissionUrl = "https://beacondb.net/v2/geosubmit";
    geoProviderUrl = "https://beacondb.net/v1/geolocate";
    submissionNick = "geoclue";
    appConfig.gammastep = {
      isAllowed = true;
      isSystem = false;
    };
  };
}
