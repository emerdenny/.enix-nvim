{
  keymaps = [
    # TODO test
    {
      mode = "n";
      key = "<leader>xq";
      action = "<Cmd>copen<CR>";
      options.desc = "Quickfix List";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>xl";
      action = "<Cmd>lopen<CR>";
      options.desc = "Location List";
    }
    # TODO test
    {
      mode = "n";
      key = "]q";
      action = "<Cmd>cnext<CR>";
      options.desc = "Next quickfix";
    }
    # TODO test
    {
      mode = "n";
      key = "[q";
      action = "<Cmd>cprev<CR>";
      options.desc = "Previous quickfix";
    }
    # TODO test
    {
      mode = "n";
      key = "]Q";
      action = "<Cmd>clast<CR>";
      options.desc = "End quickfix";
    }
    # TODO test
    {
      mode = "n";
      key = "[Q";
      action = "<Cmd>cfirst<CR>";
      options.desc = "Beginning quickfix";
    }
    # TODO test
    {
      mode = "n";
      key = "]l";
      action = "<Cmd>lnext<CR>";
      options.desc = "Next loclist";
    }
    # TODO test
    {
      mode = "n";
      key = "[l";
      action = "<Cmd>lprev<CR>";
      options.desc = "Previous loclist";
    }
    # TODO test
    {
      mode = "n";
      key = "]Q";
      action = "<Cmd>llast<CR>";
      options.desc = "End loclist";
    }
    # TODO test
    {
      mode = "n";
      key = "[Q";
      action = "<Cmd>lfirst<CR>";
      options.desc = "Beginning loclist";
    }
  ];
}
