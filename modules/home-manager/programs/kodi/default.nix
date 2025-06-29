{ pkgs, pkgs-unstable, ... }: {


  nixpkgs.config.kodi.enableAdvancedLauncher = true;

  # Ensure common packages are installed
  home.packages = with pkgs;
    [
      kodi
    ];


  home.file = {
    widevine-lib = {
      source = "${pkgs-unstable.widevine-cdm}/share/google/chrome/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so";
      target = ".kodi/cdm/libwidevinecdm.so";
    };
    widevine-manifest = {
      source = "${pkgs-unstable.widevine-cdm}/share/google/chrome/WidevineCdm/manifest.json";
      target = ".kodi/cdm/manifest.json";
    };
  };
}
