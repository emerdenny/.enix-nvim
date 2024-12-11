{
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        # TODO enable
        # file-browser.enable = true;
        fzf-native.enable = true;
        # TODO rg integration and keymaps
        # ref: https://github.com/nvim-telescope/telescope-live-grep-args.nvim
        live-grep-args.enable = true;
        manix.enable = true;
        undo.enable = true;
        ui-select = {
          enable = true;
          settings = {
            specific_opts = {
              codeactions = true;
            };
          };
        };
      };
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^%.git[/\\]"
            "[/\\]%.git[/\\]"
            "^.mypy_cache"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
          git_worktrees = {
            toplevel = "vim.env.HOME";
            gitdir = ''vim.env.Home .. "/.cfg"'';
          };
          prompt_prefix = "   ";
          color_devicons = true;
          selection_caret = "> ";
          multi_icon = "> ";
          path_display = ["truncate"];
          sorting_strategy = "ascending";
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
            };
            vertical = {mirror = false;};
            width = 0.87;
            height = 0.80;
            preview_cutoff = 120;
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>Telescope buffers<CR>";
      key = "<leader>fb";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      action = "<cmd>Telescope commands<CR>";
      key = "<leader>fc";
      options.desc = "Find commands";
    }
    {
      mode = "n";
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      options.desc = "Find files";
    }
    {
      mode = "n";
      action = "<cmd>Telescope find_files hidden=true<CR>";
      key = "<leader>fF";
      options.desc = "Find all files";
    }
    {
      mode = "n";
      action = "<cmd>Telescope help_tags<CR>";
      key = "<leader>fh";
      options.desc = "Find help";
    }
    {
      mode = "n";
      action = "<cmd>Telescope keymaps<CR>";
      key = "<leader>fk";
      options.desc = "Find keymaps";
    }
    {
      mode = "n";
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>fm";
      options.desc = "Find man";
    }
    # TODO not working
    # {
    #   mode = "n";
    #   action = "<cmd>Telescope notify<CR>";
    #   key = "<leader>fn";
    #   options.desc = "Find notifications";
    # }
    {
      mode = "n";
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fo";
      options.desc = "Find oldfiles";
    }
    # TODO test
    {
      mode = "n";
      action = "<cmd>SessionSearch<CR>";
      key = "<leader>fs";
      options.desc = "Find sessions";
    }
    # TODO not working
    # {
    #   mode = "n";
    #   action = "<cmd>Telescope todo-comments<CR>";
    #   key = "<leader>ft";
    #   options.desc = "Find TODOs";
    # }
    {
      mode = "n";
      action = "<cmd>Telescope undo<CR>";
      key = "<leader>fu";
      options.desc = "Find undos";
    }
    {
      mode = "n";
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fw";
      options.desc = "Find words";
    }
    {
      mode = "n";
      action = "<cmd>Telescope live_grep hidden=true<CR>";
      key = "<leader>fW";
      options.desc = "Find words in all files";
    }
    {
      mode = "n";
      action = "<cmd>Telescope manix<CR>";
      key = "<leader>fx";
      options.desc = "Find in nix docs";
    }
    {
      mode = "n";
      action = "<cmd>Telescope marks<CR>";
      key = "<leader>f'";
      options.desc = "Find marks";
    }
    {
      mode = "n";
      action = "<cmd>Telescope resume<CR>";
      key = "<leader>f<cr>";
      options.desc = "Resume previous search";
    }
  ];
}
