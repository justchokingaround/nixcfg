{ config
, pkgs
, inputs
, ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    rofi-wayland
    mako
    swww
    eww-wayland
    jq
  ];
}
