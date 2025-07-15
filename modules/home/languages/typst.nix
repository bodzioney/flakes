{...}: {
  programs.nixvim.plugins = {
    lsp.servers = {
      tinymist.enable = true;
    };
    typst-vim = {
      enable = true;
      settings = {
        conceal = 1;
      };
    };
  };
}
