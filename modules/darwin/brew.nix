_: {
  homebrew = {
    enable = true;
    global.autoUpdate = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    brews = [
      "gmp"
      "pkgconf"
    ];

    casks = [
      "appcleaner"
      "discord"
      "element"
      "firefox"
      "iterm2"
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

    masApps = {
      Bitwarden = 1352778147;
      Slack = 803453959;
      Todoist = 585829637;
      Xcode = 497799835;
    };
  };
}
