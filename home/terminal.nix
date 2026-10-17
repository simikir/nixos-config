{ config, pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    theme = "palenight";

    settings = {
      terminal.shell.program = "fish";
      mouse.hide_when_typing = true;

      window = {
        opacity = 0.9;
        padding.x = 11;
        padding.y = 11;
      };

      cursor = {
        style.shape = "Beam";
        style.blinking = "On";

        vi_mode_style.shape = "Block";
        vi_mode_style.blinking = "Off";
      };

      font = {
        size = 10.0;
        normal.family = "Fira Code";
      };
    };
  };
}
