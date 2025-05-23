{
  lib,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = false;
        format_on_save = ''
          function(bufnr)
            if vim.b[bufnr].disable_conform_format then
              return nil
            end
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
          tex = ["tex-fmt"];
        };
        formatters = {
          stylua = {
            command = lib.getExe pkgs.stylua;
            args = [
              "--search-parent-directories"
              "--indent-type"
              "Spaces"
              "--stdin-filepath"
              "$FILENAME"
              "-"
            ];
          };
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
    userCommands = {
      ToggleAutoformat.command.__raw = ''
        function()
          vim.b.disable_conform_format = not vim.b.disable_conform_format
          require("fidget").notify("Autoformat on save " .. (vim.b.disable_conform_format and "disabled" or "enabled") .. " for this buffer", vim.log.levels.INFO)
        end
      '';
    };
  };
}
