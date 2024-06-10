{inputs, ...}: {
  home = {
    sessionVariables = {
      BROWSER = "google-chrome";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs."google-chrome" = {
    enable = true;
  };
}
