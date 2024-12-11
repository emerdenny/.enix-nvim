{
  plugins = {
    bufferline.enable = true;
    web-devicons.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>bb";
      action = "<Cmd>BufferLinePick<CR>";
      options.desc = "Pick to goto";
    }
    {
      mode = "n";
      key = "<leader>bc";
      action = "<Cmd>BufferLineCloseOthers<CR>";
      options.desc = "Close all others";
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<Cmd>BufferLinePickClose<CR>";
      options.desc = "Pick to close";
    }
    # TODO implement me
    # {
    #   mode = "n";
    #   key = "<leader>bp";
    #   action = "<Cmd>BufferLineGoToBuffer<esc>";
    #   options.desc = "Goto last buffer";
    # }
  ];
}
