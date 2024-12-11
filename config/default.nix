{
  lib,
  helpers,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    ./buffers.nix
    ./find.nix
    ./git.nix
    ./lsp.nix
    ./quickfix.nix
    ./session.nix
    ./toggleterm.nix
    ./ui.nix
  ];

  # NOTE NixVim options search: https://nix-community.github.io/nixvim/search/
  # NOTE NixVim plugins search: https://nix-community.github.io/nixvim/plugins/

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    path = helpers.mkRaw "vim.o.path .. '**'";
    shell = "/run/current-system/sw/bin/fish";

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

  clipboard = {
    register = "unnamedplus";
    providers.wl-copy.enable = true;
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
      key = "H";
      action = "<Cmd>BufferLineCyclePrev<CR>";
      options.desc = "Switch to prev buffer";
    }
    {
      mode = "n";
      key = "L";
      action = "<Cmd>BufferLineCycleNext<CR>";
      options.desc = "Switch to left buffer";
    }
    {
      mode = "n";
      key = "x";
      action = "<C-w>c";
      options.desc = "Close current buffer";
    }
    {
      mode = "n";
      key = "|";
      action = "<Cmd>vsp<CR>";
      options.desc = "New vertical split";
    }
    {
      mode = "n";
      key = "_";
      action = "<Cmd>sp<CR>";
      options.desc = "New horizontal split";
    }
    {
      mode = ["n" "i"];
      action = "<Cmd>Telescope registers<CR>";
      key = "<C-p>";
      options.desc = "Paste from register";
    }
    {
      mode = "n";
      action = "<C-w>h";
      key = "<C-h>";
      options.desc = "Focus left";
    }
    {
      mode = "n";
      action = "<C-w>j";
      key = "<C-j>";
      options.desc = "Focus down";
    }
    {
      mode = "n";
      action = "<C-w>k";
      key = "<C-k>";
      options.desc = "Focus up";
    }
    {
      mode = "n";
      action = "<C-w>l";
      key = "<C-l>";
      options.desc = "Focus right";
    }
    # TODO test
    {
      mode = "n";
      action = "<Cmd>resize -2<CR>";
      key = "<C-Up>";
      options.desc = "Resize split up";
    }
    # TODO test
    {
      mode = "n";
      action = "<Cmd>resize +2<CR>";
      key = "<C-Down>";
      options.desc = "Resize split down";
    }
    # TODO test
    {
      mode = "n";
      action = "<Cmd>vertical resize -2<CR>";
      key = "<C-Left>";
      options.desc = "Resize split left";
    }
    # TODO test
    {
      mode = "n";
      action = "<Cmd>vertical resize +2<CR>";
      key = "<C-Right>";
      options.desc = "Resize split right";
    }
    # TODO test
    {
      mode = "v";
      action = ">gv";
      key = "<Tab>";
      options.desc = "Indent line";
    }
    # TODO test
    {
      mode = "v";
      action = "<gv";
      key = "<S-Tab>";
      options.desc = "Unindent line";
    }
    # ------------- Leader --------------
    {
      mode = "n";
      key = "<leader>n";
      action = "<Cmd>enew<CR>";
      options.desc = "New file";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<Cmd>confirm q<CR>";
      options.desc = "Quit window";
    }
    {
      mode = "n";
      key = "<leader>Q";
      action = "<Cmd>confirm qall<CR>";
      options.desc = "Quit nvim";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<Cmd>write<CR>";
      options.desc = "Write buffer";
    }
    # TODO test
    # ref: https://github.com/numtostr/comment.nvim/
    {
      mode = "n";
      key = "<leader>/";
      action = "gcc";
      options = {
        desc = "Toggle comment";
        remap = true;
      };
    }
    # TODO test
    # ref: https://github.com/numtostr/comment.nvim/
    {
      mode = "x";
      key = "<leader>/";
      action = "gc";
      options = {
        desc = "Toggle comment";
        remap = true;
      };
    }
  ];

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
