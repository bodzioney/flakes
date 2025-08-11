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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "git+https://git.lix.systems/lix-project/nixos-module?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    catppuccin,
    darwin,
    home-manager,
    lix,
    lix-module,
    nh,
    nixvim,
    nvfetcher,
    nixpkgs,
    ...
  } @ inputs: let
    generated = import ./_sources/generated.nix;
    pkgDir = ./pkgs;
    names = builtins.attrNames (builtins.readDir pkgDir);

    overlays = [
      (final: prev: {
        sources = generated {
          inherit (final) fetchurl fetchgit fetchFromGitHub dockerTools;
        };
      })
      (
        final: prev:
          builtins.listToAttrs (map
            (name: let
              pkg = import (pkgDir + "/${name}");
              override = builtins.intersectAttrs (builtins.functionArgs pkg) {
                vimUtils = final.vimUtils;
                source = prev.sources.${name} or null;
                sourcepkg = prev.${name} or null;
              };
            in {
              inherit name;
              value = final.callPackage pkg override;
            })
            names)
      )
      nh.overlays.default
      nvfetcher.overlays.default
    ];
  in {
    darwinConfigurations = {
      comp-3 = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {inherit inputs;};

        modules = [
          {
            nixpkgs = {
              inherit overlays;
              config.allowUnfree = true;
            };
          }
          ./modules/darwin
          lix-module.nixosModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ethan = {
              imports = [
                ./modules/home
                nixvim.homeModules.nixvim
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
  };
}
