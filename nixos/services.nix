{ config, pkgs, ... }:

{
# * display manager
  services.displayManager.noctalia-greeter = {
    enable = true;

    passwordlessSyncUsers = [ "simikir" ];

    settings = {
      session.default = "Hyprland";
      user.default = "simikir";

      appearance = {
        scheme = "Synced";
        theme_mode = "dark";
        password_style = "random";
      };

      clock = {
        date_format = "%A, %d. %B %Y";
        time_font_size = 96;
        date_font_size = 24;
      };

      keyboard = {
        layout = "de";
        options = "caps:escape";
      };
    };
  };

  services.desktopManager.plasma6.enable = true;

# * tty
  console.keyMap = "de";

# * printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

# * audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

# * bluetooth
  hardware.bluetooth.enable = true;

}
