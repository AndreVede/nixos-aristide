{ lib, nhModules, pkgs, ... }:
{
  imports = [
    "${nhModules}/common"
    "${nhModules}/desktop/cinnamon"
    # "${nhModules}/programs/gnome-terminal"
    "${nhModules}/programs/zsh"
    "${nhModules}/programs/git"
    "${nhModules}/programs/neovim"
    "${nhModules}/programs/vim"
    "${nhModules}/programs/kodi"
    "${nhModules}/virtualisation/qemu"
  ];

  dconf.settings = {

    # alimentation
    "org/cinnamon/settings-daemon/plugins/power" = {
      sleep-display-battery = 1800;
      sleep-display-ac = 1800;
    };

    # Keyboard shortcuts
    "org/cinnamon/desktop/keybindings" = {
      custom-list = [ "custom0" "custom1" "__dummy__" ];
    };

    "org/cinnamon/desktop/keybindings/custom-keybindings/custom0" = {
      binding = [ "<Primary><Alt>s" ];
      command = "waydroid session stop";
      name = "waydroid stop";
    };

    "org/cinnamon/desktop/keybindings/custom-keybindings/custom1" = {
      binding = [ "<Super>g" ];
      command = "weston";
      name = "weston";
    };

    # Keyboard Layout toggle
    "org/gnome/libgnomekbd/keyboard" = {
      options = [ "grptgrp:win_space_toggle" ];
    };
  };

  # specific needs
  home.packages = with pkgs; [
    # AI code editor
    code-cursor-fhs
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
