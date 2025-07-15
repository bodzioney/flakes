{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./languages
    ./programs
  ];

  home = {
    stateVersion = "24.11";
    shell.enableFishIntegration = true;
  };

  xdg.enable = true;

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

    eza.enable = true;

    fd.enable = true;

    fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
        source ~/.orbstack/shell/init2.fish 2>/dev/null || :
        set -g fish_key_bindings fish_vi_key_bindings

        set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
      '';
      shellAbbrs = {
        nrb = "nh darwin switch ~/.config/nix";
        nup = "nh darwin switch ~/.config/nix -u";
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

    helix = {
      enable = true;
      settings = {
        editor = {
          auto-format = true;
          auto-completion = true;
          bufferline = "multiple";
          color-modes = true;
          line-number = "relative";
          lsp = {
            display-messages = true;
            display-inlay-hints = true;
            display-signature-help-docs = true;
          };
        };
      };

      languages = {
        language = [
          {
            name = "rust";
            auto-format = true;
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = lib.getExe pkgs.alejandra;
          }
        ];
      };
    };

    home-manager.enable = true;

    lazygit.enable = true;

    opam.enable = true;
    pandoc.enable = true;
    ripgrep.enable = true;
    ripgrep-all.enable = true;

    spotify-player = {
      enable = true;
    };

    starship.enable = true;

    tmux = {
      enable = true;
      escapeTime = 0;
      focusEvents = true;
      keyMode = "vi";
      mouse = true;
      terminal = "tmux-256color";
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

        set -g allow-passthrough on
        set -ga update-environment TERM
        set -ga update-environment TERM_PROGRAM
      '';
    };

    yazi = {
      enable = true;
    };

    zellij = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
      };
    };

    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
  };

  home.packages = with pkgs; [
    clamav
    cmake
    coreutils
    curl
    #cvc4
    delta
    eprover
    ffmpeg
    fontconfig
    gh
    glow
    gnupatch
    haskellPackages.nvfetcher
    imagemagick
    jq
    marksman
    mas
    racket-minimal
    shellcheck
    shfmt
    spotify-player
    tinymist
    treefmt
    typst
    vampire
    wiki-tui
    yt-dlp
    z3-tptp
  ];
}
