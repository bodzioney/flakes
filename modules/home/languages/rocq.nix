{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.Coqtail
    ];

    plugins.lsp.servers.coq_lsp = {
      enable = true;
      package = null;
    };
  };
}
