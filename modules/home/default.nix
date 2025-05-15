{pkgs, ...}: {
  imports = [
    ./languages
    ./programs
  ];

  home.stateVersion = "24.11";
  home.shell.enableFishIntegration = true;

  catppuccin = {
    flavor = "mocha";
    enable = true;
    mako.enable = false;
  };

  programs = {
    aria2.enable = true;
    bat.enable = true;
    btop.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
    };

    fd.enable = true;

    fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
        source ~/.orbstack/shell/init2.fish 2>/dev/null || :
        set -gx MANPAGER "nvim -c 'Man!'"
        set -gx MANWIDTH 999
      '';
      shellAbbrs = {
        rbld = "nh darwin switch ~/.config/nix";
        upgd = "nh darwin switch ~/.config/nix -u";
      };
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    git = {
      enable = true;
      extraConfig.init.defaultBranch = "main";
      lfs.enable = true;
      aliases = {
        root = "rev-parse --show-toplevel";
      };
    };

    helix.enable = true;

    home-manager.enable = true;

    lazygit.enable = true;

    opam = {
      enable = true;
    };

    pandoc.enable = true;
    ripgrep.enable = true;
    starship.enable = true;

    tmux = {
      enable = true;
      escapeTime = 0;
      focusEvents = true;
      keyMode = "vi";
      mouse = true;
      terminal = "screen-256color";
      shortcut = "Space";
      plugins = with pkgs.tmuxPlugins; [
        better-mouse-mode
        vim-tmux-navigator
        catppuccin
      ];
      extraConfig = ''
        unbind v
        unbind h
        unbind %
        unbind '"'
        bind v split-window -h -c "#{pane_current_path}"
        bind h split-window -v -c "#{pane_current_path}"
      '';
    };

    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
  };

  home.packages = with pkgs; [
    cmake
    coreutils
    curl
    #cvc4
    eprover
    ffmpeg
    gh
    gnupatch
    imagemagick
    jq
    marksman
    mas
    # racket-minimal
    tinymist
    treefmt
    typst
    vampire
    z3-tptp
  ];
}
