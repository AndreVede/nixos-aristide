{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Design
    gimp3-with-plugins
    krita
    krita-plugin-gmic
    scribus
    inkscape-with-extensions
  ];
}
