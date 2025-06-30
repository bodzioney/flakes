{pkgs, ...}: {
  home.packages = with pkgs; [
    tex-fmt
    texlive.combined.scheme-full
    texpresso
  ];
  programs.nixvim.plugins = {
    lsp.servers = {
      texlab.enable = true;
    };
    texpresso.enable = true;
    vimtex = {
      enable = true;
      texlivePackage = null;
    };
  };
}
