{
  config,
  lib,
  ...
}: {
  # Configure Intel
  hardware.cpu.intel = {
    updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  # Configure TLP
  services.tlp = {
    enable = true;
    settings = {
      INTEL_GPU_MIN_FREQ_ON_AC = 800;
      INTEL_GPU_MIN_FREQ_ON_BAT = 800;
      INTEL_GPU_MAX_FREQ_ON_AC = 1000;
      INTEL_GPU_MAX_FREQ_ON_BAT = 1000;
      INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
      INTEL_GPU_BOOST_FREQ_ON_BAT = 1100;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
    };
  };
}
