{ lib, nhModules, ... }: {
  imports = [
    "${nhModules}/misc/profile-picture"
    "${nhModules}/common"
    # "${nhModules}/programs/gnome-terminal"
    "${nhModules}/programs/zsh"
    "${nhModules}/programs/git"
    "${nhModules}/programs/vim"
    "${nhModules}/programs/kodi"
    "${nhModules}/programs/jellyfin-client"
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
