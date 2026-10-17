{ config, pkgs, ... }:

let
  myShellAliases = {
    ".." = "cd ../";
    "..." = "cd .../";
    "...." = "cd ..../";
    "....." = "cd ...../";
    "......" = "cd ....../";
    "......." = "cd ......./";

    "mv" = "mv -i";
    "rm" = "rm -i";

    "gspdf" = "gs -q -dNOPAUSE -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook";
    "magick" = "magick -density 300";
  };

in {
  programs = {
    bash = {
      enable = true;

      enableCompletion = true;
      historyControl = [ "ignoreboth" ];

      shellAliases = myShellAliases;

      shellOptions = [
        "histappend"
        "extglob"
        "globstar"
        "checkjobs"

        "cmdhist"
        "autocd"
        "checkwinsize"

        "expand_aliases"
      ];
    };

    fish = {
      enable = true;

      shellAbbrs = myShellAliases;

      interactiveShellInit = "
fish_config prompt choose scales
fish_config theme choose Dracula

function fish_greeting
    hyfetch
end
";
    };

    zoxide.enable = true;

    eza = {
      enable = true;
      icons = "auto";
    };

    hyfetch = {
      enable = true;
      settings = {
        preset = "rainbow";
        mode = "rgb";
        color_align.mode = "horizontal";
        backend = "neofetch";
        pride_month_disable = true;
      };
    };

  };
}
