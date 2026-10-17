{ config, pkgs, ... }:

{
# * nix settings
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

# * packages
  environment.systemPackages = with pkgs; [
# ** file management
    wget
    p7zip
    file
    tree
    gparted
    cifs-utils

# ** system tools
    psmisc
    gnupg
    libnotify
    bluez
    openvpn

# ** window manager & compositor stuff
    xhost
    xkill
    hyprpolkitagent

# ** programming
    python3
    just

  ];

# * programs
  programs.nm-applet.enable = true;

  programs.xwayland.enable = true;
  programs.hyprland.enable = true;
  programs.vim.enable = true;

}
