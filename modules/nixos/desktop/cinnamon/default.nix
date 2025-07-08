{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the Cinnamon Desktop Environment.

    displayManager.lightdm = {
      enable = true;
      background = "../../../files/earth1-bg.jpg";
    };
    desktopManager.cinnamon.enable = true;

  };
}
