{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the Cinnamon Desktop Environment.

    displayManager.lightdm.enable = true;
    desktopManager.cinnamon.enable = true;

  };
}
