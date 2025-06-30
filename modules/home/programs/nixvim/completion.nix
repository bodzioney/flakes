{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.blink-cmp-latex
    ];
    plugins = {
      blink-ripgrep.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            "<C-e>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<C-x>" = [
              "hide"
              "fallback"
            ];
            "<CR>" = [
              "accept"
              "fallback"
            ];
            "<Tab>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
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
                  insert_command = false;
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
