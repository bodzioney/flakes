{pkgs, ...}: {
  programs.nixvim = {
    plugins.lsp.servers.coq_lsp = {
      enable = true;
      package = null;
    };

    extraPlugins = [pkgs.vimPlugins.Coqtail];
  };
}
