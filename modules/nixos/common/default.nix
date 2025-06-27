{ inputs
, outputs
, lib
, config
, userConfig
, hostname
, pkgs
, nixosModules
, ...
}: {
  imports = [
    "${nixosModules}/common/sound"
    "${nixosModules}/common/language"
    "${nixosModules}/programs/common"
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Register flake inputs for nix commands
  nix.registry = lib.mapAttrs (_: flake: { inherit flake; }) (lib.filterAttrs (_: lib.isType "flake") inputs);

  # Add inputs to legacy channels
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

  # Bootloader
  boot = {
    plymouth = {
      enable = true;
      theme = "hexagon_2";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "hexagon_2" ];
        })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "${hostname}"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };

    # Enable networking
    networkmanager.enable = true;
  };

  # Enables support for Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    xkb = {
      layout = "fr,us";
      variant = ",intl";
      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;
    };
  };


  # Configure console keymap
  console.keyMap = "fr";

  # font
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # RAM
  zramSwap = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userConfig.name} = {
    isNormalUser = true;
    description = "${userConfig.fullName}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
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
}
