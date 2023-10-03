{
  description = "my goofy ahh flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland/";

    # Hyprwm contrib
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fu.url = "github:numtide/flake-utils";
    # Helix
    helix = {
      url = "github:SoraTenshi/helix/new-daily-driver";
      inputs.flake-utils.follows = "fu";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # LigaSFMono Nerd Font
    sf-mono-liga-src = {
      url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
      flake = false;
    };

    # Formatter
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    formatter.x86_64-linux = inputs.alejandra.defaultPackage.x86_64-linux;
    nixosConfigurations = {
      justchokingaround = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          {networking.hostName = "justchokingaround";}
          ./hosts/desktop/hardware-configuration.nix
          ./modules/core/default.nix
          ./modules/wayland/default.nix
          ./modules/home/default.nix
        ];
      };
    };
  };
}
