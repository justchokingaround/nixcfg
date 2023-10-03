{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    unzip
    killall
    lf
    alacritty
    wezterm
    ripgrep
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    libnotify
    vivaldi
    neovim
    spotify
    pfetch
    inputs.helix.packages.${pkgs.system}.helix
  ];
}
