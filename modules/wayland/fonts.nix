{ config, pkgs, inputs, ... }:
{
	nixpkgs.overlays = [ (final: prev: {
		sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
			pname = "sf-mono-liga-bin";
			version = "dev";
			src = inputs.sf-mono-liga-src;
			dontConfigure = true;
			installPhase = ''
				mkdir -p $out/share/fonts/opentype
				cp -R $src/*.otf $out/share/fonts/opentype/
			'';
			};
		}) 
	];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-emoji
		sf-mono-liga-bin
  ];
}
