{ pkgs, config, ... }:
let
  isGnome = config.services.xserver.desktopManager.gnome.enable;
in
{
  programs.kdeconnect = {
    enable = true;
    package = if isGnome then pkgs.gnomeExtensions.gsconnect else pkgs.kdePackages.kdeconnect-kde;
  };
}
