{pkgs, ...}: {
  # packages
  environment.systemPackages = with pkgs; [
    neovim
    git
    bat
    fd
    ripgrep
    fzf
    nushell
    tmux
  ];

  homebrew = {
    enable = true;
    casks = [
      "wezterm"
      "google-chrome"
      "keepassxc"
    ];
  };

  environment.etc."paths.d/20-nix" = {
    text = "
      /run/current-system/sw/bin
      /nix/var/nix/profiles/default/bin
    ";
  };

  # fonts
  fonts = {
    fontDir.enable = true;
    fonts = [
      (pkgs.nerdfonts.override {
        fonts = [
          "Ubuntu"
          "UbuntuMono"
          "CascadiaCode"
        ];
      })
    ];
  };

  # nix
  programs.zsh.enable = true;
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 4;
  nixpkgs.hostPlatform = "x86_64-darwin";
}
