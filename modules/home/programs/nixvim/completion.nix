{...}: {
  programs.nixvim.plugins = {
    coq-nvim = {
      enable = true;
      installArtifacts = true;
      settings = {
        auto_start = "shut-up";
      };
    };

    coq-thirdparty = {
      enable = true;
      sources = [
        {
          short_name = "nLUA";
          src = "nvimlua";
        }
      ];
    };
  };
}
