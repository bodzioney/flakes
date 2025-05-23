{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    cachix
    nil
    nix-tree
    nixfmt-rfc-style
    nixpkgs-review
    nh
    nurl
  ];

  programs.nixvim.plugins.lsp.servers.nil_ls = {
    enable = true;
  };
}
