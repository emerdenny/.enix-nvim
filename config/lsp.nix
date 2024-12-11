{ helpers, ... }:
{
  plugins = {
    # TODO config format on save
    # conform-nvim = {
    #   enable = true;
    #   settings = {}:
    # };
    # TODO config
    # lsp-signature = {
    #   enable = true;
    #   settings = {}:
    # };
    # TODO config
    # lspsaga = {
    #   enable = true;
    #   settings = {}:
    # };
    # TODO config
    # ref: https://www.reddit.com/r/neovim/comments/1dotg86/comment/lac60zc/
    # lint = {
    #   enable = true;
    #   settings = {}:
    # };
    lsp = {
      enable = true;
      servers = {
        gopls = {
          enable = true;
          autostart = true;
          # TODO
          settings = {};
        };
        rust_analyzer = {
          enable = true;
          autostart = true;
          # TODO this should be handled by:
          # https://github.com/nix-community/nix-direnv
          # https://github.com/the-nix-way/dev-templates/tree/main
          installRustc = true;
          installCargo = true;
          installRustfmt = true;
        };
        ruff = {
          enable = true;
          autostart = true;
          # TODO
          settings = {};
        };
        marksman = {
          enable = true;
          autostart = true;
        };
      };
    };
    lspkind = {
      enable = true;
      cmp = {
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
        };
      };
      symbolMap = {
        Namespace = "󰌗";
        Text = "󰊄";
        Method = "󰆧";
        Function = "󰡱";
        Constructor = "";
        Field = "󰜢";
        Variable = "󰀫";
        Class = "󰠱";
        Interface = "";
        Module = "󰕳";
        Property = "";
        Unit = "󰑭";
        Value = "󰎠";
        Enum = "";
        Keyword = "󰌋";
        Snippet = "";
        Color = "󰏘";
        File = "󰈚";
        Reference = "󰈇";
        Folder = "󰉋";
        EnumMember = "";
        Constant = "󰏿";
        Struct = "󰙅";
        Event = "";
        Operator = "󰆕";
        TypeParameter = "";
        Table = "";
        Object = "󰅩";
        Tag = "";
        Array = "[]";
        Boolean = "";
        Number = "";
        Null = "󰟢";
        String = "󰉿";
        Calendar = "";
        Watch = "󰥔";
        Package = "";
      };

      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };

  diagnostics = {
    virtual_text = {
      prefix = "";
      format.__raw = ''
        function(diagnostic)
          local severity = diagnostic.severity
          if severity == vim.diagnostic.severity.ERROR then
            return string.format('󰅚' .. ' %s', diagnostic.message)
          end
          if severity == vim.diagnostic.severity.WARN then
            return string.format('⚠' .. ' %s', diagnostic.message)
          end
          if severity == vim.diagnostic.severity.INFO then
            return string.format('ⓘ' .. ' %s', diagnostic.message)
          end
          if severity == vim.diagnostic.severity.HINT then
            return string.format('󰌶' .. ' %s', diagnostic.message)
          end
          return string.format('■' .. ' %s', diagnostic.message)
        end
      '';
    };
    signs = {
      text = helpers.toRawKeys {
        "vim.diagnostic.severity.ERROR" = "󰅚";
        "vim.diagnostic.severity.WARN" = "⚠";
        "vim.diagnostic.severity.INFO" = "ⓘ";
        "vim.diagnostic.severity.HINT" = "󰌶";
      };
    };
    update_in_insert = false;
    underline = true;
    severity_sort = true;
    float = {
      focusable = false;
      style = "minimal";
      border = "rounded";
      source = "if_many";
      header = "";
      prefix = "";
    };
  };

  # https://github.com/spector700/Akari/blob/cc04b507f02fb8b6f3998e83c33f74d608772db5/config/keymaps.nix#L244
  extraConfigLuaPre = ''
    function diagnostic_goto(dir, severity)
      local go = vim.diagnostic["goto_" .. (dir and "next" or "prev")]
      if type(severity) == "string" then severity = vim.diagnostic.severity[severity] end
      return function() go { severity = severity } end
    end
  '';

  keymaps = [
    # TODO verify that this keymap exists (default? > v0.9)
    {
      mode = "n";
      key = "K";
      action = ''
        function()
          vim.lsp.buf.hover()
        end
      '';
      options.desc = "Get docs under cursor";
    }
    # TODO test
    {
      mode = "n";
      key = "[d";
      action = "diagnostic_goto(false)";
      options.desc = "Previous diagnostic";
    }
    # TODO test
    {
      mode = "n";
      key = "]d";
      action = "diagnostic_goto(true)";
      options.desc = "Next diagnostic";
    }
    # TODO test
    {
      mode = "n";
      key = "[e";
      action = ''diagnostic_goto(false, "ERROR")'';
      options.desc = "Previous error";
    }
    # TODO test
    {
      mode = "n";
      key = "]e";
      action = ''diagnostic_goto(true, "ERROR")'';
      options.desc = "Next error";
    }
    # TODO test
    {
      mode = "n";
      key = "[w";
      action = ''diagnostic_goto(false, "WARN")'';
      options.desc = "Previous warning";
    }
    # TODO test
    {
      mode = "n";
      key = "]w";
      action = ''diagnostic_goto(true, "WARN")'';
      options.desc = "Next warning";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>la";
      action = ''
        function()
          vim.lsp.buf.code_action()
        end
      '';
      options.desc = "LSP code action";
    }
    # TODO test
    {
      mode = "x";
      key = "<leader>la";
      action = ''
        function()
          vim.lsp.buf.code_action()
        end
      '';
      options.desc = "LSP code action";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>lA";
      action = ''
        function()
          vim.lsp.buf.code_action { context = { only = { "source" }, diagnostics = {} } }
        end
      '';
      options.desc = "LSP source action";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>ll";
      action = ''
        function()
          vim.lsp.codelens.refresh()
        end
      '';
      options.desc = "LSP CodeLens refresh";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>lL";
      action = ''
        function()
          vim.lsp.codelens.run()
        end
      '';
      options.desc = "LSP CodeLens run";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>ld";
      action = ''
        function()
          vim.diagnostic.open_float()
        end
      '';
      options.desc = "Hover diagnostics";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>lR";
      action = ''
        function()
          vim.lsp.buf.references()
        end
      '';
      options.desc = "Search references";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>lr";
      action = ''
        function()
          vim.lsp.buf.rename()
        end
      '';
      options.desc = "Rename current symbol";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>lh";
      action = ''
        function()
          vim.lsp.buf.signature_help()
        end
      '';
      options.desc = "Rename current symbol";
    }
    # TODO test
    {
      mode = "n";
      key = "<leader>lG";
      action = ''
        function()
          vim.lsp.buf.workspace_symbol()
        end
      '';
      options.desc = "Search workspace symbols";
    }
    # TODO test
    {
      mode = "n";
      key = "gd";
      action = ''
        function()
          vim.lsp.buf.definition()
        end
      '';
      options.desc = "Definition of current symbol";
    }
    # TODO test
    {
      mode = "n";
      key = "gD";
      action = ''
        function()
          vim.lsp.buf.declaration()
        end
      '';
      options.desc = "Declaration of current symbol";
    }
    # TODO test
    {
      mode = "n";
      key = "gI";
      action = ''
        function()
          vim.lsp.buf.implementation()
        end
      '';
      options.desc = "Implementation of current symbol";
    }
    # TODO test
    {
      mode = "n";
      key = "gy";
      action = ''
        function()
          vim.lsp.buf.type_definition()
        end
      '';
      options.desc = "Definition of current type";
    }
  ];
}
