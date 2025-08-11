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
      "blender"
      "blockblock"
      "element"
      "espanso"
      "iina"
      "imazing"
      "ghostty"
      "knockknock"
      "languagetool-desktop"
      "lulu"
      "mullvad-vpn"
      "obs"
      "orbstack"
      "raycast"
      "spotify"
      "thorium"
      "transmission"
      "tunnelblick"
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
