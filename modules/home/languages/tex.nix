{pkgs, ...}: {
  home.packages = with pkgs; [
    ltex-ls-plus
    tex-fmt
    texlive.combined.scheme-full
  ];

  programs.nixvim.plugins = {
    lsp.servers = {
      texlab.enable = true;
      #ltex_plus = {
      #enable = true;
      #  package = null;
      #};
    };
    vimtex = {
      enable = true;
      texlivePackage = null;
    };
  };
}
