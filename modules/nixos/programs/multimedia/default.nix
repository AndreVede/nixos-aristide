{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Multimedia
    vlc
    mpv
    haruna
    smplayer
    clementine
  ];
}
