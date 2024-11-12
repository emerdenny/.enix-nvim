{ lib, ... }:
{
  options.enixNvim = with lib; {
    username = mkOption {
      type = types.str;
      description = "The user for whom enixNvim will be installed";
    };
    nerdfont = mkOption {
      type = types.str;
      default = "Lilex";
      description = "The Nerd Font to be used";
    };
    nodePackage = mkOption {
      type = types.package;
      defaultText = "nodejs_20";
      description = "The NodeJS version to be used";
    };
    pythonPackage = mkOption {
      type = types.package;
      defaultText = "python312Full";
      description = "The Python version to be used";
    };
  };
}
