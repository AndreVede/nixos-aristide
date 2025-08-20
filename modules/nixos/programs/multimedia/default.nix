{ pkgs, ... }:
let
  libbluray = pkgs.libbluray.override {
    withAACS = true;
    withBDplus = true;
  };
  vlc = pkgs.vlc.override { inherit libbluray; };
in
{
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
