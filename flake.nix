{
  description = "Nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    catppuccin.url = "github:catppuccin/nix";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    catppuccin,
    darwin,
    home-manager,
    nh,
    nixvim,
    nixpkgs,
    ...
  } @ inputs: let
    nixpkgsConfig = {
      config.allowUnfree = true;
    };
  in {
    darwinConfigurations = {
      comp-3 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = {inherit inputs;};

        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            nixpkgs = {
              inherit (nixpkgsConfig) config;
              overlays = [
                nh.overlays.default
              ];
            };

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ethan = {
              imports = [
                ./home.nix
                nixvim.homeManagerModules.nixvim
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
  };
}
