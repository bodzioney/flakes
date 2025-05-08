{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    rust-analyzer
    rustc
    rustfmt
  ];

  programs.nixvim.plugins.lsp.servers.rust_analyzer = {
    enable = true;
    package = null;
    installRustc = false;
    installCargo = false;
    installRustfmt = false;
  };
}
