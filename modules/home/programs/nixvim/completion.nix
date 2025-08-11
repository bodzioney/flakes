{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.blink-cmp-latex
      pkgs.vimPlugins.luasnip-latex-snippets-nvim
    ];
    plugins = {
      blink-ripgrep.enable = true;
      luasnip.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          completion = {
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;

              window = {
                border = "rounded";
              };
            };
            ghost_text = {
              enabled = true;
            };

            list = {
              selection = {
                auto_insert = true;
                preselect = true;
              };
            };

            trigger = {
              show_on_accept_on_trigger_character = true;
              show_on_keyword = true;
              show_on_trigger_character = true;
            };
          };
          keymap = {
            preset = "super-tab";
          };
          signature = {
            enabled = true;

            window = {
              border = "rounded";
            };
          };
          snippets = {
            preset = "luasnip";
          };

          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
              "ripgrep"
              "latex"
            ];
            providers = {
              latex = {
                name = "Latex";
                module = "blink-cmp-latex";
                opts = {
                  insert_command = true;
                };
              };
              ripgrep = {
                async = true;
                module = "blink-ripgrep";
                name = "Ripgrep";
                score_offset = 100;
                opts = {
                  prefix_min_len = 3;
                  context_size = 5;
                  max_filesize = "1M";
                  project_root_marker = ".git";
                  project_root_fallback = true;
                  search_casing = "--ignore-case";
                  additional_rg_options = {};
                  fallback_to_regex_highlighting = true;
                  ignore_paths = {};
                  additional_paths = {};
                  debug = false;
                };
              };
            };
          };
        };
      };
    };
  };
}
