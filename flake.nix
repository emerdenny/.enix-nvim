{
  description = "AstroNvim for enix";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, darwin, home-manager, ... }:
    {
      nixosModules = rec {
        astroNvim = import ./enixNvim/nixos.nix;
        defualt = astroNvim;
      };
      darwinModules = rec {
        astroNvim = import ./enixNvim/macos.nix;
        defualt = astroNvim;
      };
    };
}
