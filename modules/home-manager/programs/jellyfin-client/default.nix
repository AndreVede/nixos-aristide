{ pkgs, pkgs-unstable, ... }: {

  # Ensure common packages are installed
  home.packages = with pkgs;
    [
      jellyfin-media-player
    ];
}
