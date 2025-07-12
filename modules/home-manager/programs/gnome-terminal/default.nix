{ pkgs, userConfig, ... }: {
  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;

    #profile.${userConfig.name} = {
    #  default = true;
    #  visibleName = "my-config";

    #  showScrollbar = false;
    #  font = "JetBrainsMono NF 20";
    #};
  };
}
