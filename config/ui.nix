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
    render-markdown.enable = true;
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
        icons = {
          group = "";
        };
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

  # https://github.com/AstroNvim/AstroNvim/blob/4697961743f500bfa2a8ccd9aef5863219a8bb8d/lua/astronvim/plugins/_astrolsp_mappings.lua
  # https://github.com/AstroNvim/astrolsp/blob/main/lua/astrolsp/toggles.lua
  keymaps = [
    # TODO test
    {
      mode = "n";
      key = "<leader>uf";
      action = ''
        function()
          local function bool2str(bool) return bool and "on" or "off" end
          local old_val = vim.b[0].autoformat
          if old_val == nil then
            vim.notify("No LSP attached with autoformatting")
            return
          end
          vim.b[0].autoformat = not old_val
          vim.notify(("Buffer autoformatting %s"):format(bool2str(vim.b[0].autoformat)))
        end
      '';
      options.desc = "Toggle autoformatting (buffer)";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>uf";
      action = ''
        function()
          local function bool2str(bool) return bool and "on" or "off" end
          local old_val = vim.b[0].autoformat
          if old_val == nil then
            vim.notify("No LSP attached with autoformatting")
            return
          end
          vim.b[0].autoformat = not old_val
          vim.notify(("Buffer autoformatting %s"):format(bool2str(vim.b[0].autoformat)))
        end
      '';
      options.desc = "Toggle autoformatting (buffer)";
    }
    # {
    #   mode = "n";
    #   key = "<leader>u?";
    #   action = ''
    #     https://github.com/AstroNvim/astrolsp/blob/9f1c8fb22223aaf7224710d677338114690ee8d6/lua/astrolsp/toggles.lua#L102
    #   '';
    #   options.desc = "Toggle signature help (buffer)";
    # }
  ];
}
