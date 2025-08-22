{ pkgs, ... }: {
  xdg.configFile = {
    "weston.ini".text = ''
      [core]
      idle-time=0

      [shell]
      locking=false
    '';
  };
}
