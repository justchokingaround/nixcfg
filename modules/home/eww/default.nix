{ pkgs, ... }: {
  programs.eww-wayland = {
    enable = true;
    package = pkgs.eww-wayland;

    # theres no programs.eww.enable here because eww looks for files in .config
    # thats why we have all the home.files

    # configuration
    home.file.".config/eww/eww.scss".source = ./eww.scss;
    home.file.".config/eww/eww.yuck".source = ./eww.yuck;

    # scripts
    home.file.".config/eww/scripts/appname" = {
      source = ./scripts/appname;
      executable = true;
    };

    home.file.".config/eww/scripts/memory" = {
      source = ./scripts/memory;
      executable = true;
    };

    home.file.".config/eww/scripts/music" = {
      source = ./scripts/music;
      executable = true;
    };

    home.file.".config/eww/scripts/volume" = {
      source = ./scripts/volume;
      executable = true;
    };

    home.file.".config/eww/scripts/wifi" = {
      source = ./scripts/wifi;
      executable = true;
    };

    home.file.".config/eww/scripts/workspace" = {
      source = ./scripts/workspace
      ;
      executable = true;
    };
  };
}
