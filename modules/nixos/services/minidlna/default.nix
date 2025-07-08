{ pkgs, userConfig, hostname, ... }: {
  services.minidlna = {
    enable = true;
    settings = {
      media_dir = [
        "/home/${userConfig.name}/public/DLNA"
      ];
      friendly_name = "${hostname} partage !";
      inotify = "yes";
      log_level = "error";
    };
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    inotify-tools
  ];

  users.users.minidlna = {
    extraGroups = [ "users" ]; # so minidlna can access the files.
  };
}
