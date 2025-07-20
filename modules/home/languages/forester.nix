{...}: {
  programs.nixvim = {
    filetype.extension = {
      tree = "forester";
    };

    plugins = {
      treesitter.luaConfig.pre = ''
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
          parser_config.forester = {
          	install_info = {
          		url = "https://github.com/kentookura/tree-sitter-forester",
          		files = { "src/parser.c" },
          		branch = "main",
          		generate_requires_npm = false,
          		requires_generate_from_grammar = false,
          	},
          	filetype = "forester",
          }
      '';

      lsp.postConfig = ''
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")
        configs["forester-lsp"] = {
          default_config = {
            cmd = { "forester", "lsp", "-vvv" },
            filetypes = { "forester" },
            root_dir = lspconfig.util.root_pattern(".git", "."),
          },
        }
        lspconfig["forester-lsp"].setup {}
      '';
    };
  };
}
