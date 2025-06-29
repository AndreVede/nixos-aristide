{ pkgs, pkgs-unstable, ... }: {

  # Ensure common packages are installed
  home.packages = with pkgs;
    [
      (pkgs.kodi.withPackages (kodiPkgs: with kodiPkgs; [
        urllib3
        youtube
        invidious
        sponsorblock
        pvr-iptvsimple
        inputstreamhelper
        inputstream-adaptive
        inputstream-ffmpegdirect
      ]))
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
