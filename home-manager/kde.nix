{ pkgs, ... }:
{
  programs.autorandr = {
    enable = true;
  }

  programs.plasma = {
    enable = true;

    fonts = {
      general = {
        family = "UbuntuMono";
        pointSize = 12;
      };
    };

  };
}
