{ pkgs, userConfig, hostname, lib, ... }: {
  services.minidlna = {
    enable = true;
    settings = {
      media_dir = [
        "/home/${userConfig.name}/public/DLNA"
      ];
      friendly_name = "${hostname} partage !";
      inotify = "yes";
      log_level = "error";
      db_dir = "/var/cache/minidlna";
      log_dir = "/var/log";
    };
    openFirewall = true;
  };

  systemd.services.minidlna.serviceConfig = {
    ProtectHome = "read-only"; # To be able to read files in home directory
    # temporary use my user to access /home -> I have to found a better solution with minidlna user.
    User = lib.mkForce "${userConfig.name}";
    Group = lib.mkForce "users";
  };

  environment.systemPackages = with pkgs; [
    inotify-tools
  ];

  users.users.minidlna = {
    extraGroups = [ "users" ]; # so minidlna can access the files.
  };
}
