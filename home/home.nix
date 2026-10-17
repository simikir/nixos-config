{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    grim
    pavucontrol

    jupyter
    paraview
    pdftk

    digikam
    gimp
    inkscape
    libreoffice
    spotify

    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
    corefonts
  ];

  fonts.fontconfig.enable = true;

  programs = {
     rclone.enable = true;
     eza.enable = true;
     zoxide.enable = true;

     git = {
       enable = true;
       settings.user = {
         name = "simikir";
         email = "simi@kir.org";
       };
     };

     bash.enable = true;
     fish.enable = true;
     htop.enable = true;

     alacritty.enable = true;
     hyfetch.enable = true;

     hyprlock.enable = true;
     noctalia.enable = true;

     satty.enable = true;

     texlive.enable = true;

     emacs = {
       enable = true;
       package = pkgs.emacs-gtk;
     };

     pandoc.enable = true;

     firefox.enable = true;
     thunderbird.enable = true;
  };

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
