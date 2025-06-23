{ config, pkgs, lib, ... }:
{
  # your username
  home.username = "aristide";
  # home.homeDirectory = /home/username;

  home.packages = with pkgs; [
    neovim
  ];

  home.file = {
    # .bashrc, ...
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName = "Zacharie André Aristide Boisnard";
    userEmail = "mecazack@gmail.com";
    aliases = {
      fe = "fetch origin";
      pushme = "push -u origin HEAD";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    # zsh variables
    envExtra = ''
      
    '';
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
