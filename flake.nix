{
  description = "Configurations of Aylur";

  outputs = inputs @ {
    self,
    home-manager,
    nix-darwin,
    nixpkgs,
    ...
  }: {
    # nixos config
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;
        };
        modules = [
          ./nixos/nixos.nix
          home-manager.nixosModules.home-manager
          {
            networking = {
              hostName = "nixos";
              nameservers = [
                "1.1.1.1"
                "1.0.0.1"
              ];
            };
          }
        ];
      };
    };

    # macos
    darwinConfigurations = {
      "macos" = nix-darwin.lib.darwinSystem {
        modules = [
          ./macos/macos.nix
          home-manager.darwinModules.home-manager
          (let
            username = "huuhait";
          in {
            users.users.${username} = {
              name = username;
              home = "/Users/${username}";
            };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users."${username}" = {
                home.username = username;
                home.homeDirectory = "/Users/${username}";
                imports = [./macos/home.nix];
              };
            };
            networking = {
              hostName = "macos";
              computerName = "macos";
            };
          })
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen.url = "github:InioX/matugen?ref=v2.2.0";
    astal.url = "github:Aylur/astal";

    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
  };
}
