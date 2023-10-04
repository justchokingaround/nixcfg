{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./pipewire.nix
    ./pkgs.nix
    ./security.nix
    ./users.nix
    ./time.nix
    ./network.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nix settings
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.05";
}
