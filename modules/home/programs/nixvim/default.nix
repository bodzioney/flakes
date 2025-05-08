{...}: {
  imports = [
    ./completion.nix
    ./conform.nix
    ./editor.nix
    ./keys.nix
    ./lsp.nix
    ./ui.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      # Change leader to space
      mapleader = " ";
      maplocalleader = " ";
      # Have nerd font
      have_nerd_font = true;
    };

    opts = {
      # Relative number
      number = true;
      relativenumber = true;

      # Autoindenting
      autoindent = true;

      # Better completions
      completeopt = ["menuone" "noselect" "noinsert"];

      # Mouse mode on
      mouse = "a";

      # Don't need this
      showmode = false;

      breakindent = true;

      undofile = true;

      # Case insensitive search
      ignorecase = true;
      smartcase = true;

      signcolumn = "yes";

      # Shorter update time
      updatetime = 100;

      # Decrease mapped sequence wait
      timeoutlen = 300;

      # Split defaults
      splitright = true;
      splitbelow = true;

      # Show whitespace chars
      list = true;

      # Share Clipboard
      clipboard = "unnamedplus";

      # Tabs
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;

      # Live sub previews
      inccommand = "split";

      # Shows line number of cursor
      cursorline = true;

      # Lines to keep above or below cursor
      scrolloff = 5;

      # Enable Confirmation
      confirm = true;

      # Enable hlsearch
      hlsearch = true;

      # Conceal level
      conceallevel = 2;

      # Unicode
      encoding = "utf-8";
      fileencoding = "utf-8";
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    performance.byteCompileLua.enable = true;
  };
}
