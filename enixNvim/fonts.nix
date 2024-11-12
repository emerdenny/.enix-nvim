{ pkgs, config, ... }:
{
  config.fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ config.enixNvim.nerdfont ]; })
      font-awesome
    ];
  };
}
