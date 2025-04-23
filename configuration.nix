{pkgs, ...}: {
  imports = [
    ./brew.nix
  ];

  programs.fish = {
    enable = true;
  };

  users.users.ethan = {
    home = "/Users/ethan";
    shell = pkgs.fish;
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  environment = {
    shells = [pkgs.fish]; # Default shell
    variables = {
      # System variables
      SHELL = "${pkgs.fish}/bin/fish";
      EDITOR = "nvim";
      VISUAL = "nvim";
      HOMEBREW_PREFIX = "/opt/homebrew";
      HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
      HOMEBREW_REPOSITORY = "/opt/homebrew";
      HOMEBREW_SHELLENV_PREFIX = "/opt/homebrew";
    };
    systemPath = [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
    ];
  };

  services = {
    aerospace = import ./programs/aerospace.nix;
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 30d";
  };

  system.stateVersion = 6;
}
