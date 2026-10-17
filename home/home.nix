{ config, pkgs, ...}:

{
  # home.packages = with pkgs; [
  #   grim

  #   jupyter
  #   paraview
  #   pdftk

  #   digikam
  #   gimp
  #   inkscape
  #   libreoffice
  #   spotify
  # ];

  # programs = {
  #    rclone.enable = true;
  #    eza.enable = true;
  #    zoxi.enable = true;

  #    git = {
  #      enable = true;
  #      settings.user = {
  #        name = "simikir";
  #        email = "simi@kir.org";
  #      };
  #    };

  #    bash.enable = true;
  #    zsh.enable = true;
  #    fish.enable = true;

  #    alacritty.enable = true;
  #    hyfetch.enable = true;

  #    satty.enable = true;

  #    texlive = {
  #      enable = true;
  #      package = "texliveFull";
  #    };

  #    emacs = {
  #      enable = true;
  #      package = "emacs-gtk";
  #    };

  #    pandoc.enable = true;
  # }

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.11";

}
