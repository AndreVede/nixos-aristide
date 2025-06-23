{ pkgs, ... }: {

  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    xclip
    python313Packages.pyclip
    weston
  ];

}
