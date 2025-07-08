{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Multimedia
    vlc
    smplayer
    clementine
  ];
}
