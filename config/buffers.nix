{
  plugins = {
    bufferline.enable = true;
    web-devicons.enable = true;
  };

  keymaps = [
    # TODO test
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>BufferLinePick<esc>";
      options.desc = "Pick to goto";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>bc";
      action = "<cmd>BufferLineCloseOthers<esc>";
      options.desc = "Close all others";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>BufferLinePickClose<esc>";
      options.desc = "Pick to close";
    }
    # TODO test
    # {
    #   mode = "n";
    #   key = "<leader>bp";
    #   action = "<cmd>BufferLineGoToBuffer<esc>";
    #   options.desc = "Goto last buffer";
    # }
  ];
}
