{pkgs, ...}: {
  home.packages = with pkgs; [
    texlive.combined.scheme-full
  ];

  programs.nixvim.plugins = {
    lsp.servers = {
      texlab.enable = true;
    };
    vimtex = {
      enable = true;
      texlivePackage = null;
    };
  };
}
