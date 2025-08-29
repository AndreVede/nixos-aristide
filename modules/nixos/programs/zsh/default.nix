{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    shellAliases = {
      #...
    };

    setOptions = [
      "AUTO_CD"
    ];

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "git-escape-magic" "gitignore" "dirhistory" "history" "sudo" "bun" "qrcode" "docker" "docker-compose" "eza" ];
    };
  };

  users.defaultUserShell = pkgs.zsh;
  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.shells = with pkgs; [ zsh ];
}
