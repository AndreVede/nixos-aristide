{ nhModules, ... }:
{

  imports = [
    "${nhModules}/common"
    "${nhModules}/programs/zsh"
    "${nhModules}/programs/git"
    "${nhModules}/programs/neovim"
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
