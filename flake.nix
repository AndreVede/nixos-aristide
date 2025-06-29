{
  description = "My light system to navigate easily. Aristide-on-road";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";


    pre-commit-hooks.url = "github:cachix/git-hooks.nix";


    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # SecureBoot support
    # lanzaboote.url = "github:nix-community/lanzaboote/master";

    # NixOS hardware quirks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nixos-hardware, ... }@inputs:
    let
      inherit (self) outputs;

      # Define user configurations
      users = {
        aristide = {
          # avatar = ./files/avatar/face;
          email = "mecazack@gmail.com";
          fullName = "Zacharie André Aristide Boisnard";
          # gitKey = "";
          name = "aristide";
        };
      };

      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };

      # Function for NixOS system configuration
      mkNixosConfiguration = hostname: username:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs hostname system;
            userConfig = users.${username};
            nixosModules = "${self}/modules/nixos";
          };

          modules = [
            ./hosts/${hostname}
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = {
                  inherit inputs outputs;
                  pkgs = import nixpkgs {
                    inherit system;

                    config = {
                      allowUnfree = true;
                    };
                  };

                  pkgs-unstable = import nixpkgs-unstable {
                    inherit system;

                    config = {
                      allowUnfree = true;
                    };
                  };

                  userConfig = users.${username};
                  nhModules = "${self}/modules/home-manager";
                };

                users.${username} = ./home/${username}/${hostname};
              };
            }
          ];
        };

      # Function for Home Manager configuration
      mkHomeConfiguration = system: username: hostname:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;

            config = {
              allowUnfree = true;
            };
          };

          pkgs-unstable = import nixpkgs-unstable {
            inherit system;

            config = {
              allowUnfree = true;
            };
          };


          extraSpecialArgs = {
            inherit inputs outputs;
            userConfig = users.${username};
            nhModules = "${self}/modules/home-manager";
          };

          modules = [
            ./home/${username}/${hostname}
          ];
        };
    in
    {
      check.${system} = {
        # Allow unfree packages in Nix config
        channels-config.allowUnfree = true;

        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
          };
        };
      };

      # Shell to build
      devShells.${system}.default = pkgs.mkShell {
        inherit (self.check.${system}.pre-commit-check) shellHook;
        buildInputs = [
          pkgs.nixos-rebuild
          self.check.${system}.pre-commit-check.enabledPackages
        ];
      };

      nixosConfigurations = {
        Aristide-on-road = mkNixosConfiguration "Aristide-on-road" "aristide";
      };

      # With this flake, you can now apply home-manager alone
      homeManagerConfigurations = {
        "aristide@Aristide-on-road" = mkHomeConfiguration "x86_64-linux" "aristide" "Aristide-on-road";
      };
    };
}
