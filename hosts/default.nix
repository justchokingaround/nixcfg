{ lib, inputs, nixpkgs, home-manager, nur, hyprland, vars, ... }:

let
  system = "x86_64-linux";                                  # System Architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow Proprietary Software
  };

  lib = nixpkgs.lib;
in
{
  justchokingaround = nixpkgs.lib.nixosSystem
    {
      inherit system;
      specialArgs = {
        inherit inputs system hyprland vars;
      };
      host =
        {
          hostName = "justchokingaround";
          mainMonitor = "DP-2";
          secondMonitor = "HDMI-A-1";
        };
      modules = [
        {
          networking.hostName = "justchokingaround";
        }
        ./desktop/hardware-configuration.nix
        ../modules/core/default.nix
        ../modules/wayland/default.nix
        ../modules/home/default.nix
        home-manager.nixosModules.home-manager
        {
          # Home-Manager Module
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };
}
