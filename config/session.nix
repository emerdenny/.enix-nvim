{
  plugins = {
    auto-session = {
      enable = true;
      settings = {
        enabled = true;
        auto_create = true;
        auto_restore = true;
        auto_restore_last_session = false;
        auto_save = true;
        cwd_change_handling = true;
        log_level = "error";
        root_dir = {
          __raw = "vim.fn.stdpath 'data' .. '/sessions/'";
        };
        use_git_branch = false;
      };
    };
  };
}
