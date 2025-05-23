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
      "espanso"
      "firefox"
      "iterm2"
      "ghostty"
      "mullvadvpn"
      "obs"
      "orbstack"
      "raycast"
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
