{
  inputs,
	outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
	 ./hypr
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "chomsky";
    homeDirectory = "/home/chomsky";
  };

	programs.neovim.enable = true;
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.alacritty.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
