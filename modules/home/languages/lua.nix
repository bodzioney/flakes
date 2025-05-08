{pkgs, ...}: {
  home.packages = with pkgs; [
    lua54Packages.lua
    lua-language-server
    stylua
  ];

  programs.nixvim.plugins.lsp.servers.lua_ls = {
    enable = true;
    settings = {
      completion = {
        callSnippet = "Replace";
      };
    };
  };
}
