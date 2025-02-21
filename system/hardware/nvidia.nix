{
  # Configure Graphics
  hardware.graphics = {
    enable = true;
  };

  # Load Nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  # Configure Nvidia
  hardware.nvidia = {
    open = false;
    nvidiaSettings = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
    modesetting = {
      enable = true;
    };
  };
}
