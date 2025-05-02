{ config, pkgs, ... }:
{
	fonts = {
		packages = with pkgs; [
			hackgen-nf-font
			ipaexfont
			notonoto
			vegur
		];
		fontconfig = {
			defaultFonts = {
				serif = [ "dejaVu serif" "ipaexmincho" ];
				sansSerif = [ "dejaVu sans" "ipaexgothic" ];
				monospace = [ "HackGen Console NF" "Noto Color Emoji" ];
			};
		};
	};
}
