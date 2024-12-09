{
  plugins = {
    diffview = {
      enable = true;
      enhancedDiffHl = true;
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>gh";
      action = ''
        function()
          vim.cmd.DiffviewFileHistory(vim.api.nvim_buf_get_name(0))
        end
      '';
      options = {
        desc = "diff file history";
      };
    }
    {
      mode = ["n"];
      key = "<leader>gH";
      action = ''
        function()
          vim.cmd.DiffviewFileHistory()
        end
      '';
      options = {
        desc = "diff git history";
      };
    }
    {
      mode = ["n"];
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<CR>";
      options = {
        desc = "diffview";
      };
    }
  ];
}
