_: {
  homebrew.enable = true;
  homebrew.global.autoUpdate = true;
  homebrew.onActivation = {
    autoUpdate = true;
    upgrade = true;
    cleanup = "uninstall";
  };

  homebrew.brews = [
    "gmp"
    "minimal-racket"
    "pkgconf"
  ];

  homebrew.casks = [
    "appcleaner"
    "discord"
    "mullvadvpn"
    "obs"
    "orbstack"
    "raycast"
    "spotify"
    "transmission"
    "tunnelblick"
    "zoom"
    "zotero"
    "zulip"
  ];
}
