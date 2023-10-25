{ pkgs
, inputs
, ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    unzip
    killall
    uutils-coreutils
    (ripgrep.override {
      withPCRE2 = true;
    })
    fzf
    lf
    alacritty
    wezterm
    ripgrep
    discord
    libnotify
    vivaldi
    neovim
    spotify
    pfetch
    inputs.helix.packages.${pkgs.system}.helix
    cargo
    gcc
    nodejs
    gnumake
    firefox
  ];
}
