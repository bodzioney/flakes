{
  lib,
  callPackage,
  vimUtils,
  sources,
  sourcepkg,
}: let
  pkgDir = ./.;
  names = builtins.attrNames (builtins.readDir pkgDir);
in
  lib.recurseIntoAttrs (
    sourcepkg
    // builtins.listToAttrs (map (
        name: let
          pkg = import (pkgDir + "/${name}");
          override = builtins.intersectAttrs (builtins.functionArgs pkg) {
            inherit (vimUtils) buildVimPlugin;
            source = sources.${name} or null;
          };
        in {
          inherit name;
          value = callPackage pkg override;
        }
      )
      names)
  )
