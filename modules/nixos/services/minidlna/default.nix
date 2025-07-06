{ pkgs, userConfig, hostname, ... }: {
  services.minidlna = {
    enable = true;
    settings = {
      media_dir = [
        "/home/${userConfig.name}/DLNA"
      ];
      friendly_name = "${hostname} partage !";
      openFirewall = true;
    };
  };
}
