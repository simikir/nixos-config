{ config, pkgs, ...}:

let
  symlinkDotfile = dotfile: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/dotfiles/${dotfile}";
in {
  xdg.configFile = {
    "alacritty".source = symlinkDotfile "alacritty";
    "emacs".source = symlinkDotfile "emacs";
    "hypr".source = symlinkDotfile "hypr";
    "neofetch".source = symlinkDotfile "neofetch";
    "noctalia".source = symlinkDotfile "noctalia";
    "simikir".source = symlinkDotfile "simikir";
  };

}
