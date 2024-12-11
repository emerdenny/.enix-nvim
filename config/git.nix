{
  plugins = {
    diffview = {
      enable = true;
      enhancedDiffHl = true;
    };
  };

  keymaps = [
    # TODO test
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Telescope git_branches<CR>";
      options = {
        desc = "Git Branches";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<CR>";
      options = {
        desc = "Diffview";
      };
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>gh";
      action = "<cmd>DiffviewFileHistory %<CR>";
      options = {
        desc = "Diff file history";
      };
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>gH";
      action = "<cmd>DiffviewFileHistory<CR>";
      options = {
        desc = "Diff git history";
      };
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Telescope git_status<CR>";
      options = {
        desc = "Git status";
      };
    }
  ];
}
