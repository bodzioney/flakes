{pkgs, ...}: {
  home.packages = with pkgs; [
    cabal-install
    ghc
    haskell-language-server
    fourmolu
  ];

  programs.nixvim.plugins.lsp.servers = {
    hls = {
      enable = true;
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
  };
}
