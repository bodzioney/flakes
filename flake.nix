{
  description = "Nix-darwin system flake";

  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixpkgs-unstable";

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
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
    emacs,
    home-manager,
    lix,
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
          ./modules/darwin
          lix.nixosModules.default
          home-manager.darwinModules.home-manager
          {
            nixpkgs = {
              inherit (nixpkgsConfig) config;
              overlays = [
                nh.overlays.default
                emacs.overlays.default
              ];
            };

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ethan = {
              imports = [
                ./modules/home
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
