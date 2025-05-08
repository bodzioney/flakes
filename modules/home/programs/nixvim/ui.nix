{...}: {
  programs.nixvim.plugins = {
    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
      };
    };

    mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
        };
        surround = {};
        statusline = {
          use_icons = true;
        };
      };
    };

    todo-comments.enable = true;

    web-devicons.enable = true;
  };
}
