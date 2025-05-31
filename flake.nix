{
  description = "My light system to navigate easily. Aristide-on-road";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixpkgs.unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };
    in
    {
      check.${system} = {
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

      #nixosConfigurations = {
      # replace with hostname
      #  Aristide-on-road = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs system; };
      #  modules = [
      #   ./nixos/configuration.nix
      #];
      #};
      #};

      # With this flake, you can now apply home-manager alone
      #homeManagerConfigurations = {
      # replace with username
      #  aristide = home-manager.lib.homeManagerConfiguration {
      #    inherit pkgs;
      #   modules = [
      #    ./home-manager/home.nix
      #  ];
      #};
      #};
    };
}
