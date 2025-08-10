{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    imagemagick
    ghostscript
    ffmpeg
  ];
}
