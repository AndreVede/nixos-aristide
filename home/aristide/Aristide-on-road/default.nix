{ nhModules, outputs, userConfig, pkgs, ... }:
{

  imports = [
    "${nhModules}/programs/neovim"
  ];

  # your username
  home.username = "${userConfig.name}";
  # home.homeDirectory = "/home/${userConfig.name}";

  home.file = {
    # .bashrc, ...
    ".local/share/zsh/zsh-autosuggestions".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
    ".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
  };

  programs.git = {
    enable = true;
    userName = "${userConfig.fullName}";
    userEmail = "${userConfig.email}";
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
