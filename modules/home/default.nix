{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.chomsky = {
    isNormalUser = true;
    initialPassword = "changeme";
    home = "/home/chomsky/";
    description = "deez nuts";
    extraGroups = ["wheel" "networkmanager"];
		shell = pkgs.zsh;
  };

  home-manager.users.chomsky = {
    home.username = "chomsky";
    home.homeDirectory = "/home/chomsky/";
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;

    imports = [
      ./hyprland
			./zsh/default.nix
    ];
  };
}
