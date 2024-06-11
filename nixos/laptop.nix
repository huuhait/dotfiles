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
      amdvlk
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  services.xserver.videoDrivers = ["amdgpu"];
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelParams = [
    "video=DP-1:2560x1440@130"
    "video=DP-2:2560x1440@130"
  ];
}
