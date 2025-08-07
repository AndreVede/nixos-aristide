{ pkgs, lib, ... }: {
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };

    #displayManager = {
    # defaultSession = "none+i3";
    #};

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu # application launcher most people use
        i3status # gives you the default i3 status bar
        i3blocks # if you are planning on using i3blocks over i3status
      ];
    };
  };

  security.pam.services = {
    i3lock.enable = true;
    i3lock-color.enable = true;
    xlock.enable = true;
    xscreensaver.enable = true;
  };

  programs.i3lock.enable = true; # default i3 screen locker

  environment.systemPackages = with pkgs; [
    #---- i3
    lxappearance
    ...
  ];
}
