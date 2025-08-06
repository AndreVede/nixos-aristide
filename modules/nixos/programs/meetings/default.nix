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

    variables = { };
  };
}
