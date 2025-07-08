{ pkgs, ... }:
let

  myZoom = pkgs.zoom-us.overrideAttrs {
    buildInputs = with pkgs; [
      ffmpeg
      libva
      libvdpau
    ];
  };

in
{
  programs.zoom-us = {
    enable = true;
    package = myZoom;
  };

  environment = {
    systemPackages = with pkgs; [
      myZoom
    ];

    variables = {
      # Variable interne Zoom (optionnel selon version) pour autoriser la virtual background sans green screen
      #ZOOM_ELECTRON_VIRTUAL_BACKGROUND = "1";
    };
  };
}
