{ pkgs, ... }:
let
  libbluray = pkgs.libbluray.override {
    withAACS = true;
    withBDplus = true;
    withJava = true;
    libaacs = pkgs.libaacs;
    libbdplus = pkgs.libbdplus;
    jdk17 = pkgs.jdk17;
    ant = pkgs.ant;
    stripJavaArchivesHook = pkgs.stripJavaArchivesHook;
  };
  myVlc = pkgs.vlc.override { inherit libbluray; };
in
{
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  environment.systemPackages = [
    # Multimedia
    myVlc
    libbluray
    pkgs.libvlc
    pkgs.mpv
    pkgs.haruna
    pkgs.smplayer
    pkgs.clementine
  ];
}
