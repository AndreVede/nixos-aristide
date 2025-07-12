{ pkgs, ... }: {
  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;

    profile.myConfig = {
      default = true;
      visibleName = "my-config";

      showScrollbar = false;
      font = "JetBrainsMono NF 20";
    };
  };
}
