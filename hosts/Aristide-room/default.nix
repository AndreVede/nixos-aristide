{ config, nixosModules, userConfig, inputs, pkgs, ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # modules
      "${nixosModules}/common"
      # desktop
      "${nixosModules}/desktop/gnome"
      # services
      "${nixosModules}/services/autoupgrade-native"
      "${nixosModules}/services/printer"
      # programs
      "${nixosModules}/programs/kdeconnect"
      "${nixosModules}/programs/multimedia"
      # hardware
      "${nixosModules}/hardware/graphics"
    ];

  # Security Layer
  # Firewall
  networking.firewall = {
    # enable or disable firewall
    enable = true;

    # Open ports in the Firewall
    allowedTCPPorts = [ 8080 ];
    allowedUDPPorts = [ 8080 ];
  };

  # Enable the OpenSSH daemon. (disable it if no use)
  services.openssh = {
    enable = true;
    settings = {
      AllowUsers = null;
      X11Forwarding = true;
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = true;
      UseDns = true;
    };
    openFirewall = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
