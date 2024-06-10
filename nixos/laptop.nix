{
  config,
  pkgs,
  ...
}: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  services.xserver.videoDrivers = ["amdgpu"];

  boot.kernelParams = [
    "video=DP-1:2560x1440@120"
    "video=DP-2:2560x1440@120"
  ];
}
