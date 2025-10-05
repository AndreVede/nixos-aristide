{ pkgs, ... }: {
  home.packages = with pkgs; [
    protonup
  ];

  # run `protonup -d "~/.steam/root/compatibilitytools.d/"`
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "\$HOME/.steam/root/compatibilitytools.d";
  };
}
