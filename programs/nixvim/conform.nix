{pkgs, ...}: {
  programs.nixvim = {
    extraPackages = with pkgs; [
      # Used to format Lua code
      stylua
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = false;
        format_on_save = ''
          function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            return {
              timeout_ms = 500,
              lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
            }
          end
        '';
        formatters_by_ft = {
          lua = ["stylua"];
          nix = ["alejandra"];
          rust = ["rustfmt"];
        };
      };
    };
    keymaps = [
      {
        mode = "";
        key = "<leader>f";
        action.__raw = ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end
        '';
        options = {
          desc = "[F]ormat buffer";
        };
      }
    ];
  };
}
