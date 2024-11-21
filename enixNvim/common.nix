{
  pkgs,
  system,
  config,
  lib,
  home-manger,
  ...
}: let
  refresh = pkgs.writeScriptBin "nvim-refresh" ''
    rm -rf ~/.config/nvim/lazy-lock.json
    rm -rf ~/.config/lvim

    rm -rf ~/.cache/lvim
    rm -rf ~/.cache/nvim

    rm -rf ~/.local/share/lvim
    rm -rf ~/.local/share/nvim

    rm -rf ~/.local/state/lvim
    rm -rf ~/.local/state/nvim
  '';
in {
  imports = [./options.nix];
  config = {
    environment.systemPackages = with pkgs;
      [
        # Essential
        ripgrep
        lazygit
        gdu
        bottom
        # LSP dependencies
        stylua
        selene
        lua-language-server
        ruff
        config.enixNvim.pythonPackage
        config.enixNvim.nodePackage
        nixd
        alejandra
        deadnix
        statix
        marksman
      ]
      ++ [refresh];
    home-manager.users.${config.enixNvim.username} = {
      programs.neovim = {
        enable = true;
        plugins = [
          pkgs.vimPlugins.nvim-treesitter.withAllGrammars
          pkgs.vimPlugins.conjure
        ];
      };
      xdg.configFile = {
        "nvim/lua" = {
          source = ../src/lua;
          recursive = true;
        };
        "nvim/init.lua" = {
          source = ../src/init.lua;
        };
      };
    };
  };
}
