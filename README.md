# Nix-ish AstroNvim Flake

This is an implementation of the [AstroNvim](https://astronvim.com/)
configuration/plugin distribution for Neovim using Nix flakes. The flake contains both a
NixOS and NixDarwin module which allows for easy adaptation and installation.

## Installation

A very minimal installation in a typical nix flake would look as follows:

`flake.nix`

```nix
{
  description = "My NixOS configuration";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-23.11";
    };
    enix-nvim = {
      url = "github:emerdenny/.enix-nvim/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, enix-nvim }:
  {
    nixosConfigurations = {
      "my-hostname" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          enix-nvim.nixosModules.astroNvim
        ];
      };
    };
  };
}
```

`configuration.nix`

```nix
{ config, pkgs, ...}:
{
  enixNvim = {
    username = "sumrock";
    nerdfont = "FiraCode";
    nodePackage = pkgs.nodejs_20;
    pythonPackage = pkgs.python311Full;
  };

  # Everything else required to configure your machine...
}
```
