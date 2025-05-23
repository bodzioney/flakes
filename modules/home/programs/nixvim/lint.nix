{pkgs, ...}: {
  home.packages = with pkgs; [
    hlint
    nodePackages.jsonlint
    vale
  ];
  programs.nixvim = {
    autoGroups = {
      "lint" = {
        clear = true;
      };
    };

    plugins = {
      lint = {
        enable = true;
        autoCmd = {
          callback.__raw = ''
            function()
              require('lint').try_lint()
            end
          '';
          event = ["BufEnter" "BufWritePost" "InsertLeave"];
          group = "lint";
        };
        lintersByFt = {
          haskell = [
            "hlint"
          ];
          json = [
            "jsonlint"
          ];
          markdown = [
            "vale"
          ];
          nix = [
            "nix"
          ];
          text = [
            "vale"
          ];
        };
      };
    };
  };
}
