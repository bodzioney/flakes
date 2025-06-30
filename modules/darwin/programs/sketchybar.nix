{pkgs, ...}: {
  homebrew = {
    casks = [
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "font-sketchybar-app-font"
    ];
  };

  services.sketchybar = {
    enable = true;
    extraPackages = [
      pkgs.aerospace
    ];
  };
}
