{...}: {
  programs.nixvim.plugins = {
    lazydev.enable = true;
    luasnip.enable = true;

    cmp = {
      enable = true;

      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };

        mapping = {
        };
        sources = [
          {
            name = "lazydev";
            group_index = 0;
          }
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "path";}
          {name = "nvim_lsp_signature_help";}
        ];
      };
    };
  };
}
