{pkgs, ...}: {
  imports = [
    ./brew.nix
    ./programs
  ];

  programs.fish = {
    enable = true;
  };

  users.users.ethan = {
    home = "/Users/ethan";
    shell = pkgs.fish;
  };

  security.pam.services.sudo_local = {
    enable = true;
    reattach = true;
    touchIdAuth = true;
  };

  environment = {
    # Default shell
    shells = [pkgs.fish];
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

  fonts = {
    packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.monaspace
      jetbrains-mono
    ];
  };

  nix = {
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

    optimise.automatic = true;

    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 30d";
    };

    settings = {
      trusted-users = [
        "root"
        "ethan"
      ];
      trusted-public-keys = [
        "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      substituters = [
        "https://cachix.cachix.org"
        "https://nix-community.cachix.org"
      ];
    };
  };
  system = {
    primaryUser = "ethan";
    stateVersion = 6;
  };
}
