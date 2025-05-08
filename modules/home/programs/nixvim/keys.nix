{...}: {
  programs.nixvim = {
    keymaps = [
      # Disable Arrow Keys
      {
        mode = "n";
        key = "<Left>";
        action = "<Nop>";
      }
      {
        mode = "n";
        key = "<Right>";
        action = "<Nop>";
      }
      {
        mode = "n";
        key = "<Up>";
        action = "<Nop>";
      }
      {
        mode = "n";
        key = "<Down>";
        action = "<Nop>";
      }
      # Clear highlights on search when pressing <Esc> in normal mode
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
    ];

    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    autoCmd = [
      # Highlight when yanking (copying) text
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];

    plugins = {
      tmux-navigator.enable = true;

      which-key = {
        enable = true;
        settings = {
          spec = [
            {
              __unkeyed-1 = "<leader>c";
              group = "[C]ode";
            }
            {
              __unkeyed-1 = "<leader>d";
              group = "[D]ocument";
            }
            {
              __unkeyed-1 = "<leader>r";
              group = "[R]ename";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "[S]earch";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "[W]orkspace";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = "[T]oggle";
            }
            {
              __unkeyed-1 = "<leader>h";
              group = "Git [H]unk";
              mode = [
                "n"
                "v"
              ];
            }
          ];
        };
      };
    };
  };
}
