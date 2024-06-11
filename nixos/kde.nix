{
  pkgs,
  ...
}: {
  services = {
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
  };

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [];
  };
}
