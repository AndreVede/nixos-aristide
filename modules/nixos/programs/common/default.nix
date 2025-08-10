{ pkgs, ... }: {

  programs = {
    zsh = {
      enable = true;
    };
    # Install firefox.
    firefox = {
      enable = true;
      languagePacks = [ "fr" ];
    };

    chromium.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    kdeconnect.enable = true;
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      # cli stuff
      vim
      wget
      gitFull
      neofetch
      dust
      duf
      fd
      nnn

      # archives
      zip
      xz
      unzip
      p7zip
      rar
      unrar

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder

      # networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      ipcalc # it is a calculator for the IPv4/v6 addresses

      # misc
      cowsay
      file
      which
      tree
      gnused
      gnutar
      gawk
      zstd
      gnupg

      # nix related
      #
      # it provides the command `nom` works just like `nix`
      # with more details log output
      nix-output-monitor

      # productivity
      hugo # static site generator
      glow # markdown previewer in terminal
      btop # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # system call monitoring
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files

      # system tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb

      # Programation tools
      python3Full
      bun

      # APPS

      # Desk
      anydesk

      # Video and Audio montage
      ffmpeg

      # Reading
      kdePackages.okular

      # Taking notes
      cherrytree

      # Browsers
      brave
      vivaldi
      vivaldi-ffmpeg-codecs

      # Programation
      vscode-fhs
      zed-editor

      # Confidentiality
      bitwarden-desktop

      # Cleanup
      bleachbit
    ];


    variables.EDITOR = "vim";
  };
}
