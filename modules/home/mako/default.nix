{ ... }: {
  services.mako = {
    enable = true;
    sort = "+time";
    layer = "overlay";
    defaultTimeout = 5000;
    maxVisible = 50;

    anchor = "top-right";
    margin = "50,0,0,0";
    width = 350;
    height = 1000;
    padding = "12";
    maxIconSize = 128;

    backgroundColor = "#161616";
    borderColor = "#ffffff";
    borderRadius = 14;
    borderSize = 2;

    font = "Liga SFMono Nerd Font Italic 12";
    extraConfig = ''
      format=<span foreground='#be95ff' size='14000' weight='bold'>%s</span>\n%b
      text-alignment=center
    '';
  };
}
