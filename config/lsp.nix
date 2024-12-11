{ helpers, ... }:
{
  plugins = {
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
        pyright = {
          enable = true;
          autostart = true;
          # TODO
          settings = {};
        };
        nixd = {
          enable = true;
          autostart = true;
        };
        marksman = {
          enable = true;
          autostart = true;
        };
      };
    };
    none-ls = {
      enable = true;
      settings = {
        diagnostics_format = "[#{c}] #{m} #{s}";
        fallback_severity.__raw = "vim.diagnostic.severity.ERROR";
        log_level = "warn";
        notify_format = "[null-ls] %s";
        root_dir.__raw = "require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', '.git')";
        temp_dir = "/tmp"; # NOTE can cause issues with some none-ls sources
        update_in_insert = true; # NOTE can cause perf issues
        on_attach = ''
          function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = "LspFormatting",
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({
                    filter = function(client)
                      -- apply whatever logic you want (for now only using null-ls)
                      return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                    async = false,
                  })
                end
              })
            end
          end
        '';
      };
      sources = {
        code_actions = {
          gomodifytags.enable = true;
          impl.enable = true;
          statix.enable = true;
        };
        completion = {
          luasnip = {
            enable = true;
            settings = {
              enable_autosnippets = true;
              store_selection_keys = "<Tab>";
              # TODO friendly-snippets?
              # github.com/spector700/Akari/blob/cc04b507f02fb8b6f3998e83c33f74d608772db5/config/default.nix
            };
          };
        };
        diagnostics = {
          actionlint.enable = true;                                          # GitHub Actions
          buf.enable = true;                                                 # Protobuf
          checkmake.enable = true;                                           # Makefile
          commitlint.enable = true;                                          # Git Commits
          deadnix.enable = true;                                             # Nix dead code
          djlint.enable = true;                                              # HTML Template
          dotenv_linter.enable = true;                                       # .env
          golangci_lint.enable = true; # add bug/security rules and revive, staticcheck?
          hadolint.enable = true;                                            # Dockerfile
          selene.enable = true;                                              # Lua
          sqlfluff = {
            enable = true;
            settings = {
              extra_args = [ "--dialect" "postgres" ];
            };
          };
          statix.enable = true;                                              # Nix
          tidy.enable = true;                                                # HTML
          todo_comments.enable = true;
          trivy.enable = true;                                               # Security
        };
        formatting = {
          alejandra.enable = true;                                           # Nix
          buf.enable = true;                                                 # Protobuf
          djlint.enable = true;                                              # HTML Template
          gofmt.enable = true;
          goimports.enable = true;
          prettierd.enable = true; # disable css re: stylelint               # JS, TS, CSS, HTML, etc.
          # remark.enable = true; # depends on remark-cli
          sqlfluff = {
            enable = true;
            settings = {
              extra_args = [ "--dialect" "postgres" ];
            };
          };
          stylelint.enable = true;                                           # CSS
          stylua.enable = true;
          tidy.enable = true;                                                # HTML
        };
        hover = {
          printenv.enable = true;                                           # ENV_VAR
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

  autoGroups = {
    LspFormatting = {
      clear = true;
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
