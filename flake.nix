{
  description = "my goofy ahh flake";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland/";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Hyprwm contrib
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # oxocarbon my beloved
    base16 = {
      url = "github:shaunsingh/base16.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16-oxocarbon = {
      url = "github:shaunsingh/base16-oxocarbon";
      flake = false;
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

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nur
    , hyprland
    , ...
    } @ inputs:
    let
      vars = {
        user = "chomsky";
        editor = "nvim";
      };
      inherit (self) outputs;
    in
    {
      formatter.x86_64-linux = inputs.alejandra.defaultPackage.x86_64-linux;
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager nur hyprland vars;
        }
      );
    };
}

