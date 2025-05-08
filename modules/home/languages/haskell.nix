{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers.hls = {
    # Enable if language server is found
    enable = pkgs ? haskell-language-server;
    package = null;
    installGhc = false;
    extraOptions = {
      filetypes = [
        "haskell"
        "lhaskell"
        "cabal"
      ];
      settings = {
        haskell = {
          formattingProvider = "fourmolu";
        };
      };
    };
  };
}
