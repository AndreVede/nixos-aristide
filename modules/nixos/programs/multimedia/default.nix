{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Multimedia
    vlc
    libvlc
    mpv
    haruna
    smplayer
    clementine
  ];
}
