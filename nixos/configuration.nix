# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # configuration parts
      ./language.nix
      ./sound.nix
      ./cinnamon.nix
      ./programs.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Aristide-on-road"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    xkb = {
      layout = "fr";
      variant = "";
      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;
    };
  };


  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aristide = {
    isNormalUser = true;
    description = "Zacharie André Aristide Boisnard";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # RAM
  zramSwap = {
    enable = true;
  };

  # Security Layer
  # Firewall
  networking.firewall = {
    # enable or disable firewall
    enable = true;

    # Open ports in the Firewall
    # allowedTCPPorts = [];
    # allowedUDPPorts = [];
  };

  # Enable the OpenSSH daemon. (disable it if no use)
  services.openssh = {
    enable = false;
    #settings = {
    #  X11Forwarding = true;
    #  PermitRootLogin = "no"; # disable root login
    #  PasswordAuthentication = false; # disable password login
    #};
    #openFirewall = true;
  };


  nix = {
    # Auto Clean
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    settings = {
      # Data optimization
      auto-optimise-store = true;

      # Experimental features
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
