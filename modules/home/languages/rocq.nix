{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.Coqtail
      (pkgs.vimUtils.buildVimPlugin {
        name = "vscoq-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "tomtomjhj";
          repo = "vscoq.nvim";
          rev = "f29200e91dd95953ff96d1b9cbf57570b2face5e";
          hash = "sha256-Hk6PfShy8pM05KT8UwytQFCp6L5aB/UcY4GyuZjPAwA=";
        };
      })
    ];
    extraConfigLua = ''
      vim.g.loaded_coqtail = 1
      vim.g["coqtail#supported"] = 0
      require'vscoq'.setup ()
    '';

    autoCmd = [
      {
        event = ["FileType"];
        pattern = ["coq"];
        callback.__raw = ''
          function()
            vim.keymap.set({ "n","i" }, "<leader>cj",
              "<Cmd>VsCoq stepForward<CR>",
              { desc = "VsCoq ▶ step forward" })
            vim.keymap.set({ "n","i" }, "<leader>ck",
              "<Cmd>VsCoq stepBackward<CR>",
              { desc = "VsCoq ◀ step backward" })
            vim.keymap.set({ "n","i" }, "<leader>cl",
              "<Cmd>VsCoq interpretToPoint<CR>",
              { desc = "VsCoq ⤵ interpret to point" })
            vim.keymap.set({ "n","i" }, "<leader>cG",
              "<Cmd>VsCoq interpretToEnd<CR>",
              { desc = "VsCoq ⤴ interpret to end" })
            end
        '';
      }
    ];
  };
}
