{
  plugins = {
    toggleterm = {
      enable = true;
      luaConfig.pre = ''
        local Terminal = require('toggleterm.terminal').Terminal

        local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
        function _lazygit_toggle()
          lazygit:toggle()
        end
      '';
      settings = {
        auto_scroll = true;
        autochdir = true;
        close_on_exit = true;
        direction = "float";
        float_opts = {
          border = "curved";
          title_pos = "left";
          winblend = 0;
        };
        hide_numbers = true;
        highlights = {
          FloatBorder = {
            link = "Normal";
          };
          NormalFloat = {
            link = "Normal";
          };
          StatusLine = {
            gui = "NONE";
          };
          StatusLineNC = {
            cterm = "italic";
            gui = "NONE";
          };
        };
        insert_mappings = true;
        persist_mode = true;
        persist_size = true;
        shell = {
          __raw = "vim.o.shell";
        };
        start_in_insert = true;
        terminal_mappings = true;
        winbar.enabled = false;
      };
    };
  };

  extraConfigLuaPre = ''
    function term_nav(dir)
      return function()
        if vim.api.nvim_win_get_config(0).zindex then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-" .. dir .. ">", true, false, true), "n", false)
        else
          vim.cmd.wincmd(dir)
        end
      end
    end
  '';

  keymaps = [
    {
      mode = "n";
      action = "<cmd>ToggleTerm<CR>";
      key = "<leader>tf";
      options.desc = "ToggleTerm float";
    }
    {
      mode = "n";
      action = "<cmd>ToggleTerm size=10 direction=horizontal<CR>";
      key = "<leader>th";
      options.desc = "ToggleTerm horizontal";
    }
    {
      mode = "n";
      action = "<cmd>lua _lazygit_toggle()<CR>";
      key = "<leader>tl";
      options = {
        desc = "ToggleTerm lazygit";
        silent = true;
      };
    }
    {
      mode = "n";
      action = "<cmd>ToggleTerm size=80 direction=vertical<CR>";
      key = "<leader>tv";
      options.desc = "ToggleTerm vertical";
    }
    {
      mode = "n";
      action = "<cmd>lua _lazygit_toggle()<CR>";
      key = "<leader>gg";
      options = {
        desc = "ToggleTerm lazygit";
        silent = true;
      };
    }
    {
      mode = [ "n" "t" ];
      action = "<cmd>ToggleTerm<CR>";
      key = "<F7>";
      options.desc = "ToggleTerm";
    }
    # TODO test
    {
      mode = "t";
      action = ''<cmd>term_nav "h"<CR>'';
      key = "<C-H>";
      options.desc = "Terminal left window navigation";
    }
    # TODO test
    {
      mode = "t";
      action = ''<cmd>term_nav "j"<CR>'';
      key = "<C-J>";
      options.desc = "Terminal down window navigation";
    }
    # TODO test
    {
      mode = "t";
      action = ''<cmd>term_nav "k"<CR>'';
      key = "<C-K>";
      options.desc = "Terminal up window navigation";
    }
    # TODO test
    {
      mode = "t";
      action = ''<cmd>term_nav "l"<CR>'';
      key = "<C-L>";
      options.desc = "Terminal right window navigation";
    }
  ];
}
