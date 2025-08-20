{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the Cinnamon Desktop Environment.

    displayManager.gdm = {
      enable = true;
      settings = {
        background = ../../../../files/earth1-bg.jpg;
      };
    };
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = [
    pkgs.gnome-characters
  ];
}
