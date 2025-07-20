_: {
  homebrew = {
    enable = true;
    global.autoUpdate = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    taps = [
      "d12frosted/emacs-plus"
    ];

    brews = [
      {
        name = "emacs-plus";
        args = [
          "with-no-frame-refocus"
          "with-savchenkovaleriy-big-sur-curvy-3d-icon"
        ];
        link = true;
      }
      "gmp"
      "pkgconf"
    ];

    casks = [
      "appcleaner"
      "blockblock"
      "discord"
      "element"
      "espanso"
      "firefox"
      "iina"
      "imazing"
      "ghostty"
      "knockknock"
      "languagetool-desktop"
      "lulu"
      "mullvad-vpn"
      "obs"
      "obsidian"
      "orbstack"
      "raycast"
      "spotify"
      "thorium"
      "transmission"
      "tunnelblick"
      "xld"
      "zed"
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
