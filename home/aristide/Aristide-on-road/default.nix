{ nhModules, ... }:
{

  imports = [
    "${nhModules}/common"
    "${nhModules}/desktop/cinnamon"
    "${nhModules}/programs/gnome-terminal"
    "${nhModules}/programs/zsh"
    "${nhModules}/programs/git"
    "${nhModules}/programs/neovim"
    "${nhModules}/programs/vim"
    "${nhModules}/programs/kodi"
    "${nhModules}/virtualisation/qemu"
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
