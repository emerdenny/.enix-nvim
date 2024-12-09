{
  lib,
  helpers,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    ./find.nix
    ./git.nix
    ./ui.nix
  ];

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    path = helpers.mkRaw "vim.o.path .. '**'";

    spell = true;
    spelllang = "en";

    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    foldenable = true;
    nrformats = "bin,hex"; # "octal"
    undofile = true;
  };

  plugins = {
    comment = {
      enable = true;
    };
  };

  keymaps = [
    # ------------ Top Level ------------
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
    {
      mode = ["n" "i"];
      action = "<cmd>Telescope registers<CR>";
      key = "<c-p>";
      options.desc = "Paste from register";
    }
    # ------------- Leader --------------
    {
      mode = "n";
      key = "<leader>c";
      action = "<cmd>q<cr><esc>";
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>vnew<cr><esc>";
      options.desc = "New buffer";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>w<cr><esc>";
      options.desc = "Save buffer";
    }
    # TODO not working
    # ref: https://github.com/numtostr/comment.nvim/
    # {
    #   mode = "n";
    #   key = "<leader>/";
    #   action = "gcc";
    #   options.desc = "Comment line";
    # }
  ];

  # https://github.com/spector700/Akari/blob/cc04b507f02fb8b6f3998e83c33f74d608772db5/config/keymaps.nix#L244
  extraConfigLua = ''
  '';

  diagnostics = {
    virtual_text = {
      prefix = "";
      format = helpers.mkRaw ''
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

  plugins = {
    treesitter = {
      enable = true;
    };
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      # TODO need to setup for `pkgs` import
      # https://github.com/spector700/Akari/blob/cc04b507f02fb8b6f3998e83c33f74d608772db5/config/default.nix
      # fromVscode = [
      #   {
      #     lazyLoad = true;
      #     paths = "${pkgs.vimPlugins.friendly-snippets}";
      #   }
      # ];
    };
    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          autostart = true;
          installRustc = true;
          installCargo = true;
          installRustfmt = true;
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
    cmp = {
      # influenced by https://github.com/nix-community/kickstart-nix.nvim/blob/main/nvim/plugin/completion.lua
      enable = true;
      autoEnableSources = true;
      settings = {
        completion.completeopt = "menu,menuone,noinsert";
        sources = [
          {
            name = "nvim_lsp";
            keyword_length = 3;
          }
          {
            name = "nvim_lsp_signature_help";
            keyword_length = 3;
          }
          {name = "luasnip";}
          {
            name = "buffer";
            # Words from other open buffers can also be suggested
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keyword_length = 3;
          }
          {name = "path";}
        ];
        window = {
          completion.border = "none";
          documentation.border = "none";
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        mapping = {
          "<Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.expand_or_locally_jumpable(1) then
                luasnip.expand_or_jump(1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<S-Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item())";
          "<C-p>" = "cmp.mapping(cmp.mapping.select_prev_item())";
          "<C-e>" = "cmp.mapping.abort()";
          # TODO scroll not working
          # https://github.com/spector700/Akari/blob/cc04b507f02fb8b6f3998e83c33f74d608772db5/config/plugins/completion/cmp.nix#L86
          # https://github.com/nix-community/kickstart-nix.nvim/blob/f6d0af5576c0aae1dca39ed5119fb18ce5ef87d2/nvim/plugin/completion.lua#L58
          # "<C-Up>" = "cmp.mapping(cmp.scroll_docs(4))";
          # "<C-Down>" = "cmp.mapping(cmp.scroll_docs(-4))";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
        };
        experimental = {
          native_menu = false;
          ghost_text = true;
        };
      };
      filetype = {
        lua = {
          sources = [
            {name = "nvim_lua";}
            {
              name = "nvim_lsp";
              keyword_length = 3;
            }
            {name = "path";}
          ];
        };
        sql.sources = [
          {name = "buffer";}
          {name = "vim-dadbod-completion";}
        ];
      };
      cmdline = {
        "/" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            {
              name = "nvim_lsp_document_symbol";
              keyword_length = 3;
            }
            {name = "buffer";}
          ];
          view = {
            entries = {
              name = "wildmenu";
              separator = "|";
            };
          };
        };
        "?" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            {
              name = "nvim_lsp_document_symbol";
              keyword_length = 3;
            }
            {name = "buffer";}
          ];
          view = {
            entries = {
              name = "wildmenu";
              separator = "|";
            };
          };
        };
        ":" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            {name = "cmdline";}
            {name = "path";}
          ];
        };
      };
    };
    vim-dadbod = {
      enable = true;
    };
    vim-dadbod-ui = {
      enable = true;
    };
    vim-dadbod-completion = {
      enable = true;
    };
  };
}
