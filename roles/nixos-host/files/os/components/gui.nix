{ environment, config, pkgs, inputs, ... }: let
  inherit (inputs) home-manager;
in {
  # TODO make cosmic-files the default file manager
  environment.systemPackages = with pkgs; [
    helvum

    alacritty
    fuzzel
    niri

    dbus
    glib
    xdg-utils

  ];

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services = {
    dbus.enable = true;
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
      };
    };
  };



}
