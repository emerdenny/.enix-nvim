{helpers, ...}: {
  opts = {
    number = true;
    relativenumber = true;
    cursorline = true;
    lazyredraw = true;
    showmatch = true;
    incsearch = true;
    hlsearch = true;

    splitright = true;
    splitbelow = true;

    fillchars = helpers.mkRaw "[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]";
  };

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };

  plugins = {
    oil.enable = true;
    lualine.enable = true;
    bufferline.enable = true;
    web-devicons.enable = true;
    render-markdown.enable = true;
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            mode = "n";
            group = "Buffers";
          }
          {
            __unkeyed-1 = "<leader>d";
            mode = "n";
            group = "Debugger";
          }
          {
            __unkeyed-1 = "<leader>f";
            mode = "n";
            group = "Find";
          }
          {
            __unkeyed-1 = "<leader>g";
            mode = "n";
            group = "Git";
          }
          {
            __unkeyed-1 = "<leader>l";
            mode = "n";
            group = "Language Tools";
          }
          {
            __unkeyed-1 = "<leader>S";
            mode = "n";
            group = "Session";
          }
          {
            __unkeyed-1 = "<leader>t";
            mode = "n";
            group = "Terminal";
          }
          {
            __unkeyed-1 = "<leader>u";
            mode = "n";
            group = "UI/UX";
          }
          {
            __unkeyed-1 = "<leader>x";
            mode = "n";
            group = "Quickfix/Lists";
          }
        ];
      };
    };
  };
}
